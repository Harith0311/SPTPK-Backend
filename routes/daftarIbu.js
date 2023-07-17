const router = require("express").Router();
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

module.exports = router;

router.post("/ibu", async (req, res) => {
    const checkIC = await prisma.daftar_ibu.findUnique({
            where: {
                noKP: req.body.noKP
            }
        });
    

    if (checkIC) {
        res.sendStatus(409);  
        return;
    }

    const registerNewMom = await prisma.daftar_ibu.create({ data: req.body });
    res.json(registerNewMom);        
});      

router.get("/ibu/:id", async (req, res) => {
    const id = req.params.id;
    const oneMom = await prisma.daftar_ibu.findUnique( 
        {
            where: {id: id}
        }
    );
    res.json(oneMom);
}); 