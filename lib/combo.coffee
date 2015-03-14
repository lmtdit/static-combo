path = require("path")
fs = require("fs")
Tools = require('./tools')
ETag = require('etag')
config = Tools.getJSONSync "config.json"

assetsBasePath = null
COMBO_STR   = config.combo_str or "??"
COMBO_SPLIT = config.combo_split or ","

_combo = (req, res)->
    url = req.url
    fileList = []
    fileExt = null
    fileSize = 0
    fileLastModifyed = null
    fileLastModifyedStat = null

    # 计算处理的文件队列
    addToList = (file)->
        if fs.existsSync(file) and fs.statSync(file).isFile()
            stat = fs.statSync(file)
            if stat.isFile()
                ext = path.extname(file)
                if not fileExt or fileExt is ext
                    # 文件类型
                    fileExt = ext
                    # 文件大小
                    fileSize += stat.size
                    # 最后修改时间
                    if not fileLastModifyed or stat.mtime > fileLastModifyed
                        fileLastModifyed = stat.mtime
                        fileLastModifyedStat = stat
                    fileList.push(file)
 
    # 处理url
    url = path.normalize url.replace(/\.\./g, '')
    comboIndex = url.indexOf(COMBO_STR)
    
    # CMD模块的处理判断
    if comboIndex > -1
        # combo
        basePath = url.slice(0, comboIndex)
        comboPath = url.slice comboIndex + COMBO_STR.length
                       .split COMBO_SPLIT
        console.log(comboPath)
        # comboPath.each comboPath,(p)->
        #     addToList path.join(assetsBasePath, basePath, p)
        for p in comboPath
            addToList path.join(assetsBasePath, basePath, p)
    else
        # no combo
        addToList path.join(assetsBasePath, url)

    # 请求的返回
    if fileList.length > 1
        res.type(fileExt)
        res.set({
            'Cache-Control': 'public, max-age=31536000'
            'Last-Modified': fileLastModifyed
            'Content-Length': fileSize
            'ETag': ETag(fileLastModifyedStat)
        })
        console.log(fileList)
        Tools.deepDo(
            fileList
            (p, cb)->
                Stream = fs.createReadStream(p,{encoding:'utf8'})
                Stream.pipe res,{end: false}
                # Stream.on 'data',(data)->
                #     console.log data
                Stream.on 'end',->
                    cb()
            ->
            ->
                res.end()
        )
        
    else if fileList.length is 1
        res.sendFile fileList[0], {maxAge: Infinity}

    else
        res.sendStatus 404

module.exports = (p)->
    assetsBasePath = p
    return _combo