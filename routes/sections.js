const sections = require('../controllers/sections');

async function sectionsRoutes(fastify, options) {
    fastify.post('/create/sections', sections.createSections);
    fastify.get('/get/sections', sections.getSections);
    fastify.get('/get/section/:section_id', sections.getSectionById);
    fastify.put('/update/section/:section_id', sections.updateSections);
    fastify.delete('/delete/section/:section_id', sections.deleteSections);
}

module.exports = sectionsRoutes;