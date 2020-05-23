#!/bin/sh
cd /usr/local/bin
sudo mkdir linux-create-cxx-project
cd linux-create-cxx-project
curl -LJO https://raw.githubusercontent.com/sohaibqasem/linux-create-cxx-project/master/create-cplusplus-project.sh & curl -LJO https://raw.githubusercontent.com/sohaibqasem/linux-create-cxx-project/master/LICENSE
chmod +x create-cplusplus-project.sh
sudo mkdir bin
cd bin
curl -LJO https://raw.githubusercontent.com/sohaibqasem/linux-create-cxx-project/master/bin/cmake-files.sh & curl -LJO https://raw.githubusercontent.com/sohaibqasem/linux-create-cxx-project/master/bin/proj-str.sh & curl -LJO https://raw.githubusercontent.com/sohaibqasem/linux-create-cxx-project/master/bin/scripts.sh & curl -LJO https://raw.githubusercontent.com/sohaibqasem/linux-create-cxx-project/master/bin/sample.sh
chmod +x cmake-files.sh
chmod +x proj-str.sh
chmod +x sample.sh
chmod +x scripts.sh
cd $HOME
echo "export PATH=$PATH:/usr/local/bin/linux-create-cxx-project" >> .bashrc