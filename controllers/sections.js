const { query } = require('../config/db');

const createSections = async (req, res) => {
    try{
        const { section_title, course_id, create_by } = req.body;

        const created_at = new Date();
        const sql = `INSERT INTO sections (section_title, course_id, create_by, created_at) VALUES (?, ?, ?, ?)`;
        const values = [section_title, course_id, create_by, created_at];

        const data = await query(sql, values);
        res.status(201).send({
            message: 'Section created successfully.',
            section_id: data.insertId
        });

    } catch (error) {
        console.error('Error creating sections:', error);
        res.status(500).send({
            message: 'Internal server error while creating sections.',
            error: error.message
        });
    }
}

const getSections = async (req, res) => {
    try {
        const sql = `SELECT
	sections.section_id, 
	sections.lesson_id, 
	sections.title, 
	sections.content, 
	sections.order_no
FROM
	sections`;
        const data = await query(sql);
        res.status(200).send(data);
    } catch (error) {
        console.error('Error fetching sections:', error);
        res.status(500).send({
            message: 'Internal server error while fetching sections.',
            error: error.message
        });
    }
}

const getSectionById = async (req, res) => {
    try {
        const { section_id } = req.params;
        const sql = `SELECT
	sections.section_id, 
	sections.lesson_id, 
	sections.title, 
	sections.content, 
	sections.order_no
FROM
	sections WHERE section_id = ?`;
        const data = await query(sql, [section_id]);
        res.status(200).send(data);
    } catch (error) {
        console.error('Error fetching section by ID:', error);
        res.status(500).send({
            message: 'Internal server error while fetching section by ID.',
            error: error.message
        });
    }
}

const updateSections = async (req, res) => {
    try {
        const { section_id } = req.params;
        const { title } = req.body;

        const updated_at = new Date();
        const sql = `UPDATE sections SET title = ?, updated_at = ? WHERE section_id = ?`;
        const values = [title, updated_at, section_id];

        const data = await query(sql, values);
        res.status(200).send({
            message: 'Section updated successfully.',
            section_id: section_id
        });
    } catch (error) {
        console.error('Error updating sections:', error);
        res.status(500).send({
            message: 'Internal server error while updating sections.',
            error: error.message
        });
    }
}

const deleteSections = async (req, res) => {
    try {
        const { section_id } = req.params;
        const sql = `UPDATE sections SET section_status = 2 WHERE section_id = ?`;
        await query(sql, [section_id]);
        res.status(200).send({
            message: 'Section deleted successfully.'
        });
    } catch (error) {
        console.error('Error deleting sections:', error);
        res.status(500).send({
            message: 'Internal server error while deleting sections.',
            error: error.message
        });
    }
}

// const getSectionByCourseId  = async (req, res) => {
//     try {
//         const { course_id } = req.params;
//         const sql = `SELECT * FROM `;

//     } catch (error) {
        
//     }
// }

module.exports = {
    createSections,
    getSections,
    getSectionById,
    updateSections,
    deleteSections
}