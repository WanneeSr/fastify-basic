const users = require('../controllers/users');

async function usersRoutes(fastify, options, next) {
    fastify.get('/get/users',(users.getUsers));

    fastify.get('/get/users/:user_id',(users.getUserById));

    fastify.post('/register',(users.createUsers));
};

module.exports = usersRoutes;