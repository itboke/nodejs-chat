### ... ###
chat = {
	ws:io.connect('127.0.0.1:8888')
	### 绑定客户端监听 ###
	init:()->
		_self = this
		_self.bind()
		_self.onMessage()
	sendMessage:(message)->
		_self = this
		_self.ws.emit('send',message)
	onMessage:()->
		_self = this
		_self.ws.on 'get',(msg)->
			_self.setMessage(msg)
	setMessage:(message)->
		_html = ''
		
	bind:()->
		_self = this
		$(document).on 'click','#send-btn',()->
			news = $('#send-message').val()
			if news == ''
				console.log '请填写消息!!'
				return false
			_self.sendMessage news


}

chat.init()
