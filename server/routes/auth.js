//IMPORTS
const express = require('express');
const authRouter = express.Router();
const User = require("../models/user");
const bcrypt = require('bcryptjs')

//CREATING A POST REQUIEST FOR SIGNUP PAGE
//WHENEVER WE MAKE POST REQUEST WE USE req.body
authRouter.post('/api/signup',async(req,res)=>{
    try{
        const {name,email,password} = req.body;
        //TO PUSH DATA INTO DATABSE WE WILL USE Mongo-DB
    
       const existingUser = await User.findOne({ email });
        if (existingUser) {
          return res
            .status(400)
            .json({ msg: "User with same email already exists!" });
        }
        const hashPassword = await bcrypt.hash(password,8);
    
       let user = new User({
            email,
            password:hashPassword,
            name,
       })
       user = await user.save();
       res.json(user);
    }
    //GETTING DATA FROM CLIENT
    catch(e){
        res.status(500).json({error:e.message});
    }
})

//MAKING IT PUBLIC TO USE ANYWHERE
module.exports = authRouter;