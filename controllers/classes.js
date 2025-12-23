const { query } = require('../config/db');

const createClasses = async (req, res) => {
    try {
        const { class_name, description, created_by } = req.body;

        const created_at = new Date();
        const sql = `INSERT INTO class (class_name, description, created_by, created_at) VALUES (?, ?, ?, ?)`;
        const values = [class_name, description, created_by, created_at];
        const data = await query(sql, values);
        res.status(201).send({
            message: 'Class created successfully.',
            class_id: data.insertId
        });
    }
    catch (error) {
        console.error('Error creating class:', error);
        res.status(500).send({
            message: 'Internal server error while creating class.',
            error: error.message
        });
    }
}

const getClasses = async (req, res) => {
    try {
        const sql = `SELECT
	class.*,
	users.username,
	roles.role_name 
FROM
	class
	LEFT JOIN class_user ON class.class_id = class_user.class_id
	LEFT JOIN users ON class.created_by = users.user_id 
	AND class_user.user_id = users.user_id
	LEFT JOIN class_role ON class.class_id = class_role.class_id
	LEFT JOIN roles ON class_role.role_id = roles.role_id`;
        const data = await query(sql);
        res.status(200).send(data);
    } catch (error) {
        console.error('Error fetching classes:', error);
        res.status(500).send({
            message: 'Internal server error while fetching classes.',
            error: error.message
        });
    } 
}

const getClassesById = async (req, res) => {
    try {
        const { class_id } = req.params;
        const sql = `SELECT * FROM class WHERE class_id = ?`;
        const data = await query(sql, [class_id]);
        res.status(200).send(data);
    } catch (error) {
        console.error('Error fetching class by ID:', error);
        res.status(500).send({
            message: 'Internal server error while fetching class by ID.',
            error: error.message
        });
    }
}

const updateClasses = async (req, res) => {
    try {
        const { class_id } = req.params;
        const { class_name, description, created_by } = req.body;

        const updated_at = new Date();
        const sql = `UPDATE class SET class_name = ?, description = ?, created_by = ?, updated_at = ? WHERE class_id = ?`;
        const values = [class_name, description, created_by, updated_at, class_id];

        await query(sql, values);
        res.status(200).send({
            message: 'Class updated successfully.'
        });
    } catch (error) {
        console.error('Error updating class:', error);
        res.status(500).send({
            message: 'Internal server error while updating class.',
            error: error.message
        });
    }
}

const deleteClasses = async (req, res) => {
    try {
        const { class_id } = req.params;
        const sql = `UPDATE class SET class_status = 2 WHERE class_id = ?`;
        await query(sql, [class_id]);
        res.status(200).send({
            message: 'Class deleted successfully.'
        });
    } catch (error) {
        console.error('Error deleting class:', error);
        res.status(500).send({
            message: 'Internal server error while deleting class.',
            error: error.message
        });
    }
}

module.exports = {
    createClasses,
    getClasses,
    getClassesById,
    updateClasses,
    deleteClasses
}