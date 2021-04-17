#!/bin/sh


OIFS=$IFS
IFS=$'\'
i=0;
for file in */
do
  echo "https://storage.googleapis.com/govtjobkaro/gk/$file""media_360.m3u8"
done
IFS="$OIFS"
