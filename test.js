import bcrypt from 'bcrypt';

const password = '123456';

// สร้าง hash ใหม่จาก password
const hash = await bcrypt.hash(password, 10);
console.log('Hash:', hash);

// เปรียบเทียบกับ password เดิม
const match = await bcrypt.compare(password, hash);
console.log('Password match:', match);