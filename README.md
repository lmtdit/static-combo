# Static Combo Handler

A lightweight ,but powerful static combo handler in NodeJS. 
If you want to use TaoBao-Style combo-hander, please visit [here](https://github.com/lmtdit/static-combo/tree/v1.0.0).

--------------


## Install
```
npm i static-combo-handler
```

## Usage

```CoffeeScript
Express = require 'express'
combo = require 'static-combo-handler'
app = Express()
opt = {
    "port": 3333,
    "assetsPath": "./path-to-static-files-dir",
    "combo_tag":"??",
    "combo_dir_tag":"__",
    "combo_mod_split":","
}
app.set 'port', process.env.PORT or opt.port
app.use combo(opt)
app.listen app.get('port')
```

## Demo

*Modify  `config.json`*
```json
{
    "port": 3333,
    "assetsPath": "./assets",
    "combo_tag":"??",
    "combo_dir_tag":"__",
    "combo_mod_split":","
}
```

*Install && Run Demo*
```shell
npm install
npm install supervisor 
supervisor combo.js
```

*URL access as:*
```markup
<!-- combo css -->
http://localhost:3333/??assets/css__common.css,index.css
http://localhost:3333/??assets/css__common.css,index.css,v=2.1.1
http://localhost:3333/??assets/css__common.css,index.css__v=2.1.1
<!-- debug -->
http://localhost:3333/??assets/css__common.css,index.css__debug
http://localhost:3333/??assets/css__common.css,index.css,v=2.1.1__debug
http://localhost:3333/??assets/css__common.css,index.css__v=2.1.1__debug
<!-- or -->
http://localhost:3333/??assets_css__common.css,index.css
http://localhost:3333/??assets__css/common.css,css/index.css


<!-- combo javascript -->
http://localhost:3333/??assets/js__jquery.js,vmcore.js
http://localhost:3333/??assets/js__jquery.js,vmcore.js,v=2.1.1
http://localhost:3333/??assets/js__jquery.js,vmcore.js__v=2.1.1
<!-- debug -->
http://localhost:3333/??assets/js__jquery.js,vmcore.js__debug
http://localhost:3333/??assets/js__jquery.js,vmcore.js,v=2.1.1__debug
http://localhost:3333/??assets/js__jquery.js,vmcore.js__v=2.1.1__debug
<!-- or -->
http://localhost:3333/??assets_js__jquery.js,vmcore.js
http://localhost:3333/??assets__js/jquery.js,js/vmcore.js


<!-- no combo -->
http://localhost:3333/assets/js/jquery.js
http://localhost:3333/assets/css/index.js
http://localhost:3333/assets/img/cool.png
```

## Deploy server to production environment

### Step 1: Install PM2
```
npm install pm2 -g
```

> PM2 is a production process manager for Node.js applications with a built-in load balancer. It allows you to keep applications alive forever, to reload them without downtime and to facilitate common system admin tasks.


### Step 2: Install node module
```
npm install
```

### Step 3: Start combo server in the production environment
```
sh bin/run.sh
```

*Restart the server*

```
sh bin/restart.sh
```

*Stop the server*
```
sh bin/stop.sh
```

## License
MIT.

## The End.