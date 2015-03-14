Express = require 'express'
bodyParser = require 'body-parser'
morgan = require 'morgan'
methodOverride = require 'method-override'
errorHandler = require 'errorhandler'
compression = require 'compression'
Tools = require('./tools')
combo = require './combo'

config = Tools.getJSONSync "config.json"

# 中间件
app = Express()
app.set 'port', process.env.PORT or config.port
app.use compression()
app.use morgan('dev')
app.use bodyParser.urlencoded({
        'extended': false
    })
app.use bodyParser.json({})
app.use methodOverride()
app.use Express.query()
app.use errorHandler()

# 设置配置
app.set('baseAssetsPath', config.assetsPath)

# development only
if app.get 'env' is 'development'
    app.set 'port', config.dev.port
    app.set 'baseAssetsPath', config.dev.assetsPath

_baseAssetsPath = app.get('baseAssetsPath')

# 单一文件
app.use Express.static(
        app.get('baseAssetsPath'), {maxage: Infinity}
    )

# combo
app.use combo(app.get('baseAssetsPath'))

# 启动服务
app.listen app.get('port'), ->
    console.log "Express Assests Combo Service run at " + app.get('env') + " listening on port" + app.get('port')
