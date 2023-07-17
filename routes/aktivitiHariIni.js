const router = require("express").Router();
const { PrismaClient } = require("@prisma/client");    

const prisma = new PrismaClient();

module.exports = router;

router.get("/aktivitiHariIni", async (req, res) => {
    const allTodayActivity = await prisma.aktiviti_hari_ini.findMany({
        include: {
            aktiviti: true
        }
    });   
    console.log(allTodayActivity); 
    res.json(allTodayActivity);
}); 

router.get('/aktivitiHariIni/count', async (req, res) => {
    const { kelas } = req.query;
  
    try {
      const existingActivities = await prisma.aktiviti_hari_ini.findMany({
        where: {
          kelas: kelas,
        },
      });
  
      const existingActivitiesCount = existingActivities.length;
  
      res.json(existingActivitiesCount);
    } catch (error) {
      console.error('Error fetching existing activities count:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  });
  
router.post("/aktivitiHariIni", async (req, res) => {
    const newTodayActivity = await prisma.aktiviti_hari_ini.create({ data: req.body });
    res.json(newTodayActivity);
});   


 
router.delete("/aktivitiHariIni/:id", async (req, res) => {
    const id = req.params.id; 
    // Delete activity ID from aktivitiHariIni table
      const deletedAktivitiHariIni = await prisma.aktiviti_hari_ini.delete({
        where: {
            id: id  
        }
      }); 
      res.json(deletedAktivitiHariIni);   
  });    

  


