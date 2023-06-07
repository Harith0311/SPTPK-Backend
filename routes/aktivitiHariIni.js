const router = require("express").Router();
const { PrismaClient } = require("@prisma/client");    

const prisma = new PrismaClient();

module.exports = router;

router.get("/aktivitiHariIni", async (req, res) => {
    const allTodayActivity = await prisma.aktivitiHariIni.findMany({
        include: {
            aktiviti: true
        }
    });   
    console.log(allTodayActivity);
    res.json(allTodayActivity);
}); 
  
router.post("/aktivitiHariIni", async (req, res) => {
    const newTodayActivity = await prisma.aktivitiHariIni.create({ data: req.body });
    res.json(newTodayActivity);
}); 



router.delete("/aktivitiHariIni/:id", async (req, res) => {
    const id = req.params.id;
    // Delete activity ID from aktivitiHariIni table
      const deletedAktivitiHariIni = await prisma.aktivitiHariIni.delete({
        where: {
            id: id  
        }
      });
      res.json(deletedAktivitiHariIni);
  });

  


