# linux-create-cxx-project
easy to use shell script using cmake to create c++ project


Create c++ project  works on Linux.
If something doesn’t work, please file an issue.
If you have questions or need help, please ask

## Main fetures
 * Complie whatever you have written
 * Import static libraries to your project
 * Import shared libraries to your project

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.


### Prerequisites

you will need to install cmake, make, g++

* for ubuntu-Based distribution
```
sudo apt-get install cmake g++
```
* for fFedora-based
```
sudo dnf install cmake g++ make
```
* to check if all dependencies installed
```
cmake --version
make --version
g++ --version
```

### Installing
* first you need to delete "master" from folder name after cloning the repo
so it's become "linux-create-cxx-project"

* then you need to move the project forlder to /usr/local/bin

```
sudo mv [folder] /usr/local/bin
```

* Add export line to
 .bashrc file and
 add this in the last line
```
export PATH=$PATH:/usr/local/bin/linux-create-cxx-project
```
and you good to go :rocket:

### Usage
* Navigate to what dir you want
* run the script Ex:
```
create-cplusplus-project.sh <App Name>
cd <App Name>
```
* To run the executable file
```
cd scripts
./start.sh
cd ..
cd build
./<App Name>
```
* To import library-static to your project
  * copy the folder of the library [header file] to the <include> dir
  * copy the .a file to the <libs> dir
  * run the import-static script
  ```
  cd scripts
  imp-lib-static.sh <lib-name>         [lib-name is the name of .a file]
  ```
  * Then run ./start script
  
  
* To Import library-dynamic[shared] to your project
  * move .so file to /lib folder in your system files
  ```
  sudo mv <lib-name> /lib
  ```
  * copy the folder of the library [header file] to the <include> dir
  * run the import- script
  ```
  cd scripts
  imp-lib-dynamic.sh <lib-name>         [lib-name is the name of .so file]
  ```
  * Then run ./start script
  
  ### C++ Project Structure
  ```
  <app-name>
      build/
      include/
      libs/
      scripts/
          imp-lib-static.sh
          imp-lib-dynamic.sh
          start.sh
      src/
          Main.cpp
          .
          .
      compile.sh
      build.sh
      .
  ```
  
## Built With

* Shell script - used to generate the project structure and sample code
* cmake
* make
* g++


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details

## What's next
* first release
