projName=$1

cd $projName-workSpace/$projName/src
echo "
#include<iostream>
int main()
{
    std::cout << \"hi there\" << std::endl;
    return 0;    
}
" > Main.cpp
cd ..