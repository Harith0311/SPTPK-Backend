const router = require("express").Router();
const { PrismaClient } = require("@prisma/client");
const bcrypt = require("bcryptjs")

const prisma = new PrismaClient();

module.exports = router;

// CRUD Pengguna

router.get("/pengguna", async (req, res) => {
    const allUsers = await prisma.Pengguna.findMany();
    res.json(allUsers);  
});

router.get("/pengguna/kod", async (req, res) => {
    try {
      const { noIC } = req.query;
      const user = await prisma.pengguna.findFirst({
        where: {
          noKP: noIC,
        },
      });
      res.json(user);
    } catch (error) {
      console.error("Error retrieving NoKP:", error);
      res.status(500).json({ error: "Internal Server Error" });
    }
  });

router.get('/pengguna/staf', async (req, res) => {
    try { 
      const staffUser = await prisma.pengguna.findMany({
        where: {
          peranan: "Staf Taska", 
        }
      });
  
      res.json(staffUser);
    } catch (error) {
      console.error(error); 
      res.status(500).json({ error: 'Server error' });
    }
  });
    
router.post("/pengguna", async (req, res) => {
    
    // const newUser = await prisma.Pengguna.create({ data: req.body });
    // const hashedPassword = await bcrypt.hash(password, 10);
    // res.json(newUser);
    const { 
        peranan,
        nama,
        emel,
        noKP,
        kataLaluan,
        kodPengesahan } = req.body;

    try {
        const hashedPassword = await bcrypt.hash(kataLaluan, 10);
        const pengguna = 
                {
                    peranan,
                    nama,
                    emel, 
                    noKP,  
                    kataLaluan: hashedPassword,
                    kodPengesahan
                }

            console.log(pengguna);
        const createdUser = await prisma.pengguna.create({ data: pengguna });
        res.json(createdUser);
    } catch (error) {
        console.error(error);
        res.status(500).send("Error creating new subject");
    }
});     
   
router.put("/:id", async (req, res) => {  
    const id = req.params.id;
    const newEmail = req.body.emel;
    const updatedEmail = await prisma.Pengguna.update({ 
        where: { id: parseInt(id) },
        data: { emel: newEmail },   
     });  
    res.json(updatedEmail);
}); 

router.put("/pengguna/:id", async (req, res) => {  
    const id = req.params.id;
    const pass = req.body.password;
    console.log(id);
    console.log(pass);
    const hashedPassword = await bcrypt.hash(pass, 10);
    const updatedPassword = await prisma.pengguna.update({ 
        where: { id: id },
        data: { 
            kataLaluan: hashedPassword   
        },     
     });  
    res.json(updatedPassword);
}); 

router.post("/pengguna/logMasuk", async (req, res) => {  
    const { email, password } = req.body;
   
    const user = await prisma.pengguna.findUnique({  
        where: { emel: email},                                       
    })

    console.log(user); 
    if (!user) {
        return res.status(401).send("Invalid email");
    }

    const passwordMatch = await bcrypt.compare(password, user.kataLaluan);

    if (!passwordMatch) {  
        return res.status(401).send("Invalid password");  
    }

    const userData = user.id;

    res.send(userData);
});



router.get("/pengguna/:id", async (req, res) => {
    const { id } = req.params;

    const oneUser = await prisma.pengguna.findUnique({   
        where:{ id: id}
    });
    res.json(oneUser);
}); 

router.put("/pengguna/:id", async (req, res) => {
    const id = req.params.id;
    const newPass = req.body.kataLaluan;
    const updatedActivity = await prisma.aktiviti.update({ 
        where: { id: id },
        data: { 
            kataLaluan: newPass,
        },
     });
    res.json(updatedActivity);  
});   