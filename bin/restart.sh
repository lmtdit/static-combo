#!/bin/bash


pm2 flush
NODE_ENV=production pm2 restart combo
pm2 logs combo