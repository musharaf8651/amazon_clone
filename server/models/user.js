const mongoose = require('mongoose');

//SCHEMA => IT IS A STRUCTURE OR A JSON-FORMAT FOR YOUR MODEL LIKE FOR USER WE HAVE NAME,EMAIL ANS PASSWORDS.

const userSchema = mongoose.Schema({
    name:{
        required:true,
        type:String,
        trim:true,
    },
    email:{
        required:true,
        type:String,
        trim:true,
        validate:{
            validator:(value)=>{
                //REGEX is known as Regular expression we will use regex of email to match the email user will enter 
                const re =  /^[-!#$%&'*+\/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&'*+\/0-9=?A-Z^_a-z`{|}~])*@[a-zA-Z0-9](-*\.?[a-zA-Z0-9])*\.[a-zA-Z](-?[a-zA-Z0-9])+$/;
                value.match(re);

            }
        }
    },
    password:{
        required:true,
        type:String,
        
    }
}) 