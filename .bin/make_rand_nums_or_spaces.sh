#!/bin/bash
#Generates given length random string.
#If no argument given, returns one that is length 10

result=""
i=0
if [ $# -eq 0 ]
then
	max=10
else
	max=$1
fi
	
while [ "$i" -lt "$max" ]
do
	rand="$(( RANDOM % 11 ))"
	if [ $rand -eq 10 ]
	then
		result+=' '
	else
		result+=$rand
	fi
	((i++))
done
echo "$result"
