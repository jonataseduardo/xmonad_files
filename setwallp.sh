#!/bin/sh
#TIME="3600s"
LINK="http://interfacelift.com/wallpaper_beta/downloads/random/hdtv/index.php"
DIR="/home/jonatas/Dropbox/"

#while [ 1 = 1 ]; do
    #echo "foo"
    lynx --source `lynx -dump $LINK | grep -m 1 1920x1080.jpg | cut -c7-` > $DIR/wallpaper.jpg.temp
    mv $DIR/wallpaper.jpg.temp $DIR/wallpaper.jpg
    feh --bg-fill $DIR/wallpaper.jpg
    #echo "Sleeping for $TIME"
    #sleep "$TIME"
#done
