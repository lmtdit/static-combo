Express = require 'express'
morgan = require 'morgan'
methodOverride = require 'method-override'
errorHandler = require 'errorhandler'
compression = require 'compression'
combo = require 'static-combo-handler'
config = require './config.json'

# 中间件
app = Express()
app.set 'port', process.env.PORT or config.port
app.use compression()
app.use morgan('dev')

app.use methodOverride()
app.use Express.query()
app.use errorHandler()

# 单一文件
app.use Express.static config.assetsPath, 
        "maxage": Infinity,
        "setHeaders": (res, path)->
            res.setHeader("Access-Control-Allow-Origin", "*")

# combo
app.use combo(config)

# 启动服务
app.listen app.get('port'), ->
    console.log "Express Assests Combo Service run at " + app.get('env') + " listening on port: " + app.get('port')
