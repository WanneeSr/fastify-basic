const OpenAI = require('openai');
const dotenv = require('dotenv');
const {query} = require('../config/db');
dotenv.config();

const openai = new OpenAI({
    apiKey: process.env.OPEN_AI_KEY,
});

async function main() {
    const completion = await openai.chat.completions.create({
        messages: [{ role: "system", content: "You are a helpful assistant." },
            {role:'user',content:"create code a+b by c language."}
        ],
        model: "gpt-3.5-turbo-0125",
    });

    return completion.choices[0].message.content;
}

async function openaiRoutes(fastify, options) {
    fastify.get('/ai', async (req, res) => {
        let content = await main();
        res.send(content);
    });
    // fastify.post('/openai/:user_id', async (req, res) => {
    //     try {
    //         const { user_id } = req.params;
    //         const { code } = req.body;

    //         const completion = await openai.chat.completions.create({
    //             messages: [{ role: "system", content: "You are a helpful assistant." },
    //                 {role:'user',content:`Can you write better than this ${code}`}
    //             ],
    //             model: "gpt-3.5-turbo-0125",
    //         });

    //         const sql = 'INSERT INTO openai(user_id, content) VALUES(?, ?)';
    //         const values = [user_id, completion];
    //         const data = await query(sql, values);
            
    //         res.send({ message: 'Content OpenAI inserted into database!', openai_id: data.insertId });
    //     } catch (error) {
    //         res.send({ error: error.message });
    //     }
    // });
    
    fastify.post('/openai/:user_id', async (req, res) => {
        try {
            const { user_id } = req.params;
            const { code } = req.body;
    
            const completion = await openai.chat.completions.create({
                messages: [
                    { role: "system", content: "You are a helpful assistant." },
                    { role: "user", content: `${code} Can you write better than this` }
                ],
                model: "gpt-3.5-turbo",
            });
    
            const sql = 'INSERT INTO openai(user_id, content) VALUES(?, ?)';
            const values = [user_id, completion.choices[0].message.content]; // Assuming 'completion' has this structure
            await query(sql, values);
    
            res.send({ message: 'Content OpenAI inserted into database!' });
        } catch (error) {
            res.send({ error: error.message });
        }
    });
    
};


module.exports = openaiRoutes;