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

async function openaiRoutes(fastify, options, next) {
    fastify.get('/ai', async (req, res) => {
        let content = await main();
        res.send(content);
    });
    fastify.post('/store/openai', async (req, res) => {
        try {
            const content = await main();
            const sql = 'INSERT INTO openai(content) VALUES(?)';
            const values = [content];
            const data = await query(sql, values);
            
            res.send({ message: 'Content OpenAI inserted into database!', content_id: data.insertId });
        } catch (error) {
            res.send({ error: error.message });
        }
    });
    
};


module.exports = openaiRoutes;