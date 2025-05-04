const fastify = require('fastify')({ logger: true });
const util = require("node:util");
const { pipeline } = require("node:stream");
const pump = util.promisify(pipeline);
const path = require("path");


fastify.register(require('@fastify/formbody'));
fastify.register(require("@fastify/multipart"));
fastify.register(require('@fastify/jwt'), { secret: 'lookthorwow' });
fastify.register(require('@fastify/cors'), {});
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
const logsRoutes = require('./routes/logs');
const sectionsRoutes = require('./routes/sections');
const lessonsRoutes = require('./routes/lessons');
const coursesRoutes = require('./routes/courses');





fastify.register(usersRoutes);
fastify.register(compilationRoutes);
fastify.register(openaiRoutes);
fastify.register(logsRoutes);
fastify.register(sectionsRoutes);
fastify.register(lessonsRoutes);
fastify.register(coursesRoutes);




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