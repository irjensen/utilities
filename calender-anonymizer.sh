#!/bin/bash

sourcefile=$1
destfile=$2

echo $sourcefile
echo $destfile

if [ -e $destfile ]
 then 
  echo 'Destination filename already exists'
  exit 1
fi



targettokens=('ORGANIZER' 'SUMMARY' 'GEO' 'DESCRIPTION' 'PRODID' 'CATEGORIES' 'ORGANIZER' 'URL' 'LOCATION')

while IFS='' read -r LINE || [ -n "${LINE}" ]; do

    flag=1
    for i in "${targettokens[@]}"
    do
#        echo "processing line: ${LINE} ; ${i}"
        if [[ "$LINE" == *"$i"* ]];
        then
            flag=0
            break
        fi
    done
    if [[ $flag -eq 1 ]]; 
    then
        echo "${LINE}" >> $destfile
    fi
done < $sourcefile

exit 0
