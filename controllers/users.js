const { query } = require('../config/db');
const moment = require('moment');
const bcrypt = require('bcrypt');
const crypto = require('crypto');
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
        // ค้นหาผู้ใช้พร้อม role
        const users = await query(`
            SELECT 
                users.user_id,
                users.username,
                users.email,
                users.password_hash,
                user_role.role_id,
                roles.role_name
            FROM users
            LEFT JOIN user_role ON users.user_id = user_role.user_id
            LEFT JOIN roles ON user_role.role_id = roles.role_id
            WHERE users.email = ?
        `, [email]);
        if (users.length === 0) {
            await logLoginAttempt(null, email, 'fail', 'User not found'); //บันทึกการพยายามเข้าระบบ
            return res.status(401).send({
                status: 401,
                message: 'Invalid email or password',
                data: []
            });
        }
        const user = users[0];

        // เปรียบเทียบ password ที่ส่งมาด้วย hash ที่เก็บในฐานข้อมูล
        const match = await bcrypt.compare(password_hash, user.password_hash);
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

/**
 * hash email เพื่อใช้ debug โดยไม่รู้ email จริง
 */
const hashValue = (value) => {
    if (!value) return null;
    return crypto.createHash('sha256').update(value).digest('hex');
};
/**
 * บันทึก log การ login
 */
const logLoginAttempt = async (user_id, status, note = null, req = null) => {

    const action = status === 'success'
        ? 'LOGIN_SUCCESS'
        : 'LOGIN_FAILURE';

    const log_level = status === 'success'
        ? 'INFO'
        : 'WARN';

    const metadata = {
        result: status,
        note: note || undefined,
        source: 'auth',
        email_hash: req?.body?.email
            ? hashValue(req.body.email)
            : undefined
    };

    const sql = `
        INSERT INTO logs (
            user_id,
            action,
            action_detail,
            module,
            log_level,
            ip_address,
            user_agent,
            metadata,
            created_at
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    const values = [
        user_id || null,
        action,
        `User login ${status}`,
        'auth',
        log_level,
        req?.ip || null,
        req?.headers?.['user-agent'] || null,
        JSON.stringify(metadata),
        new Date()
    ];

    await query(sql, values);
};

const register = async (req, res) => {
    const { email, password_hash, confirmpassword, username } = req.body;

    if (!email || !password_hash || !confirmpassword || !username) {
        return res.status(400).send({
            status: 400,
            message: 'All fields are required',
        });
    }

    if (password_hash !== confirmpassword) {
        return res.status(400).send({
            status: 400,
            message: 'Passwords do not match',
        });
    }

    try {
        // ตรวจสอบ email ซ้ำ
        const users = await query(
            `SELECT user_id FROM users WHERE email = ?`,
            [email]
        );

        if (users.length > 0) {
            return res.status(409).send({
                status: 409,
                message: 'Email is already in use',
            });
        }

        // hash password
        const hashedPassword = await bcrypt.hash(password_hash, 10);

        // create user
        const sql = `
            INSERT INTO users (email, password_hash, username)
            VALUES (?, ?, ?)
        `;
        const values = [email, hashedPassword, username];
        const result = await query(sql, values);

        /* ======================
           CREATE LOG (SAFE)
        ====================== */
        const logSql = `
            INSERT INTO logs (
                user_id,
                action,
                action_detail,
                module,
                log_level,
                ip_address,
                user_agent,
                metadata,
                created_at
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        `;

        const metadata = {
            email_hash: hashValue(email),
            username_hash: hashValue(username),
            source: 'register'
        };

        const logValues = [
            result.insertId,
            'REGISTER_SUCCESS',
            'New user registered',
            'auth',
            'INFO',
            req.ip || null,
            req.headers['user-agent'] || null,
            JSON.stringify(metadata),
            new Date()
        ];

        await query(logSql, logValues);

        // response
        return res.status(201).send({
            status: 201,
            message: 'Registration successful',
            data: {
                user_id: result.insertId,
                username
            }
        });

    } catch (error) {
        console.error('Error during registration:', error);

        // log error (optional)
        await query(
            `
            INSERT INTO logs (
                action,
                action_detail,
                module,
                log_level,
                metadata,
                created_at
            ) VALUES (?, ?, ?, ?, ?, ?)
            `,
            [
                'REGISTER_ERROR',
                'Error during registration',
                'auth',
                'ERROR',
                JSON.stringify({ error: error.message }),
                new Date()
            ]
        );

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