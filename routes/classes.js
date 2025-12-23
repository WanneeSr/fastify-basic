const classes = require('../controllers/classes');

async function classesRoutes(fastify, options) {
  fastify.post('/create/classes', classes.createClasses);
  fastify.get('/get/classes', classes.getClasses);
  fastify.get('/get/course/:course_id', classes.getClassesById);
  fastify.put('/update/course/:course_id', classes.updateClasses);
  fastify.delete('/delete/course/:course_id', classes.deleteClasses);
}

module.exports = classesRoutes;