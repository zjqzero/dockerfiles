#!/bin/sh

remove_commects() {
    src_path=$1
    find $src_path -name "*.c" -exec sed -i "s/\/\*.*\*\///" {} \;
    find $src_path -name "*.c" -exec sed -i "/^[ \t]*\/\*/,/.*\*\//d" {} \;
}

rename_so_files() {
    src_path=$1
    for src_file in `find $src_path -name "*.so"`; do
      dst_file=`echo $src_file | sed -e 's/\.cpython.*gnu//g'`;
      mv $src_file $dst_file; 
    done
}

cd /to_build

python3 setup.py build_ext

rename_so_files './build'
remove_commects './build'

