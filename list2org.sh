#!/bin/bash
# depends: npm install pinyin

src=$1
if test -z "$src"; then
    echo "usage: $0 <src-file>"
    echo "The output is sent to the stdout."
    echo "depend: npm install pinyin"
    exit 1
fi

pinyin=~/node_modules/pinyin/bin/pinyin

set -e

#echo "writing to $tmp, please wait..."

sed -e 's/\r//g' -e 's/ *$//' -e '/^ *$/d' "$src" | while read hanz; do
    py=$($pinyin -s normal -p "'" $hanz); 
    echo $hanz $py
done | sed "s/'$//"

