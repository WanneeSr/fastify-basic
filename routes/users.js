const users = require('../controllers/users');

async function usersRoutes(fastify, options, next) {
    fastify.get('/get/users',(users.getUsers));

    fastify.get('/get/users/:user_id',(users.getUserById));

    fastify.post('/register',(users.createUsers));

    fastify.put('/update/user/:user_id',(users.updateUserById));

    fastify.delete('/delete/:user_id',(users.deleteUserById));

};

module.exports = usersRoutes;