const router = require("express").Router();
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

module.exports = router;

router.post("/urusPendaftaran", async (req, res) => {
    const newRegistration = await prisma.urusPendaftaran.create({ data: req.body });
    res.json(newRegistration);
});        

// router.get("/urusPendaftaran", async (req, res) => {
//     const allRegistration = await prisma.urusPendaftaran.findMany();
//     res.json(allRegistration);
    
// }); 

router.get('/urusPendaftaran', async (req, res) => {
    try {
      const urusPendaftarans = await prisma.urusPendaftaran.findMany({
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

router.get('/urusPendaftaran/lulus', async (req, res) => {
    try {
      const urusPendaftarans = await prisma.urusPendaftaran.findMany({
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
 
router.get("/urusPendaftaran/:id", async (req, res) => {
    const { id } = req.params;
    try {
      const oneRegistration = await prisma.urusPendaftaran.findUnique({
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
    const updatedAgreement = await prisma.urusPendaftaran.update({ 
        where: { id: id },
        data: { 
            pendaftaranLulus: newAgreement
          },
     });
    res.json(updatedAgreement);  
});   
  // router.get("/urusPendaftaran/:id", async (req, res) => {
  //   const {id} = req.params.id;
  //   const oneRegistration = await prisma.urusPendaftaran.findUnique({ 
  //       where: { id: id},
  //       include: { 
  //         kanak: true,
  //         bapa: true,       
  //         ibu: true,
  //       },
  //   });
  //   console.log("disini error");
  //   res.json(oneRegistration);  
  // }); 

// router.get('/urusPendaftaran/:id/daftarKanak', async (req, res) => {
//     const urusPendaftaranId = req.params.id;
  
//     try {
//       const urusPendaftaran = await prisma.urusPendaftaran.findUnique({
//         where: { id: urusPendaftaranId },
//         include: { kanak: true },
//       });
  
//       if (!urusPendaftaran) {
//         return res.status(404).json({ error: 'UrusPendaftaran not found' });
//       }
  
//       const daftarKanak = urusPendaftaran.kanak;
//       res.json(daftarKanak);
//     } catch (error) {
//       console.error(error);
//       res.status(500).json({ error: 'Server error' });
//     }
//   });



// router.post("/urusPendaftaran", async (req, res) => {  
//     const newRegistration = await prisma.urusPendaftaran.create({
//         data: {
//             pendaftaranLulus: false,
//             pendaftar: { // Add the pendaftar object here
//                 create: {
//                     // Add the required properties for pendaftar
//                     // You can access the child data from localStorage and assign it here
//                     namaKanak: localStorage.getItem('DataKanak').namaKanak,
//                     sijilLahir: localStorage.getItem('DataKanak').sijilLahir,
//                     bangsa: localStorage.getItem('DataKanak').bangsa,
//                     tarikhLahir: localStorage.getItem('DataKanak').tarikhLahir,
//                     tempatLahir: localStorage.getItem('DataKanak').tempatLahir,
//                     umur: localStorage.getItem('DataKanak').umur,
//                     jantina: localStorage.getItem('DataKanak').jantina,
//                     alamatKanak: localStorage.getItem('DataKanak').alamatKanak,
//                     namaPenjaga: localStorage.getItem('DataKanak').namaPenjaga,
//                     telefonPenjaga: localStorage.getItem('DataKanak').telefonPenjaga,
//                     hubunganPenjaga: localStorage.getItem('DataKanak').hubunganPenjaga,
//                     alamatPenjaga: localStorage.getItem('DataKanak').alamatPenjaga
//                 }
//             }
//         }
//     });

//     console.log(newRegistration);
//     res.send("Registration created successfully.");
// });
