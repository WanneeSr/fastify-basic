const users = require('../controllers/users')

async function authRoutes(fastify, options) {
  // Login endpoint - ใช้ function จาก users controller
  fastify.post('/login', (req, reply) => users.login(req, reply, fastify))

  // Logout endpoint - จริงๆ แล้ว logout ไม่ต้องเรียก API แต่เพิ่มไว้เพื่อความสมบูรณ์
  fastify.post('/logout', { preValidation: [fastify.authenticate] }, async (req, reply) => {
    // ใน JWT, logout จริงๆ คือการลบ token ที่ client side
    // แต่สามารถบันทึก log ได้ที่นี่
    return reply.send({ 
      status: 200,
      message: 'Logout successful'
    })
  })

  // Profile endpoint - ต้องมี token
  fastify.get('/profile', { preValidation: [fastify.authenticate] }, async (req, reply) => {
    return { user: req.user }
  })
}

module.exports = authRoutes
