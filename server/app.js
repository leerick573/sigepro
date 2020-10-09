const express = require('express');
const server = express();
const mysql = require('mysql');
const cors = require('cors');
const bodyParser=require("body-parser");
const pool = mysql.createPool({
    host:'127.0.0.1',
    port:3306,
    user:'root',
    password:'',
    database:'sige',
    connectionLimit:'15'
});
server.listen(3000,()=>{
    console.log("server is running");
});
server.use(cors({
    origin:['http://127.0.0.1:8080','http://localhost:8080']
}))
server.use(bodyParser.urlencoded({
    extended:false
}));

//注册功能
server.post('/regist',(req,res)=>{
    let email = req.body.email;
    let phone = req.body.phone;
    let obj = req.body;
    let sql = 'select * from sige_user where email = ? and phone = ?'
    pool.query(sql,[email,phone],(err,results)=>{
        if(err) throw err;
        if(results.length>0){
            res.send({message:'用户名已存在',code:0,results:results});
        }else{
            let sql = 'insert into sige_user set ?';
            pool.query(sql,[obj],(err,results)=>{
                if(err) throw err;
                res.send({message:'注册成功',code:1,results:results});
            })
        }
    })
})

// 登录功能
server.get('/login',(req,res)=>{
    let name = req.query.name;
    let password = req.query.password;
    let sql = 'select * from sige_user where email = ? and password = ?';
    pool.query(sql,[name,password],(err,results)=>{
        if(err) throw err;
        if(results.length > 0){
            res.send({message:'登录成功',code:1,results:results})
        }else{
            res.send({message:'登录失败',code:0,results:results})
        }    
    });
})

//详情页
server.get('/detail',(req,res)=>{
    let did = req.query.did;
    let sql = 'select * from sige_pro where detail_id = ?'
    pool.query(sql,[did],(err,results)=>{
        if(err) throw err;
        res.send({results:results})
    })
})

//分类列表
server.get('/category',(req,res)=>{
    let sql = 'select*from sige_category';
    pool.query(sql,(err,results)=>{
        if(err) throw err;
        res.send({results:results})
    })
})

//商品列表，按分类显示
server.get('/listcid',(req,res)=>{
    let cid = req.query.cid;
    let sql = 'select *from sige_pro where category_id = ?';
    pool.query(sql,[cid],(err,results)=>{
        if(err) throw err;
        res.send({results})
    });
})

//商品列表，按关键字查询显示
server.get('/listall',(req,res)=>{
    let value = req.query.value;
    value = "%" + value + "%";
    let sql = 'select * from sige_pro where title like ?'
    pool.query(sql,[value],(err,results)=>{
        if(err) throw err;
        res.send({results})
    })
})
//xxxxxxxxxxxxxxxxx