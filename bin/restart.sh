#!/bin/bash

NODE_ENV=production pm2 restart combo
pm2 logs combo