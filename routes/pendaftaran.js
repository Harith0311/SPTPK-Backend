const router = require("express").Router();
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

module.exports = router;

// Create new registration
router.post("/daftar", async (req, res) => {
    const newRegistration = await prisma.UrusPendaftaran.create({ data: req.body });
    res.json(newRegistration);
});  

router.get("/daftar", async (req, res) => {
    const allRegistration = await prisma.UrusPendaftaran.findMany({
        include: {
            pendaftar: true,
        }
    });
    res.json(allRegistration);
});    