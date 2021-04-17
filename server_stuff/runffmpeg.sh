#!/bin/sh


OIFS=$IFS
IFS=$'\'
for file in *.mp4 
do
  file_name=$(basename $file .mp4)
  mkdir "$file_name"
  mv $file "$file_name"/
  cd "$file_name"
  ffmpeg -i "$file" -c:a aac -strict experimental -c:v libx264 -s 320x180 -f hls -hls_list_size 1000000000 -hls_time 10 180_out.m3u8
	sleep 5
  ffmpeg -i "$file" -c:a aac -strict experimental -c:v libx264 -s 480x270 -f hls -hls_list_size 1000000000 -hls_time 10 270_out.m3u8
	sleep 5
  ffmpeg -i "$file" -c:a aac -strict experimental -c:v libx264 -s 640x360 -f hls -hls_list_size 1000000000 -hls_time 10 360_out.m3u8
	sleep 5
  ffmpeg -i "$file" -c:a aac -strict experimental -c:v libx264 -s 960x540 -f hls -hls_list_size 1000000000 -hls_time 10 540_out.m3u8
	sleep 5
  ffmpeg -i "$file" -c:a aac -strict experimental -c:v libx264 -s 1280x720 -f hls -hls_list_size 1000000000 -hls_time 10 720_out.m3u8
  cd ..
  
done
IFS="$OIFS"
