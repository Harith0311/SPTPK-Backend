const router = require("express").Router();
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

module.exports = router;

router.get("/aktiviti", async (req, res) => {
    const allActivity = await prisma.aktiviti.findMany();
    res.json(allActivity);
});  

router.post("/aktiviti", async (req, res) => {
    const newActivity = await prisma.aktiviti.create({ data: req.body });
    res.json(newActivity);
});

router.delete("/aktiviti/:id", async (req, res) => {
    const id = req.params.id;
  
    try {
      // Delete activity ID from aktivitiHariIni table
      const deletedAktivitiHariIni = await prisma.aktivitiHariIni.deleteMany({
        where: { aktivitiId: id },  
      });
  
      // Delete activity from aktiviti table
      const deletedActivity = await prisma.aktiviti.delete({
        where: { id: id },
      });
  
      res.json(deletedActivity);   
    } catch (error) {
      // Handle any errors
      console.error(error);
      res.status(500).json({ error: "An error occurred while deleting the activity." });
    }
  });

  router.get("/aktiviti/:id", async (req, res) => {
    const oneActivity = await prisma.aktiviti.findUnique({  
        where: { id: req.params.id}
    });
    console.log("disini error");
    res.json(oneActivity);  
  });  
   
router.put("/aktiviti/:id", async (req, res) => {
    const id = req.params.id;
    const newName = req.body.namaAktiviti;
    const newYear = req.body.tahun;
    const newDifficulty = req.body.kesukaran; 
    const updatedActivity = await prisma.aktiviti.update({ 
        where: { id: id },
        data: { 
            namaAktiviti: newName,
            tahun: newYear,
            kesukaran: newDifficulty},
     });
    res.json(updatedActivity);  
});   

