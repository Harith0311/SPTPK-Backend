const express = require("express");
const app = express();
const cors = require('cors');
const { PrismaClient } = require("@prisma/client");

// const prisma = new PrismaClient();

app.use(express.json());

app.use(cors({
    origin: "*",
}));  

app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
    next();
  });

  app.use((req, res, next) => {
    console.log(
        `[${new Date().getDate()}/${new Date().getMonth()}/${new Date().getFullYear()} ${new Date().getHours()}:${new Date().getMinutes()}:${new Date().getSeconds()}:${new Date().getMilliseconds()}] ${
            req.method
        } ${req.originalUrl}`
    );
    console.log(req.body);
    console.log("*****************");

    next();
});     
               
app.use("", require("./routes/aktiviti"));
app.use("", require("./routes/aktivitiHariIni"));
app.use("", require("./routes/daftarBapa"));
app.use("", require("./routes/daftarIbu"));
app.use("", require("./routes/daftarKanak"));
app.use("", require("./routes/kehadiran"));
app.use("", require("./routes/pendaftaran"));
app.use("", require("./routes/pengguna"));
app.use("", require("./routes/urusPendaftaran"));   
       
app.listen(Number(1001), "0.0.0.0", () => console.log("Server running on port ${1001}"));
                            