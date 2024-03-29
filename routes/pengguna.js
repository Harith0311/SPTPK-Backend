const router = require("express").Router();
const { PrismaClient } = require("@prisma/client");
const bcrypt = require("bcryptjs")

const prisma = new PrismaClient();

module.exports = router;

// CRUD Pengguna

router.get("/pengguna", async (req, res) => {
    const allUsers = await prisma.pengguna.findMany();
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
    const updatedEmail = await prisma.pengguna.update({ 
        where: { id: parseInt(id) },
        data: { emel: newEmail },   
     });  
    res.json(updatedEmail);
}); 

// router.put("/pengguna/:id", async (req, res) => {  
//     const id = req.params.id;
//     const pass = req.body.password;
//     console.log(id);
//     console.log(pass);
//     const hashedPassword = await bcrypt.hash(pass, 10);
//     const updatedPassword = await prisma.pengguna.update({ 
//         where: { id: id },
//         data: { 
//             kataLaluan: hashedPassword   
//         },     
//      });  
//     res.json(updatedPassword);
// }); 

// Update password inside account
router.put("/pengguna/kataLaluan/:id", async (req, res) => {
    const id = req.params.id;
    const oldPass = req.body.oldPass;
    const newPass = req.body.newPass;
    
    try {
      const pengguna = await prisma.pengguna.findUnique({ where: { id: id } });
  
      if (!pengguna) {
        return res.status(404).json({ error: "Kata laluan lama salah" });
      }
  
      const isPasswordValid = await bcrypt.compare(oldPass, pengguna.kataLaluan); 
  
      if (!isPasswordValid) {
        return res.status(400).json({ error: "*Kata laluan lama salah" });
      }
  
      const hashedPassword = await bcrypt.hash(newPass, 10);
  
      const updatedPassword = await prisma.pengguna.update({
        where: { id: id },
        data: {
          kataLaluan: hashedPassword
        }
      });
  
      res.json(updatedPassword);
    } catch (error) {
      console.error('Error updating password:', error);
      res.status(500).json({ error: "Internal server error" });
    }
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

// Reset password outside
router.put("/pengguna/luar/:id", async (req, res) => {
    const id = req.params.id;
    const newPass = req.body.password;

    try{
      const hashedPassword = await bcrypt.hash(newPass, 10);

      const updatedPass = await prisma.pengguna.update({ 
          where: { id: id },
          data: { 
              kataLaluan: hashedPassword,
          },
      });
    res.json(updatedPass); 
    } catch (error) {
      console.error('Error updating password:', error);
      res.status(500).json({ error: "Internal server error" });
    }
     
});   