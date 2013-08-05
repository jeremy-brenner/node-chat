
express = require 'express'
coffee = require 'coffee-script'
http = require 'http'
fs = require 'fs'

app = express()
server = http.createServer app
io = require('socket.io').listen server

server.listen 8080

app.get '/', (req,res) ->
  res.sendfile "#{__dirname}/index.html"

app.get '/js/:script.js', (req, res) ->
  cs = fs.readFileSync "#{__dirname}/coffee/#{req.params.script}.coffee", "ascii"
  js = coffee.compile cs 
  res.header 'Content-Type', 'application/javascript'
  res.send js

chat = io
  .of('/chat')
  .on 'connection', (socket) ->
    chat.emit 'hey', 'sombody connected'

