###　聊天的方法　 ###
chat=(server)->
	### 引入socket.io模块 ###
	socketio = require 'socket.io'
	###  定义聊天的一些变量  ###
	nameused = []
	currentRoom = {}
	guestNumber = 1
	io = socketio.listen server
	io.sockets.on 'connection',(socket)->
		socket.on 'send',(msg)->
			socket.emit 'get',msg




exports.listen = chat
	



