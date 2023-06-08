const router = require("express").Router();
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

module.exports = router; 
     
// router.post("/kehadiran", async (req, res) => {
//     const newAttendance = await prisma.kehadiran.create({ data: req.body });
//     res.json(newAttendance);
// }); 

router.get("/kehadiran", async (req, res) => {
  const { date } = req.query; 

  let allAttendance = await prisma.kehadiran.findMany();
  if (date) {
    allAttendance = allAttendance.filter((attendance) => {
      const dateAtt = new Date(attendance.diciptaPada);
      const dateReq = new Date(date);
      return (dateAtt.getDate() === dateReq.getDate());
    })
  };
  
  res.json(allAttendance);
});

// router.get("/kehadiran", async (req, res) => {
//   const { date } = req.query;

//   let attendanceQuery = {};

//   if (date) {
//     // If date parameter is provided, filter the attendance records
//     attendanceQuery = {
//       where: {
//         diciptaPada: {     
//           gte: new Date(date), // Filter for records created on or after the specified date
//           lt: new Date(new Date(date).setDate(new Date(date).getDate() + 1)), // Filter for records created before the next day
//         },
//       },
//     };
//   }

//   const allAttendance = await prisma.kehadiran.findMany(attendanceQuery);
//   res.json(allAttendance);
// });


router.post("/kehadiran", async (req, res) => {
    const { kanakId, hadir, suhuNormal } = req.body;   
    console.log(req);
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

   