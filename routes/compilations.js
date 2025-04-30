const fastify = require("fastify")();
const { query } = require("../config/db");
const { exec } = require("child_process");
const fs = require("fs");
const fss = require("fs").promises;
const util = require("util");
const path = require("path");

const execPromise = util.promisify(exec);

async function compilationRoutes(fastify, options) {
  fastify.post('/compilation/code/:user_id', async (request, reply) => {
    try {
      const { user_id } = request.params;
      const { code } = request.body;

      const create_at = new Date();
      const update_at = create_at;

      // สร้างโฟลเดอร์ temps ถ้าไม่พบ
      const tempDir = path.join(process.cwd(), 'temps');
      try {
        await fss.mkdir(tempDir, { recursive: true });
      } catch (err) {
        console.error("Error creating 'temps' directory:", err);
        return reply.status(500).send({ message: 'Failed to create directory' });
      }

      // ตั้งชื่อไฟล์ .c
      const filename = `${user_id}_${Date.now()}.c`;
      const filePath = path.join(tempDir, filename);

      // บันทึกโค้ดลงในไฟล์ .c
      await fss.writeFile(filePath, code);

      // คอมไพล์ไฟล์ .c
      const outputFilename = `${user_id}_${Date.now()}.exe`;
      const outputFilePath = path.join(tempDir, outputFilename);
      const compileCommand = `gcc ${filePath} -o ${outputFilePath}`;

      const { stdout: compileStdout, stderr: compileStderr } = await execPromise(compileCommand);
      if (compileStderr) {
        console.error(`Compilation error: ${compileStderr}`);
        return reply.status(500).send({ message: 'Compilation error', error: compileStderr });
      }

      // รันโปรแกรมที่คอมไพล์
      const { stdout: runStdout, stderr: runStderr } = await execPromise(outputFilePath);
      if (runStderr) {
        console.error(`Runtime error: ${runStderr}`);
        return reply.status(500).send({ message: 'Runtime error', error: runStderr });
      }

      // บันทึกข้อมูลลงฐานข้อมูล
      const file_path_db = `temps/${filename}`;
      const sql = `INSERT INTO compilations(user_id, code, file_path, output, error, create_at, updated_at) VALUES(?, ?, ?, ?, ?, ?, ?)`;
      const values = [user_id, code, file_path_db, runStdout, runStderr, create_at, update_at];
      const rows = await query(sql, values);

      // ส่งผลลัพธ์กลับไป
      reply.status(200).send({ message: 'Compilation and execution successful', output: runStdout, compilation_id: rows.insertId });
    } catch (error) {
      console.error(error);
      reply.status(500).send({ message: "Internal server error" });
    }
  });
}

module.exports = compilationRoutes;
