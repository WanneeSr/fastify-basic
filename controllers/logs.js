const { query } = require('../config/db');
const crypto = require('crypto');

/**
 * helper: hash IP (optional แต่แนะนำ)
 */
const hashIp = (ip) => {
    if (!ip) return null;
    return crypto.createHash('sha256').update(ip).digest('hex');
};

/**
 * CREATE LOG
 */
const createLog = async (req, res) => {
    try {
        const {
            user_id,
            action,
            action_detail,
            target_type,
            target_id,
            module,
            log_level = 'INFO',
            metadata
        } = req.body;

        // validation
        if (!action || !module) {
            return res.status(400).send({
                message: 'action and module are required'
            });
        }

        // safe metadata
        let metadataStr = null;
        if (metadata) {
            try {
                metadataStr = JSON.stringify(metadata);
            } catch {
                return res.status(400).send({ message: 'Invalid metadata format' });
            }
        }

        const ip_address = hashIp(req.ip);
        const user_agent = req.headers['user-agent'] || null;
        const created_at = new Date();

        const sql = `
            INSERT INTO logs (
                user_id,
                action,
                action_detail,
                target_type,
                target_id,
                module,
                log_level,
                ip_address,
                user_agent,
                metadata,
                created_at
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        `;

        const values = [
            user_id || null,
            action,
            action_detail || null,
            target_type || null,
            target_id || null,
            module,
            log_level,
            ip_address,
            user_agent,
            metadataStr,
            created_at
        ];

        const result = await query(sql, values);

        res.status(201).send({
            message: 'Log created successfully',
            log_id: result.insertId
        });

    } catch (error) {
        console.error('Create log error:', error);
        res.status(500).send({
            message: 'Internal server error',
            error: error.message
        });
    }
};

/**
 * GET LOGS (basic)
 */
const getLogs = async (req, res) => {
    try {
        const sql = `
            SELECT 
                log_id,
                user_id,
                action,
                action_detail,
                target_type,
                target_id,
                module,
                log_level,
                metadata,
                created_at
            FROM logs
            ORDER BY created_at DESC
            LIMIT 200
        `;
        const data = await query(sql);
        res.status(200).send(data);
    } catch (error) {
        res.status(500).send(error);
    }
};

module.exports = {
    createLog,
    getLogs
};
