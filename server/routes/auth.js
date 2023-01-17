//IMPORTS
const express = require('express');
const authRouter = express.Router();


//CREATING A POST REQUIEST FOR SIGNUP PAGE
//WHENEVER WE MAKE POST REQUEST WE USE req.body
authRouter.post('/api/signup',(req,res)=>{
    //GETTING DATA FROM CLIENT
    const {name,email,password} = req.body;
    //TO PUSH DATA INTO DATABSE WE WILL USE Mongo-DB
})

//MAKING IT PUBLIC TO USE ANYWHERE
module.exports = authRouter;