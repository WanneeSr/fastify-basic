const { query } = require('../config/db');
const moment = require('moment');
const bcrypt = require('bcrypt');

const getUsers = async (req, res) => {
    try {
        const sql = `SELECT
	        user_id, 
	        email, 
	        first_name, 
	        last_name, 
	        user_profile, 
	        user_role, 
	        user_status, 
	        created_at, 
	        updated_at
            FROM users`;

        const rows = await query(sql);
        res.send(rows);
    } catch (error) {
        res.status(500).send(error);
    }
}

const getUserById = async (req, res) => {
    try {
        const { user_id } = req.params;
        const sql = `SELECT
	        user_id, 
	        email, 
	        first_name, 
	        last_name, 
	        user_profile, 
	        user_role, 
	        user_status, 
	        created_at, 
	        updated_at
            FROM users WHERE user_id = ?`;
        const rows = await query(sql, [user_id]);
        res.send(rows);
    } catch (error) {
        res.status(500).send(error);
    }
}

const createUsers = async (req, res) => {
    try {
        const { email, password, first_name, last_name } = req.body;
        const hashedPassword = await bcrypt.hash(password, 10);

        const sql = `INSERT INTO users(email, password, first_name, last_name) VALUES(?, ?, ?, ?)`;
        const values = [email, hashedPassword, first_name, last_name];
        const rows = await query(sql, values);

        res.status(200).send({ message: 'Register is Success!', user_id: rows.insertId });
    } catch (error) {
        res.status(500).send(error);
    }
}

const updateUserById = async (req, res) => {
    try {
        const { user_id } = req.params;
        const { email, password, first_name, last_name } = req.body;

        const hashedPassword = await bcrypt.hash(password, 10);

        const sql = `UPDATE users SET email = ?,
                        password = ?,
                        first_name = ?,
                        last_name = ?
                        WHERE user_id = ?`;
        const values = [email, hashedPassword, first_name, last_name, user_id];
        const data = await query(sql, values);
        res.status(201).send({ message: 'Updated!' })
    } catch (error) {
        res.status(500).send(error);
    }
}

const deleteUserById = async (req, res) => {
    try {
        const { user_id } = req.params;
        const sql = `UPDATE users SET user_status = 0 WHERE user_id = ?`;
        const rows = await query(sql, [user_id]);
        res.status(200).send({ message: `User ID ${rows.insertId} is DELETED!` });
    } catch (error) {
        res.status(500).send(error);
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
    const { email, password } = req.body;
    // ตรวจสอบข้อมูลที่รับจาก client
    console.log('Request received with email:', email, 'and password:', password);
    if (!email || !password) {
        return res.status(400).send({
            status: 400,
            message: 'Email and password are required',
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
        const hash = await bcrypt.hash(password, 10);

        const user = users[0];


        const match = await bcrypt.compare(password, hash);
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
            user_status: user.user_status,
            first_name: user.first_name,
            last_name: user.last_name,
            iat: moment().unix(),
            exp: moment().add(1440, 'minutes').unix()
        });

        return res.status(200).send({
            status: 200,
            message: 'Login successful',
            data: {
                user_id: user.user_id,
                email: user.email,
                first_name: user.first_name,
                last_name: user.last_name,
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
    const { email, password, confirmpassword, first_name, last_name } = req.body;
    console.log('Register request:', req.body);

    if (!email || !password || !confirmpassword || !first_name || !last_name) {
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
        const hashedPassword = await bcrypt.hash(password, 10);
        const sql = `INSERT INTO users (email, password, first_name, last_name) VALUES (?, ?, ?, ?)`;
        const values = [email, hashedPassword, first_name, last_name];

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
            JSON.stringify({ email, first_name, last_name }),  // metadata
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
                first_name,
                last_name
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