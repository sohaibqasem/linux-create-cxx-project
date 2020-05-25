#!/bin/sh

projName=$1

mkdir "$projName-workSpace"
cd "$projName-workSpace"

echo "
{
  \"name\": \"$projName\",
  \"version\": \"1.0.0\",
  \"description\": \"\",
  \"main\": \"\",
  \"scripts\": {
    \"test\": \"echo \\\"Error: no test specified\\\" && exit 1\",
    \"start\": \"scripts/start.sh\",
    \"release\": \"scripts/release.sh\",
    \"exe\": \"clear && $projName/build/$projName\",
    \"create-lib\": \"bash scripts/create-lib.sh\",
    \"build-lib\": \"bash scripts/build-lib.sh\",
    \"install\": \"mkdir -p scripts && cd scripts &&curl -LJO https://raw.githubusercontent.com/sohaibqasem/linux-create-cxx-project/master/bin/scripts.sh && sh scripts.sh $projName && rm scripts.sh && chmod +x start.sh && chmod +x release.sh && chmod +x create-lib.sh\"

  },
  \"author\": \"\",
  \"license\": \"ISC\"
}
" > package.json

echo "
# See https://help.github.com/articles/ignoring-files/ for more about ignoring files.

# production
build

# dev tools
scripts
package-lock.json

" > .gitignore


mkdir $projName
mkdir scripts

cd $projName
mkdir include
mkdir libs
mkdir build


touch CMakeLists.txt

cd ..
cd scripts

touch start.sh
touch release.sh
touch create-lib.sh
touch build-lib.sh


chmod +x start.sh
chmod +x release.sh
chmod +x create-lib.sh
chmod +x build-lib.sh

cd ..
cd $projName
mkdir src
cd src
touch Main.cpp
cd ..