
chat = io.connect 'http://cowbear/chat'

chat.on 'connect', (data) ->
  chat.emit 'hi!'

chat.on 'hey', (data) ->
  console.log data

