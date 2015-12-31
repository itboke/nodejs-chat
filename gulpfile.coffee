### 引入模块列表 ###
gulp = require('gulp')
less = require('gulp-less')


### 定义编译less 测试成功 ###
gulp.task 'compileLess',()->
	gulp.src './publish/stylesheet/*.less'
		.pipe less()
		.pipe gulp.dest './publish/stylesheet'



### 默认执行任务 ###
gulp.task 'default',['compileLess']


### 控制台自动监控任务更新 ###
gulp.watch './publish/stylesheet/*.less',['compileLess']