const { query } = require('../config/db');
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
    try{
        const {user_id} = req.params;
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
        const rows = await query(sql,[user_id]);
        res.send(rows);
    }catch (error){
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
    try{
        const { user_id } = req.params;
        const { email, password, first_name, last_name} = req.body;

        const hashedPassword = await bcrypt.hash(password, 10);

        const sql = `UPDATE users SET email = ?,
                        password = ?,
                        first_name = ?,
                        last_name = ?
                        WHERE user_id = ?`;
        const values = [email, hashedPassword, first_name, last_name, user_id];
        const data = await query(sql, values);
        res.status(201).send({message: 'Updated!'})
    }catch(error){
        res.status(500).send(error);
    }
}

const deleteUserById = async (req, res) => {
    try{
        const { user_id } = req.params;
        const sql = `UPDATE users SET user_status = 0 WHERE user_id = ?`;
        const rows = await query(sql,[user_id]);
        res.status(200).send({message: `User ID ${rows.insertId} is DELETED!`});
    }catch(error){
        res.status(500).send(error);
    }
}

module.exports = {
    getUsers,
    getUserById,
    createUsers,
    updateUserById,
    deleteUserById
}