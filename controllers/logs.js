const { query } = require('../config/db');
//ssz 125

const createActionLogs = async (req, res) => {
    try {
        const {
            user_id,
            action_type,
            action_description,
            target_id,
            target_type,
            user_agent
        } = req.body;
        const ip_address = req.ip; // ใช้ req.ip เพื่อดึง IP address ของผู้ใช้

        // ตรวจสอบ input ที่จำเป็น
        if (!user_id || !action_type || !action_description) {
            return res.status(400).send({ message: 'Missing required fields.' });
        }

        const created_at = new Date();

        const sql = `
        INSERT INTO action_logs (
          user_id, action_type, action_description, 
          target_id, target_type, ip_address, user_agent, created_at
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
      `;

        const values = [
            user_id,
            action_type,
            action_description,
            target_id || null,
            target_type || null,
            ip_address || null,
            user_agent || null,
            created_at
        ];

        const data = await query(sql, values);

        res.status(201).send({
            message: 'Action log created successfully.',
            action_log_id: data.insertId
        });
    } catch (error) {
        console.error('Error creating action log:', error);
        res.status(500).send({
            message: 'Internal server error while creating action log.',
            error: error.message
        });
    }
};


const getActionLogs = async (req, res) => {
    try {
        const sql = `SELECT * FROM action_logs`;
        const data = await query(sql);
        res.status(200).send(data);
    } catch (error) {
        res.status(500).send(error);
    }
}

const createEventLogs = async (req, res) => {
    try {
        const { user_id, event_type, severity, message } = req.body;
        // ตรวจสอบ input ที่จำเป็น
        if (!user_id || !event_type || !severity || !message) {
            return res.status(400).send({ message: 'Missing required fields.' });
        }
        const created_at = new Date(); // ใช้เวลาเป็น timestamp ISO
        const metadataStr = metadata ? JSON.stringify(metadata) : null; // ตรวจสอบว่า metadata เป็น JSON หรือไม่

        const sql = `INSERT INTO event_logs (event_type, severity, message, metadata, created_by, created_at) VALUES(?, ?, ?, ?, ?, ?)`;
        const values = [event_type, severity, message, metadataStr, user_id, created_at];
        const data = await query(sql, values);

        res.status(201).send({ message: 'Event log created successfully!', logs_event_id: data.insertId });
    } catch (error) {
        console.error('Error creating event log:', error);
        res.status(500).send({ message: 'Error creating event log', error: error.message });
    }
}

const getEventLogs = async (req, res) => {
    try {
        const sql = `SELECT * FROM event_logs`;
        const data = await query(sql);
        res.status(200).send(data);
    } catch (error) {
        res.status(500).send(error);
    }
}



module.exports = {
    createActionLogs,
    getActionLogs,
    createEventLogs,
    getEventLogs
}