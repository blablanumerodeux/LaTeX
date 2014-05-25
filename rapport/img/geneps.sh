#!/bin/sh

for image in `ls *.png`
do
	baseimage=`echo $image | sed s/.png//`
	echo "$image -> ${baseimage}.eps"
	convert $image ${baseimage}.eps
done
echo "OK."
