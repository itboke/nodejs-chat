### 服务端入口文件 ###
http = require('http')
path = require('path')
mime = require('mime')
fs = require('fs')
cache = {}
### 全局 http 请求文件不存在 发送404 ###
send404 = (response)->
	response.writeHead 404,{'Content-Type':'text/plain'}
	response.write 'Error 404: Page not found!'
	response.end()
### 发送文件内部的数据  ###
sendFile = (response,filepath,fileContent)->
	response.writeHead 200,{'Content-Type':mime.lookup path.basename filepath}
	response.end fileContent
### 提供静态文件服务 ###
serveStatic = (response,cache,absPath)->
	console.log(absPath)
	if cache[absPath]
		response.write('有缓存')
	else
		##检查文件是否存在
		fs.exists absPath,(exists)->
			if exists
				fs.readFile absPath,(err,data)->
					if err
						send404(response)
					else
						cache[absPath] = data
						sendFile response,absPath,data
			else
				send404 response
				
###  创建一个http服务器和启动服务器 ####
server = http.createServer (request,response)->
	filepath = false
	if request.url == '/'
		filepath = 'publish/index.html'
	else
		filepath = 'publish' + request.url
	absPath = '../' + filepath
	###  响应请求  ###
	serveStatic response,cache,absPath
server.listen 8888