const router = require("express").Router();
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

module.exports = router;

router.post("/bapa", async (req, res) => {
    const checkIC = await prisma.daftarBapa.findUnique({
            where: {
                noKP: req.body.noKP
            }
        });
    

    if (checkIC) {
        res.sendStatus(409);  
        return;
    }

    const registerNewDad = await prisma.daftarBapa.create({ data: req.body });
    res.json(registerNewDad);  
});  

router.get("/bapa/:id", async (req, res) => {
    const id = req.params.id;
    const oneDad = await prisma.daftarBapa.findUnique( 
        {
            where: {id: id}
        }
    );
    res.json(oneDad);
}); 