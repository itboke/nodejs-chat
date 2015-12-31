### 引入socket.io模块 ###
socketio = require 'socket.io'
###  定义聊天的一些变量  ###
io
nameused = []
currentRoom = {}
guestNumber = 1

exports.listen = (server)->

	### 把io绑定到http服务器上 ###
	@io = socketio.listen server
	### ###
	io.sockets.on 'connection',(socket)->
		console.log(socket)



