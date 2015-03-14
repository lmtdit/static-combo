#!/bin/bash

export PATH=/usr/local/bin:/bin:/usr/bin
export NODE_PATH=/usr/local/lib/node_modules

NODE_ENV=production pm2 start lib/init.js -i max -n combo
NODE_ENV=production pm2 flush
NODE_ENV=production pm2 logs
##pm2 start lib/app.js -i max -n combo
