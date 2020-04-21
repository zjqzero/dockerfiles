#!/bin/sh

remove_files() {
    file_path=$1
    ext_type=$2
    find $1 -name "$2" -exec rm -rf {} \;
}

remove_commects() {
    file_path=$1
    find $1 -name "*.c" -exec sed -i "s/\/\*.*\*\///" {} \;
    find $1 -name "*.c" -exec sed -i "/^[ \t]*\/\*/,/.*\*\//d" {} \;
}

rename_so_files() {
    for src_file in `find . -name "*.so"`; do
      dst_file=`echo $src_file | sed -e 's/\.cpython.*gnu//g'`;
      mv $src_file $dst_file; 
    done
}


cd /to_build

python3 setup.py build_ext --inplace

remove_files ./app *.py
remove_files ./app *.c
rename_so_files

rm -rf build
