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
    const sql = `SELECT * FROM users WHERE email = ?`;
    
    try {
        let result = await query(sql, [email]);

        if (result.length === 0) {
            // ถ้าไม่พบผู้ใช้ในระบบ
            return res.status(400).send({
                status: 400,
                message: 'User not found',
                data: []
            });
        }

        // ตรวจสอบรหัสผ่าน
        const user = result[0];
        const passwordMatch = await bcrypt.compare(password, user.password);

        if (!passwordMatch) {
            // ถ้ารหัสผ่านไม่ถูกต้อง
            return res.status(400).send({
                status: 400,
                message: 'Invalid password',
                data: []
            });
        }
        // ถ้ารหัสผ่านถูกต้อง
        const token = fastify.jwt.sign({ 
            user_id: user.user_id,
            email: user.email,
            first_name: user.first_name,
            last_name: user.last_name,
            user_profile: user.user_profile,
            iat: moment().unix(),
            exp: moment().add(1440, 'minutes').unix()
         });
         return res.status(200).send({
            status: user.status == 0 ? 403 : 200,
            message: 'Success',
            data: {
                user_id: user.user_id,
                email: user.email,
                first_name: user.first_name,
                last_name: user.last_name,
                user_profile: user.user_profile,
                user_status: user.user_status,
                token: token
            }
        });
    } catch (error) {
        console.error('Error during login:', error);
        return res.status(500).send({
            status: 500,
            message: 'Internal server error',
            data: []
        });
    }
}

const register = async (req, res) => {
    const { email, password, confirmpassword, first_name, last_name } = req.body;

    if (!email || !password || !confirmpassword || !first_name || !last_name) {
        return res.status(400).send({
            status: 400,
            message: 'All fields are required',
            data: []
        });
    }

    if (password !== confirmpassword) {
        return res.status(400).send({
            status: 400,
            message: 'Passwords do not match',
            data: []
        });
    }

    try {
        // ตรวจสอบ email ซ้ำ
        const [users] = await query(`SELECT id FROM users WHERE email = ?`, [email]);
        if (users.length > 0) {
            return res.status(409).send({
                status: 409,
                message: 'Email is already in use',
                data: []
            });
        }

        const hashedPassword = await bcrypt.hash(password, 10);
        const sql = `INSERT INTO users (email, password, first_name, last_name) VALUES (?, ?, ?, ?)`;
        const values = [email, hashedPassword, first_name, last_name];

        const result = await query(sql, values);

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
            data: []
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
    register
}