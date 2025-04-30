const { query } = require('../config/db');

const createLessons = async (req, res) => {
    try {
        const { lesson_title, lesson_detail, section_id, create_by } = req.body;

        const created_at = new Date();
        const sql = `INSERT INTO lessons (lesson_title, lesson_detail, section_id, create_by, created_at) VALUES (?, ?, ?, ?, ?)`;
        const values = [lesson_title, lesson_detail, section_id, create_by, created_at];

        const data = await query(sql, values);
        res.status(201).send({
            message: 'Lesson created successfully.',
            lesson_id: data.insertId
        });

    } catch (error) {
        console.error('Error creating lessons:', error);
        res.status(500).send({
            message: 'Internal server error while creating lessons.',
            error: error.message
        });
    }
}

const getLessons = async (req, res) => {
    try {
        const sql = `SELECT * FROM lessons`;
        const data = await query(sql);
        res.status(200).send(data);
    } catch (error) {
        console.error('Error fetching lessons:', error);
        res.status(500).send({
            message: 'Internal server error while fetching lessons.',
            error: error.message
        });
    }
}

const getLessonById = async (req, res) => {
    try {
        const { lesson_id } = req.params;
        const sql = `SELECT * FROM lessons WHERE lesson_id = ?`;
        const data = await query(sql, [lesson_id]);
        res.status(200).send(data);
    } catch (error) {
        console.error('Error fetching lesson by ID:', error);
        res.status(500).send({
            message: 'Internal server error while fetching lesson by ID.',
            error: error.message
        });
    }
}

const updateLessons = async (req, res) => {
    try {
        const { lesson_id } = req.params;
        const { lesson_title, lesson_detail, section_id, create_by } = req.body;

        const updated_at = new Date();
        const sql = `UPDATE lessons SET lesson_title = ?, lesson_detail = ?, section_id = ?, create_by = ?, updated_at = ? WHERE lesson_id = ?`;
        const values = [lesson_title, lesson_detail, section_id, create_by, updated_at, lesson_id];

        await query(sql, values);
        res.status(200).send({
            message: 'Lesson updated successfully.',
            lesson_id: lesson_id
        });
    } catch (error) {
        console.error('Error updating lessons:', error);
        res.status(500).send({
            message: 'Internal server error while updating lessons.',
            error: error.message
        });
    }
}

const deleteLessons = async (req, res) => {
    try {
        const { lesson_id } = req.params;
        const sql = `UPDATE lessons SET lesson_status = 2 WHERE lesson_id = ?`;
        await query(sql, [lesson_id]);
        res.status(200).send({
            message: 'Lesson deleted successfully.',
            lesson_id: lesson_id
        });
    } catch (error) {
        console.error('Error deleting lessons:', error);
        res.status(500).send({
            message: 'Internal server error while deleting lessons.',
            error: error.message
        });
    }
}

module.exports = {
    createLessons,
    getLessons,
    getLessonById,
    updateLessons,
    deleteLessons
}