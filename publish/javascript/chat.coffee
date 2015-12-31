### ... ###
chat = {
	ws:io.connect('http://127.0.0.1:8888')
	### 绑定客户端监听 ###
	init:()->
		_self = this
		_self.bind()
	sendMessage:(message)->
		ws.emit('send',message)
	bind:()->
		$(document).on 'click','#send-btn',()->

	
}

chat.init()
