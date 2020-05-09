#!/bin/bash

vfile=$(date +%s )vid.mp4
if [ $# -eq 0 ]
  then
    audioFile=$(date +%s )audio.wav
    imgFile=$(date +%s )image.jpg	
    #instead of recordin a/v we will pass the file in args to this bash
    #Capture photo from device id 0(primary camera) after a lapse 0f .5 seconds at framerate of 30fps:
    ffmpeg -ss 0.5 -f avfoundation -framerate 30 -i "0" -t 1 $imgFile



    #10 second audio:
    sox -b 32 -e unsigned-integer -r 96k -c 2 -d --clobber --buffer $((96000*2*10)) $audioFile trim 0 10
  else
    audioFile=$1
    imgFile=$2
fi
#video file1:
ffmpeg -loop 1 -i $imgFile -i $audioFile -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest $vfile || echo "fat gaya code"


