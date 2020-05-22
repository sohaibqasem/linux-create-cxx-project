projName=$1

cd $projName-workSpace/$projName
cd scripts
echo "
#!/bin/sh
cd ..
rm -r build/
mkdir build
./build.sh
./compile.sh
" > start.sh

echo "
#!/bin/sh
cd ..
rm -r build/
mkdir build

" > release.sh

echo "
#!/bin/sh
libName=\$1
cd ../..
mkdir \$libName
" > create-lib.sh

cd ..