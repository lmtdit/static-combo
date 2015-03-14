#!/bin/bash

export PATH=/usr/local/bin:/bin:/usr/bin
export NODE_PATH=/usr/local/lib/node_modules

NODE_ENV=production pm2 start lib/init.js -i max -n combo
pm2 flush
pm2 logs combo
