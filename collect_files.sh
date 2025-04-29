#!/bin/bash
Path_from="$1"
Path_to="$2"
find "$Path_from" -type f | while read -r file; do
        Full_name=$(basename "$file")
        Name="${Full_name%.*}"
        Extension="${Full_name##*.}"
        NewPath="$Path_to/$Full_name"

if [ -e "$NewPath" ]; then
        i=1
        while [ -e "$Path_to/${Name}$i.$Extension" ]; do
                ((i++))
        done
        NewPath="$Path_to/${Name}$i.$Extension"
fi
cp "$file" "$NewPath"
done