const { query } = require('../config/db');
const moment = require('moment');
const bcrypt = require('bcrypt');

const getUsers = async (req, res) => {
    try {
        const sql = `
            SELECT
	users.user_id,
	users.username,
	users.email,
	roles.role_name,
	users.created_at,
	users.thumbnail,
	users.updated_at 
FROM
	users
	LEFT JOIN user_role ON users.user_id = user_role.user_id
	LEFT JOIN roles ON user_role.role_id = roles.role_id
        `;

        const rows = await query(sql);
        res.send(rows);
    } catch (error) {
        res.status(500).send({ message: error.message });
    }
};


const getUserById = async (req, res) => {
    try {
        const { user_id } = req.params;
        const sql = `SELECT
	users.user_id,
	users.username,
	users.email,
	users.thumbnail,
	users.created_at,
	users.updated_at,
	user_role.role_id,
	roles.role_name 
FROM
	users
	LEFT JOIN user_role ON users.user_id = user_role.user_id
	LEFT JOIN roles ON user_role.role_id = roles.role_id 
WHERE
	users.user_id = ?`;
        const rows = await query(sql, [user_id]);
        res.send(rows);
    } catch (error) {
        res.status(500).send(error);
    }
}

const createUsers = async (req, res) => {
    try {
        const { email, password_hash, username} = req.body;
        const hashedPassword = await bcrypt.hash(password_hash, 10);

        const sql = `INSERT INTO users(username, email, password_hash, created_at) VALUES(?, ?, ?, ?)`;
        const values = [username, email, hashedPassword, new Date()];
        const rows = await query(sql, values);

        res.status(201).send({
            message: 'User created successfully.',
            user_id: rows.insertId
        });
    } catch (error) {
        console.error('Error creating user:', error);
        res.status(500).send({
            message: 'Internal server error while creating user.',
            error: error.message
        });
    }
}

const updateUserById = async (req, res) => {
    try {
        const { user_id } = req.params;
        const { email, password_hash, username } = req.body;

        const hashedPassword = await bcrypt.hash(password_hash, 10);

        const sql = `UPDATE users SET email = ?,
                        password_hash = ?,
                        username = ?
                        WHERE user_id = ?`;
        const values = [email, hashedPassword, username, user_id];
        const data = await query(sql, values);
        res.status(200).send({
            message: 'User updated successfully.'
        });
    } catch (error) {
        console.error('Error updating user:', error);
        res.status(500).send({
            message: 'Internal server error while updating user.',
            error: error.message
        });
    }
}

const deleteUserById = async (req, res) => {
    try {
        const { user_id } = req.params;
        const sql = `UPDATE users SET updated_at = ? WHERE user_id = ?`;
        const values = [new Date(), user_id];
        const rows = await query(sql, values);
        res.status(200).send({
            message: 'User deleted successfully.'
        });
    } catch (error) {
        console.error('Error deleting user:', error);
        res.status(500).send({
            message: 'Internal server error while deleting user.',
            error: error.message
        });
    }
}

async function verify(token) {
    const ticket = await client.verifyIdToken({
        idToken: token,
        audience: process.env.CLIENT_ID,  // Specify the CLIENT_ID of the app that accesses the backend
    });
    const payload = ticket.getPayload();
    const userid = payload['sub'];
    return userid;
}

