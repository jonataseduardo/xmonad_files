#!/bin/sh
TIME="1h"
LINK="http://interfacelift.com/wallpaper_beta/downloads/random/hdtv/index.php"
DIR="/home/jonatas/Pictures"

lynx --source `lynx -dump $LINK | grep -m 1 1920x1080.jpg | cut -c7-` > $DIR/wallpaper.jpg.temp
mv $DIR/wallpaper.jpg.temp $DIR/wallpaper.jpg
feh --bg-center $DIR/wallpaper.jpg
