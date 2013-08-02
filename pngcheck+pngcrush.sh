#!/bin/sh

source 0_append_distro_path.sh

7z x '-oC:\Temp\gcc' pngcheck-2.3.0.tar > NUL || fail_with pngcheck-2.3.0.tar - EPIC FAIL
7z x '-oC:\Temp\gcc' pngcrush-1.7.66-nolib.tar > NUL || fail_with pngcrush-1.7.66-nolib.tar - EPIC FAIL

cd /c/temp/gcc
mkdir -p dest/bin

gcc -s -O3 -fomit-frame-pointer pngcheck-2.3.0/pngcheck.c -o dest/bin/pngcheck.exe -lpng -lz || fail_with pngcheck - EPIC FAIL

gcc -s -O3 -fomit-frame-pointer pngcrush-1.7.66-nolib/pngcrush.c -o dest/bin/pngcrush.exe -lpng -lz || fail_with pngcrush - EPIC FAIL

rm -rf pngcheck-2.3.0 pngcrush-1.7.66-nolib
mv dest pngcheck+pngcrush
cd pngcheck+pngcrush

7z -mx0 a ../pngcheck+pngcrush.7z *