const login = async (req, res, fastify) => {
    const { email, password_hash } = req.body;
    // ตรวจสอบข้อมูลที่รับจาก client
    console.log('Request received with email:', email, 'and password_hash:', password_hash);
    if (!email || !password_hash) {
        return res.status(400).send({
            status: 400,
            message: 'Email and password_hash are required',
            data: []
        });
    }

    try {
        // ค้นหาผู้ใช้
        const users = await query(`SELECT * FROM users WHERE email = ?`, [email]);
        if (users.length === 0) {
            await logLoginAttempt(null, email, 'fail', 'User not found'); //บันทึกการพยายามเข้าระบบ
            return res.status(401).send({
                status: 401,
                message: 'Invalid email or password',
                data: []
            });
        }
        // สร้าง hash ใหม่จาก password
        const hash = await bcrypt.hash(password_hash, 10);

        const user = users[0];


        const match = await bcrypt.compare(password_hash, hash);
        console.log('Password match:', match);

        if (!match) {
            await logLoginAttempt(user.user_id, email, 'fail', 'Incorrect password');
            return res.status(401).send({
                status: 401,
                message: 'Invalid email or password',
                data: []
            });
        }

        await logLoginAttempt(user.user_id, email, 'success', 'Login successful');

        const token = fastify.jwt.sign({
            user_id: user.user_id,
            email: user.email,
            role_id: user.role_id,
            role_name: user.role_name,
            iat: moment().unix(),
            exp: moment().add(1440, 'minutes').unix()
        });

        return res.status(200).send({
            status: 200,
            message: 'Login successful',
            data: {
                user_id: user.user_id,
                email: user.email,
                role_id: user.role_id,
                role_name: user.role_name,
                token: token
            }
        });

    } catch (error) {
        console.error('Login error:', error);
        return res.status(500).send({
            status: 500,
            message: 'Internal server error',
            data: []
        });
    }
};

// 🧾 ฟังก์ชันบันทึก log การ login
const logLoginAttempt = async (user_id, email, status, note) => {
    const sql = `INSERT INTO event_logs (event_type, severity, message, metadata, created_by, created_at) VALUES (?, ?, ?, ?, ?, ?)`;

    const metadata = {
        email: email,
        status: status,
        note: note
    };

    const values = [
        status === 'success' ? 'login_success' : 'login_failure', // แยก event_type
        status === 'success' ? 'info' : 'warning',               // severity เป็น 'info' สำหรับ success, 'warning' สำหรับ failure
        `Login ${status}: ${email}`,
        JSON.stringify(metadata),
        user_id,
        new Date()
    ];

    await query(sql, values);
};


const register = async (req, res) => {
    const { email, password_hash, confirmpassword, username } = req.body;
    console.log('Register request:', req.body);

    if (!email || !password_hash || !confirmpassword || !username) {
        return res.status(400).send({
            status: 400,
            message: 'All fields are required',
        });
    }

    if (password !== confirmpassword) {
        return res.status(400).send({
            status: 400,
            message: 'Passwords do not match',
        });
    }

    try {
        // ตรวจสอบว่า email ซ้ำหรือไม่
        const users = await query(`SELECT * FROM users WHERE email = ?`, [email]);
        if (users.length > 0) {
            return res.status(409).send({
                status: 409,
                message: 'Email is already in use',
            });
        }

        // เข้ารหัสรหัสผ่าน
        const hashedPassword = await bcrypt.hash(password_hash, 10);
        const sql = `INSERT INTO users (email, password_hash, username) VALUES (?, ?, ?)`;
        const values = [email, hashedPassword, username];

        // เพิ่มผู้ใช้งานใหม่
        const result = await query(sql, values);

        // บันทึก event log
        const logQuery = `
            INSERT INTO event_logs (event_type, severity, message, metadata, created_by, created_at)
            VALUES (?, ?, ?, ?, ?, ?)
        `;
        const logValues = [
            'register',               // event_type
            'INFO',                   // severity
            `New user registered: ${email}`,  // message
            JSON.stringify({ email, username }),  // metadata
            result.insertId,         // created_by
            new Date()               // created_at
        ];
        await query(logQuery, logValues);

        // ตอบกลับ frontend
        return res.status(201).send({
            status: 201,
            message: 'Registration successful',
            data: {
                user_id: result.insertId,
                email,
                username,
            }
        });

    } catch (error) {
        console.error('Error during registration:', error);
        return res.status(500).send({
            status: 500,
            message: 'Internal server error',
        });
    }
};



module.exports = {
    getUsers,
    getUserById,
    createUsers,
    updateUserById,
    deleteUserById,
    login,
    register,
    verify
}