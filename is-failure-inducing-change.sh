#!/bin/bash

# we can make a backup copy of our original file
cp wireworld-original.c wireworld-copy.c

for i in $*
do
    # Apply patch and compile
    patch -p0 wireworld-copy.c < patch.$i
done

gcc -c wireworld-copy.c


if [ "$?" == 0 ]; then
    # when all patches are successfully applied 
    exit 0
else
    exit 1
fi