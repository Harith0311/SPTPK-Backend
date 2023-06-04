const router = require("express").Router();
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

module.exports = router; 
     
// router.post("/kehadiran", async (req, res) => {
//     const newAttendance = await prisma.kehadiran.create({ data: req.body });
//     res.json(newAttendance);
// }); 

router.post("/kehadiran", async (req, res) => {
    const { kanakId, hadir, suhuNormal } = req.body;
    const currentDate = new Date().toISOString().split("T")[0]; // Get the current date in YYYY-MM-DD format
  
    // Check if a record already exists for the given kanakId and current date
    const existingAttendance = await prisma.kehadiran.findFirst({
      where: {
        kanakId: kanakId, 
        diciptaPada: {
          gte: new Date(currentDate),
          lt: new Date(new Date(currentDate).getTime() + 86400000) // Adding 24 hours to the current date
        }
      }
    });
  
    if (existingAttendance) {
      // If a record already exists, return an error response
      return res.status(400).json({ error: "Attendance already submitted for today" });
    }
  
    // Create a new attendance record
    const newAttendance = await prisma.kehadiran.create({ data: req.body });
    res.json(newAttendance);
  });

