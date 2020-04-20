#!/bin/sh

cd /to_build

python3 setup.py build_ext --inplace

find ./app -name "*.py" -exec rm -rf {} \;
find ./app -name "*.c" -exec rm -rf {} \;
rm -rf build

for src_file in `find . -name "*.so"`; do
  dst_file=`echo $src_file | sed -e 's/\.cpython.*gnu//g'`;
  mv $src_file $dst_file; 
done
