projName=$1

cd $projName
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
libName=\$1
cd ..
echo \"
target_link_libraries($projName PRIVATE \${CMAKE_SOURCE_DIR}/\$libName.a)
\" >> CMakeLists.txt
" > imp-lib-static.sh



echo "
libName=\$1
cd ..
echo \"
target_link_libraries($projName PRIVATE \$libName)
\" >> CMakeLists.txt
" > imp-lib-dynamic.sh


cd ..