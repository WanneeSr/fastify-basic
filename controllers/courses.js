const { query } = require('../config/db');

const createCourses = async (req, res) => {
    try{
        const { course_title, course_detail, create_by } = req.body;

        const created_at = new Date();
        const sql = `INSERT INTO courses (course_title, course_detail, create_by, created_at) VALUES (?, ?, ?, ?)`;
        const values = [course_title, course_detail, create_by, created_at];

        const data = await query(sql, values);
        res.status(201).send({
            message: 'Course created successfully.',
            course_id: data.insertId
        });
    }
    catch (error) {
        console.error('Error creating course:', error);
        res.status(500).send({
            message: 'Internal server error while creating course.',
            error: error.message
        });
    }
}

const getCourses = async (req, res) => {
    try {
        const sql = `SELECT * FROM courses`;
        const data = await query(sql);
        res.status(200).send(data);
    } catch (error) {
        console.error('Error fetching courses:', error);
        res.status(500).send({
            message: 'Internal server error while fetching courses.',
            error: error.message
        });
    }
}

const getCourseById = async (req, res) => {
    try {
        const { course_id } = req.params;
        const sql = `SELECT * FROM courses WHERE course_id = ?`;
        const data = await query(sql, [course_id]);
        res.status(200).send(data);
    } catch (error) {
        console.error('Error fetching course by ID:', error);
        res.status(500).send({
            message: 'Internal server error while fetching course by ID.',
            error: error.message
        });
    }
}

const updateCourses = async (req, res) => {
    try {
        const { course_id } = req.params;
        const { course_title, course_detail, create_by } = req.body;

        const updated_at = new Date();
        const sql = `UPDATE courses SET course_title = ?, course_detail = ?, create_by = ?, updated_at = ? WHERE course_id = ?`;
        const values = [course_title, course_detail, create_by, updated_at, course_id];

        await query(sql, values);
        res.status(200).send({
            message: 'Course updated successfully.'
        });
    } catch (error) {
        console.error('Error updating course:', error);
        res.status(500).send({
            message: 'Internal server error while updating course.',
            error: error.message
        });
    }
}

const deleteCourses = async (req, res) => {
    try {
        const { course_id } = req.params;
        const sql = `UPDATE courses SET course_status = 2 WHERE course_id = ?`;
        await query(sql, [course_id]);
        res.status(200).send({
            message: 'Course deleted successfully.'
        });
    } catch (error) {
        console.error('Error deleting course:', error);
        res.status(500).send({
            message: 'Internal server error while deleting course.',
            error: error.message
        });
    }
}

module.exports = {
    createCourses,
    getCourses,
    getCourseById,
    updateCourses,
    deleteCourses
}