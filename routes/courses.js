const courses = require('../controllers/courses');

async function coursesRoutes(fastify, options) {
  fastify.post('/create/courses', courses.createCourses);
  fastify.get('/get/courses', courses.getCourses);
  fastify.get('/get/course/:course_id', courses.getCourseById);
  fastify.put('/update/course/:course_id', courses.updateCourses);
  fastify.delete('/delete/course/:course_id', courses.deleteCourses);
}

module.exports = coursesRoutes;