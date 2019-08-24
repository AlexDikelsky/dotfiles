#!/bin/bash -
#===============================================================================
#
#          FILE: send_to_dropbox.sh
#
#         USAGE: ./send_to_dropbox.sh
#
#   DESCRIPTION: Send given file to dropbox
#
#        AUTHOR: Alex Dikelsky (), alexander.dikelsky@gmail.com
#  ORGANIZATION: Luther College
#       CREATED: 06/30/2019 07:02:08 PM
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

read -p "Enter the filename: " name

if [ -d "$HOME/Dropbox" ]
then
	if [ -r "$name" ]
	then
		if [ "$( find "$HOME/Dropbox" -iname "$name" )" = "" ] #Has to be iname because other OSes don't distinguish between upper and lowercase
		then
			cp "$name" "$HOME/Dropbox"
			
			echo "Completed"
		else
			echo "There is already a file in Dropbox by the same name"
			read -p "Overwrite the file? [y/n]: " response
			if [ "$response" = y ]
			then
				cp "$name" "$HOME/Dropbox"
				echo "Completed"
			else
				echo "File not added to Dropbox"
			fi	
		fi
	else
		echo "Couldn't find source file. Make sure you have read permissions"
	fi
else
	echo "Can't find dropbox. Make sure it is in your home directory and is called 'Dropbox'"
fi
