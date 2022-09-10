#!/usr/bin/bash

for i in `seq 10`
do
	echo $((i-1)), $RANDOM >> inputFile
done
