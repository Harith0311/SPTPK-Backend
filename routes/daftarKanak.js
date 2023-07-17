const router = require("express").Router();
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

module.exports = router;

router.post("/kanak", async (req, res) => {
    const checkChild = await prisma.daftar_kanak.findUnique({
            where: {
                sijilLahir: req.body.sijilLahir
            }
        });
    

    if (checkChild) {
        res.sendStatus(409);  
        return;
    }

    const registerNewChild = await prisma.daftar_kanak.create({ data: req.body });
    res.json(registerNewChild);  
});        

router.get("/kanak", async (req, res) => {
    const allChild = await prisma.daftar_kanak.findMany();
    res.json(allChild);
});  

// router.get("/kanak/lulus", async (req, res) => {
//     const allChild = await prisma.daftarKanak.findUnique({
//         where: {
//             kelas: {
//                 not: null,
//                 not: undefined
//             }
//         }
//     }
//     );
//     res.json(allChild);
// });  



router.get("/kanak/:id", async (req, res) => {
    const id = req.params.id;
    console.log(id);
    const oneChild = await prisma.daftar_kanak.findUnique( 
        {
            where: {id: id} 
        } 
    );
    res.json(oneChild);
});  

router.put("/kanak/:id", async (req, res) => {
    const id = req.params.id;
    const childClass = req.body.kelas;
    const code = req.body.kodPengesahan;

    const updatedClass = await prisma.daftar_kanak.update({ 
        where: { id: id },
        data: { 
            kelas: childClass, 
            kodPengesahan: code,
          },
     });
    res.json(updatedClass);  
});   
  
   