const users = require('../controllers/users');

async function usersRoutes(fastify, options, next) {
    fastify.get('/get/users',(users.getUsers));

    fastify.post('/register',(users.createUsers));
};

module.exports = usersRoutes;