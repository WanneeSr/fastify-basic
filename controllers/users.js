const { query } = require('../config/db');
const bcrypt = require('bcrypt');

const getUsers = async (req, res) => {
    try {
        const sql = `SELECT
            users.user_id, 
            users.email, 
            users.first_name, 
            users.last_name, 
            users.user_role, 
            users.user_thumnail, 
            users.user_status, 
            users.create_at, 
            users.updated_at FROM users`;

        const rows = await query(sql);
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

        res.status(200).send({message: 'Register is Success!', user_id: rows.insertId});
    } catch (error) {
        res.status(500).send(error);
    }
}

module.exports = {
    getUsers,
    createUsers,
}