const router = require("express").Router();
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

module.exports = router;

router.post("/urusPendaftaran", async (req, res) => {
    const newRegistration = await prisma.urus_pendaftaran.create({ data: req.body });
    res.json(newRegistration);
});        

router.get('/urusPendaftaran', async (req, res) => {
    try {
      const urusPendaftarans = await prisma.urus_pendaftaran.findMany({
        where: {
          pendaftaranLulus: false
        },
        include: {
          kanak: true,
          bapa: true,           
          ibu: true, 
        },
      });
  
      res.json(urusPendaftarans);   
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Server error' });
    }
  });

router.delete("/urusPendaftaran/:id", async (req, res) => {
    const id = req.params.id; 

      try {
        // Delete activity ID from aktivitiHariIni table
        const deletedKanak = await prisma.daftar_kanak.deleteMany({
          where: { pendaftaranId: id },  
        });

        // Delete activity ID from aktivitiHariIni table
        const deletedIbu = await prisma.daftar_ibu.deleteMany({
          where: { pendaftaranId: id },  
        });

        // Delete activity ID from aktivitiHariIni table
        const deletedBapa = await prisma.daftar_bapa.deleteMany({
          where: { pendaftaranId: id },  
        }); 
    
        // Delete activity from aktiviti table
        const deletedRegistration = await prisma.urus_pendaftaran.delete({ 
          where: { id: id },
        });
    
        res.json(deletedRegistration);   
      } catch (error) {
        // Handle any errors
        console.error(error);
        res.status(500).json({ error: "An error occurred while deleting the activity." });
      }  
});   

router.get('/urusPendaftaran/lulus', async (req, res) => {
    try {
      const urusPendaftarans = await prisma.urus_pendaftaran.findMany({
        where: {
          pendaftaranLulus: true 
        },
        include: {
          kanak: true,
          bapa: true,           
          ibu: true,
        },
      });
  
      res.json(urusPendaftarans);
    } catch (error) {
      console.error(error); 
      res.status(500).json({ error: 'Server error' });
    }
  });

  router.get('/urusPendaftaran/perempuan', async (req, res) => {
    try {
      const urusPendaftarans = await prisma.urus_pendaftaran.findMany({
        where: {
          pendaftaranLulus: true, 
          kanak: {
            jantina: "Perempuan"  
          } 
        },
        include: {
          kanak: true,
          bapa: true,           
          ibu: true,
        },
      });
  
      res.json(urusPendaftarans);
    } catch (error) {
      console.error(error); 
      res.status(500).json({ error: 'Server error' });
    }
  });

  router.get('/urusPendaftaran/lelaki', async (req, res) => {
    try {
      const urusPendaftarans = await prisma.urus_pendaftaran.findMany({
        where: {
          pendaftaranLulus: true, 
          kanak: {
            jantina: "Lelaki"  
          } 
        },
        include: {
          kanak: true,
          bapa: true,           
          ibu: true,
        },
      });
  
      res.json(urusPendaftarans);
    } catch (error) {
      console.error(error); 
      res.status(500).json({ error: 'Server error' });
    }
  });
 
router.get("/urusPendaftaran/:id", async (req, res) => {
    const { id } = req.params;
    try {
      const oneRegistration = await prisma.urus_pendaftaran.findUnique({
        where: {
          id: id,
        },
        include: {
          kanak: true,
          bapa: true,
          ibu: true,
        },
      });
      res.json(oneRegistration);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: "Internal server error" });
    }
  });

  router.put("/urusPendaftaran/:id", async (req, res) => {
    const id = req.params.id;
    const newAgreement = req.body.pendaftaranLulus;
    const code = req.body.kodPengesahan;
    const childClass = req.body.kelas;

    const updatedAgreement = await prisma.urus_pendaftaran.update({ 
        where: { id: id },
        data: { 
            pendaftaranLulus: newAgreement,
            kodPengesahan: code,
            kelas: childClass,
          },
     });
    res.json(updatedAgreement);  
});   
  