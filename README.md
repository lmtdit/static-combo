# Static Combo Server
--------------
A Taobao.com-style combo handler in Node.js.

## Install


### Install PM2
```
npm install pm2 -g
```
PM2 is a production process manager for Node.js applications with a built-in load balancer. It allows you to keep applications alive forever, to reload them without downtime and to facilitate common system admin tasks.


### Install node module
```
npm install
```



This is the default configuration.Modify the configuration according to the static directory of your project.
```
{
    "port": 3333,
    "dev": {
        "port": 3000,
        "assetsPath": "./test/"
    },
    "assetsPath": "./test/",
    "combo_str":"??",
    "combo_split":","
}
```

## Start Combo

**Start combo server in the production environment.

```
sh bin/run.sh
```

**Start combo server in the development environment**

```
NODE_ENV=development pm2 start lib/init.js -i max -n combo
```


## Demo
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Test Combo</title>
</head>
<body>
    <div style="padding:30px">
        <!-- js -->
        <a href="http://g.tbcdn.cn/??kissy/k/1.4.4/seed-min.js,mui/seed/1.4.5/seed.js,mui/btscfg-g/1.3.0/index.js">http://g.tbcdn.cn/??kissy/k/1.4.4/seed-min.js,mui/seed/1.4.5/seed.js,mui/btscfg-g/1.3.0/index.js</a>
        <br>
        <br>
        <a href="http://localhost:3333/??js/kissy.min.js,js/seed.min.js,js/index.js">http://localhost:3333/??js/kissy.min.js,js/seed.min.js,js/index.js</a>
        <br>
        <br>
        <!-- css -->
        <a href="http://g.tbcdn.cn/??mui/global/1.2.42/global.css,mui/global/1.2.42/responsive.css,tm/fp/3.0.25/css/index.css">http://g.tbcdn.cn/??mui/global/1.2.42/global.css,mui/global/1.2.42/responsive.css,tm/fp/3.0.25/css/index.css</a>
        <br>
        <br>
        <a href="http://localhost:3333/??css/global.css,css/responsive.css,css/index.css">http://localhost:3333/??css/global.css,css/responsive.css,css/index.css</a>
    </div>
</body>
</html>
```
