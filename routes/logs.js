const logs = require('../controllers/logs');

async function logsRoutes(fastify, options) {
  fastify.post('/create/action/logs', logs.createActionLogs);
  fastify.get('/get/action/logs', logs.getActionLogs);
  fastify.post('/create/event/logs', logs.createEventLogs);
  fastify.get('/get/event/logs', logs.getEventLogs);
}

module.exports = logsRoutes;