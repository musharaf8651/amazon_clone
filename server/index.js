//IMPORTS 
const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');

//INITIALISATIONS
const app = express();
const PORT=3000;
const DB = 'mongodb+srv://blackrose:Parwez123@cluster0.ihzeetn.mongodb.net/?retryWrites=true&w=majority';
//MIDDLEWARE
//MIDDLEARE ACTS AS A MIDDLEMAN BETWEEN CLIENT AND SERVER 
app.use(authRouter);

//CONNECTIONS TO DATABSE

mongoose.connect(DB).then(()=>{
    console.log("Connection to db succesfull");
}).catch(e=>{
    console.log(e);
})

//THE OUTPUT ON SERVER
app.get('/hello-world',(req,res)=>{
    res.send("hello world");
})

//SERVER STARTED ON PORT=>3000;
app.listen(PORT,"0.0.0.0" ,()=>{
    console.log(`Connected at PORT ${PORT}`)
});
