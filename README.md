# linux-create-cxx-project
easy to use shell script to create c++ project with all configrations


Create c++ project  works on Linux.
If something doesn’t work, please file an issue.
If you have questions or need help, please ask

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.


### Prerequisites

you need to install cmake, g++

```
sudo apt-get install cmake g++
```

### Installing

first you need to move the project forlder to /usr/local/bin

```
sudo mv [folder] /usr/local/bin
```

Add it to the path by
opening .bashrc file and
add in the last line
```
export PATH=$PATH:/usr/local/bin/linux-create-cxx-project
```

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
* To add library-static to the project
  * copy the folder of the library to the Include dir
  * Make sure the name of the library is the same of the file inside it
  ```
  cd scripts
  add-libaray-static.sh <lib-name> --for static libaray [as source code]
  add-libaray-dynamic.sh <lib-name> --for static libaray [as binary file]
  ```
  * Then run start script
  
* To Import library-dynamic to the project
  * move .so file to /lib folder
  ```
  sudo mv <lib-name> /lib
  ```
  * copy .hpp file [header file] to the Include file
  * Make sure the name of the library is the same of the file inside it
  ```
  cd scripts
  import-libaray-dynaimc.sh <lib-name> --for importing libaray
  ```
  * Then run start script
  
## Built With

* Shell script - used to generate the project structure and sample code


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details

## What's next
