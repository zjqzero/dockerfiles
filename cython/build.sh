#!/bin/sh

old_dir=`pwd`
dir="$1"

cd $1

python3 setup.py build_ext --inplace

find . -name "*.py" -exec rm -rf {} \;
find . -name "*.c" -exec rm -rf {} \;
rm -rf build

for src_file in `find . -name "*.so"`; do
  dst_file=`echo $src_file | sed -e 's/\.cpython.*gnu//g'`;
  mv $src_file $dst_file; 
done


cd $old_dir