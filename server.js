const fastify = require('fastify')({logger: true});
const util = require("node:util");
const { pipeline } = require("node:stream");
const pump = util.promisify(pipeline);
const path = require("path");


fastify.register(require("@fastify/multipart"));
fastify.register(require('@fastify/jwt'), { secret: 'lookthorwow' });
fastify.register(require('@fastify/cors'),{ });
fastify.register(require("fastify-socket.io"), {
    cors: {
        origin: "*",
        methods: ["GET", "POST", "PUT"]
    }
});

fastify.register(require("@fastify/static"), {
    root: path.join(__dirname, 'uploads'),
    prefix: '/uploads/',
  });




const usersRoutes = require('./routes/users');
const compilationRoutes = require('./routes/compilations');
const openaiRoutes = require('./routes/openai');






fastify.register(usersRoutes);
fastify.register(compilationRoutes);
fastify.register(openaiRoutes);




fastify.get('/', function handler(req, res) {
    res.send('Hello Project!');
});

fastify.ready((err) => {
    if (err) {
        fastify.io.on('connection', (socket) => {
            console.log(socket);
        });
    }
});

// Run the server!
fastify.listen({ port: 3001 }, (err) => {
    if (err) {
        fastify.log.error(err)
        process.exit(1)
    }
});