const exercises = require('../controllers/exercises');

async function exercisesRoutes(fastify, options) {
    fastify.post('/create/exercise', exercises.createExercises);
    fastify.get('/get/exercises', exercises.getExercises);
    fastify.get('/get/exercises/:exercise_id', exercises.getExercisesById);
    fastify.put('/update/exercise/:exercise_id', exercises.updateExercises);
    fastify.delete('/delete/exercise/:exercise_id', exercises.deleteExercises);
}

module.exports = exercisesRoutes;