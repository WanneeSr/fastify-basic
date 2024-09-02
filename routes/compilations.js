const fastify = require("fastify")();
const { query } = require("../config/db"); // Call module query from /config/db.js.
const { exec } = require("child_process");

// const uploadFile = require("../controllers/uploadfile");
// const { query } = require("../config/db");
const fs = require("node:fs");
const fss = require("fs").promises;
const util = require("node:util");
const { pipeline } = require("node:stream");
// const pump = util.promisify(pipeline);
const path = require("path");
// fastify.register(require("@fastify/multipart"));

const execPromise = util.promisify(exec);


async function compilationRoutes(fastify, options, next) {
    fastify.post('/compilation/code/:user_id', async function (request, reply) {
      try {
        const { user_id } = request.params;
        const { code } = request.body;

        const create_at = Date();
        const update_at = create_at;
  
        // สร้างโฟลเดอร์ temps ที่ root ของโปรเจกต์ ถ้าไม่มีอยู่
        const tempDir = path.join(process.cwd(), 'temps');
        if (!fs.existsSync(tempDir)) {
          fs.mkdirSync(tempDir, { recursive: true });
        }
  
        // ตั้งชื่อไฟล์ .c ที่จะบันทึก
        const filename = `${user_id}_${Date.now()}.c`;
        const filePath = path.join(tempDir, filename);
  
        // บันทึกโค้ดลงในไฟล์ .c
        await fss.writeFile(filePath, code);
  
        // คอมไพล์ไฟล์ .c เป็นไฟล์ executable (.out หรือ .exe)
        const outputFilename = `${user_id}_${Date.now()}.exe`;
        const outputFilePath = path.join(tempDir, outputFilename);
        
        const file_path_db = `temps/${filename}`;
        
        
        const compileCommand = `gcc ${filePath} -o ${outputFilePath}`;
        const { stdout: compileStdout, stderr: compileStderr } = await execPromise(compileCommand);

        if (compileStderr) {
            console.error(`Compilation error: ${compileStderr}`);
            return reply.status(500).send({ message: 'Compilation error', error: compileStderr });
        }

        // Run the compiled executable
        const { stdout: runStdout, stderr: runStderr } = await execPromise(outputFilePath);

        if (runStderr) {
            console.error(`Runtime error: ${runStderr}`);
            return reply.status(500).send({ message: 'Runtime error', error: runStderr });
        }

        const sql = `INSERT INTO compilations(user_id, code, file_path, output, error, create_at, updated_at) VALUES(?, ?, ?, ?, ?, ?, ?)`;
        const values = [user_id, code, file_path_db, runStdout, runStderr, create_at, update_at];
        const rows = await query(sql, values);

        // Send the output back to the user
        reply.status(200).send({ message: 'Compilation and execution successful', output: runStdout , compilation_id: rows.insertId });

      } catch (error) {
        console.error(error);
        reply.status(500).send({ message: "Internal server error" });
      }

    });
}
// fastify.post('/courseUpfile/:id/:course_id', async function (request, reply) {
//   try {
//     const { id, course_id } = request.params
//     const parts = request.files();
//     let media_path = '';
//     let media_type = '';
//     if (parts) {
//         for await (const part of parts) {
//             const randomFileName = generateRandomString(30);
//             let isName = part.filename.split('.');
//             let arr = [];
//             arr.push(randomFileName, '.', isName[1]);
//             let newName = arr.join('');
//             await pump(part.file, fs.createWriteStream(`uploads/${newName}`));
//             media_path = `uploads/${newName}`;
//             media_type = isName[1];
//         }

//         const create_at = new Date(); // สร้างวันที่ปัจจุบัน
//         const update_at = new Date();

//         const sql = `INSERT INTO media (media_path, media_type, update_by, create_at, update_at,media_module, ref_id) VALUES (?, ?, ?, ?, ?, ?, ?)`;
//         const values = [media_path, media_type, id, create_at, update_at, 'course', course_id];
//         await query(sql, values);

//         const sql2 = `UPDATE courses SET course_thumbnail = ? WHERE course_id = ?`;
//         const values2 = [media_path, course_id];
//         await query(sql2, values2);

//         reply.status(201).send({ message: 'Success' });
//     }
// } catch (error) {
//     console.error(error);
//     reply.status(500).send({ message: 'Internal server error' });
// }
// })

module.exports = compilationRoutes;