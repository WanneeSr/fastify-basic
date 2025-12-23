const { query } = require('../config/db');

const createExercises = async (req, res) => {
    try {
        const { exercise_title, exercise_detail, section_id, create_by } = req.body;
    }
    catch (error) {
        console.error('Error creating exercises:', error);
        res.status(500).send({
            message: 'Internal server error while creating exercises.',
            error: error.message
        });
    }
}

const getExercises = async (req, res) => {    
    try {
        const sql = `SELECT
	exercises.exercise_id,
	exercises.lesson_id,
	exercises.title,
	exercises.description,
	exercises.max_score,
	exercises.deadline 
FROM
	exercises`;
        const data = await query(sql);
        res.status(200).send(data);
    } catch (error) {
        console.error('Error fetching exercises:', error);
        res.status(500).send({
            message: 'Internal server error while fetching exercises.',
            error: error.message
        });
    }
}

const getExercisesById = async (req, res) => {
    try {
        const { exercise_id } = req.params;
        const sql = `SELECT * FROM exercises WHERE exercise_id = ?`;
        const data = await query(sql, [exercise_id]);
        res.status(200).send(data);
    } catch (error) {
        console.error('Error fetching exercise by ID:', error);
        res.status(500).send({
            message: 'Internal server error while fetching exercise by ID.',
            error: error.message
        });
    }
}

const updateExercises = async (req, res) => {
    try {
        const { exercise_id } = req.params;
        const { exercise_title, exercise_detail, section_id, create_by } = req.body;
        const updated_at = new Date();
        const sql = `UPDATE exercises SET exercise_title = ?, exercise_detail = ?, section_id = ?, create_by = ?, updated_at = ? WHERE exercise_id = ?`;
        const values = [exercise_title, exercise_detail, section_id, create_by, updated_at, exercise_id];
        const data = await query(sql, values);
        res.status(200).send({
            message: 'Exercise updated successfully.',
            exercise_id: data.insertId
        });
    }catch (error) {
        console.error('Error updating exercise:', error);
        res.status(500).send({
            message: 'Internal server error while updating exercise.',
            error: error.message
        });
    }
}

const deleteExercises = async (req, res) => {
    try {
        const { exercise_id } = req.params;
        const sql = `UPDATE exercises SET exercise_status = 2 WHERE exercise_id = ?`;
        const values = [exercise_id];
        const data = await query(sql, values);
        res.status(200).send({
            message: 'Exercise deleted successfully.',
            exercise_id: data.insertId
        });
    } catch (error) {
        console.error('Error deleting exercise:', error);
        res.status(500).send({
            message: 'Internal server error while deleting exercise.',
            error: error.message
        });
    }
}

module.exports = {
    createExercises,
    getExercises,
    getExercisesById,
    updateExercises,
    deleteExercises
}