#!/bin/bash

# selects all files ending in gz
# creates directory based on prefix of filenames
# moves files into directory

for file in *.gz
do
	tail=${file#*_*_}  			# Selects the (features/barcodes/matrix).(tsv/mtx).gz by removing the first two groups separated by _
	dir=${file%_"$tail"}			# Removes the tail end, giving the appropriate directory name
	newname=$dir/$tail			# Remove the sample ID from the filename
	mkdir -p "$dir" && mv $file $newname		# makes directory and moves file in
done
