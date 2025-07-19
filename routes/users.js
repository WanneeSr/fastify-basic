const users = require('../controllers/users');

async function usersRoutes(fastify, options) {
  fastify.get('/get/users', users.getUsers);
  fastify.get('/get/users/:user_id', users.getUserById);
  fastify.post('/create/user', users.createUsers);
  fastify.put('/update/user/:user_id', users.updateUserById);
  fastify.delete('/delete/:user_id', users.deleteUserById);
  // fastify.post('/login', (req, res) => users.login(req, res, fastify));
  fastify.post('/register',users.register)
}

module.exports = usersRoutes;
