const fastify = require('fastify')({logger: true});
const cors = require('@fastify/cors');
const util = require("node:util");
const { pipeline } = require("node:stream");
const pump = util.promisify(pipeline);
const path = require("path");


fastify.register(require("@fastify/multipart"));


// ตั้งค่า CORS
fastify.register(cors, {
    origin: 'http://localhost:3000', // อนุญาตเฉพาะโดเมนนี้ให้เข้าถึง
    methods: ['GET', 'POST', 'PUT', 'DELETE'], // วิธี HTTP ที่อนุญาต
    allowedHeaders: ['Content-Type'], // Header ที่อนุญาตให้ใช้ใน request
    // credentials: true // อนุญาตให้ส่งข้อมูลที่มีการยืนยันตัวตน (เช่น cookies)
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