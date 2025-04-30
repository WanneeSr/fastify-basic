const lessons = require('../controllers/lessons');

async function lessonsRoutes(fastify, options) {
    fastify.post('/create/lessons', lessons.createLessons);
    fastify.get('/get/lessons', lessons.getLessons);
    fastify.get('/get/lesson/:lesson_id', lessons.getLessonById);
    fastify.put('/update/lesson/:lesson_id', lessons.updateLessons);
    fastify.delete('/delete/lesson/:lesson_id', lessons.deleteLessons);
}

module.exports = lessonsRoutes;