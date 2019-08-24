#!/bin/bash -
#===============================================================================
#
#          FILE: chapter_folders.sh
#
#         USAGE: ./chapter_folders.sh
#
#   DESCRIPTION: Makes a bunch of directories with the name Chapter1, Chapter2, ... Chapter (end)
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

i=1
read -p "What is the last chapter number?" last

while [ $i -le $last ]
do
	mkdir Chapter$i
	((i++))
done
