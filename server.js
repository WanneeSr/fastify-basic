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
    root: path.join(__dirname, 'temps'),
    prefix: '/temps/',
  });


const usersRoutes = require('./routes/users');
const compilationRoutes = require('./routes/compilations');





fastify.register(usersRoutes);
fastify.register(compilationRoutes);





fastify.get('/', function handler(req, res) {
    res.send('Hello Project!');
});

// Run the server!
fastify.listen({ port: 3001 }, (err) => {
    if (err) {
        fastify.log.error(err)
        process.exit(1)
    }
});