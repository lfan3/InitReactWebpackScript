require('dotenv').config()

const express = require('express')
const app = express()
const http = require('http')
const server = http.createServer(app)
const bodyParser = require('body-parser')
const cors = require('cors')

const router = require('./router')

//todo port
app.use(cors({
    origin : 'http://localhost:8085',
    methods : ['GET', 'POST'],
    credentials:true
}));

app.use(bodyParser.json({limit : '10mb'}))
app.use(bodyParser.urlencoded({extended : true, limit : '10mb'}));
app.use(router)

server.listen(8799, ()=>{
    console.log('running on 5000');
})
