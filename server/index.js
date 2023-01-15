const express = require('express');

const app = express();
const PORT=3000;

app.get('/hello-world',(req,res)=>{
    res.send("hello world");
})

app.listen(PORT,"0.0.0.0" ,()=>{
    console.log(`Connected at PORT ${PORT}`)
});
