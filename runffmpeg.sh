#!/bin/sh

fileNames=`ls *.mp4`
for file in $fileNames
do
  file_name=`basename $file .mp4`
  mkdir "video $file_name"
  mv $file "video $file_name"/
  cd "video $file_name"
  ffmpeg -i "$file" -c:a aac -strict experimental -c:v libx264 -s 320x180 -f hls -hls_list_size 1000000000 -hls_time 10 180_out.m3u8
	sleep 10
  ffmpeg -i "$file" -c:a aac -strict experimental -c:v libx264 -s 480x270 -f hls -hls_list_size 1000000000 -hls_time 10 270_out.m3u8
	sleep 10
  ffmpeg -i "$file" -c:a aac -strict experimental -c:v libx264 -s 640x360 -f hls -hls_list_size 1000000000 -hls_time 10 360_out.m3u8
	sleep 10
  ffmpeg -i "$file" -c:a aac -strict experimental -c:v libx264 -s 960x540 -f hls -hls_list_size 1000000000 -hls_time 10 540_out.m3u8
	sleep 10
  ffmpeg -i "$file" -c:a aac -strict experimental -c:v libx264 -s 1280x720 -f hls -hls_list_size 1000000000 -hls_time 10 720_out.m3u8
  cd ..
  sleep 1m
done



  

