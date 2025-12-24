const logs = require('../controllers/logs');

async function logsRoutes(fastify, options) {
  fastify.post('/create/logs', logs.createLog);
  fastify.get('/get/logs', logs.getLogs);

}

module.exports = logsRoutes;