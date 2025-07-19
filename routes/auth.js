const { randomUUID } = require('crypto')
const bcrypt = require('bcrypt')
const { error } = require('console')
const { query } = require('../config/db')

async function authRoutes(fastify, options) {

  // ตัวอย่าง Login → สร้าง token
  fastify.post('/login', async (req, reply) => {
    const { email, password } = req.body

    if (!email || !password) {
      return reply.status(400).send({ error: 'Email and password are required' })
    }

    // ตรวจสอบรหัสผ่าน
    const passwordHash = await bcrypt.hash(password, 10)
    
    const passwordMatch = await bcrypt.compare(password, passwordHash)
    if (!passwordMatch) {
      return reply.status(401).send({ error: 'Invalid credentials' })
    }

    const data = `SELECT * FROM users WHERE email = ?`
    const values = [email];
    const user = await query(data, values)

    const token = fastify.jwt.sign({
      user_id: user.user_id,
      email: user.email,
      role: user.role
    }, { expiresIn: '1h' })

    return { token }  // แนะนำให้ return เป็น object ที่ชัดเจน
  })

  // ตัวอย่าง route ที่ต้องตรวจสอบ token
  fastify.get('/profile', { preValidation: [fastify.authenticate] }, async (req, reply) => {
    // req.user มาจาก token
    return { user: req.user }
  })
}

module.exports = authRoutes
