#!/bin/bash

src_dir=$1
dst_dir=$2
if test -z "$src_dir" -o -z "$dst_dir"; then
    echo "usage: <src_dir> <dst_dir>"
    echo "depends: apt install fcitx-tools"
    exit 1
fi

set -e

cd $src_dir
for src in *.scel; do
    dst=$(echo "$dst_dir/$src" | sed 's/.scel$/.dict/')
    tmp=$(mktemp /tmp/dict_XXXX)
    scel2org -a "$src" -o "$tmp"
    mv "$tmp" "$dst"
done



