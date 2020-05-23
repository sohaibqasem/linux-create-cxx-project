[![Os](https://img.shields.io/badge/os-linux-green.svg?branch=master)](https://img.shields.io/badge/os-linux-green)
[![License](https://img.shields.io/github/license/sohaibqasem/linux-create-cxx-project)](https://img.shields.io/github/license/sohaibqasem/linux-create-cxx-project)
![Release](https://img.shields.io/github/v/release/sohaibqasem/linux-create-cxx-project?include_prereleases)


# linux-create-cxx-project
easy to use shell script using cmake to create c++ project


Create c++ project  works on Linux.
If something doesn’t work, please file an issue.
If you have questions or need help, please ask

### Main fetures
 * Complie whatever you have written
 * Import static libraries to your project
 * Import shared libraries to your project
 ### New
 * Generate static libraries and link it to your projects
 * Add setup script for easy installation
 ### What's next
 * Add Testing folder to create tests using gTest
 * Improve scripts and add more fetures

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.


### Prerequisites

you will need to install cmake, make, g++, you can install these tools from your package manager

* To check if all dependencies installed
```
<toolName> --version
```

### Installing
```
curl -LJO https://raw.githubusercontent.com/sohaibqasem/linux-create-cxx-project/master/setup.sh && sudo  sh setup.sh && rm setup.sh 
```

enjoy coding :rocket:

### Use Cases
* Navigate to what dir you want
* run the script 
Ex:
```
create-cplusplus-project.sh <App Name>
```


### To import static library
   * Move header files to include dir
   * Move xxx.a file to libs dir
   * Add this line to the CMakeLists.txt
      ```
      target_link_libraries(proj-Name PRIVATE xxx.a)
      ```

### To import dynamic library
   * Move header files to include dir
   * Move xxx.a file to libs dir
   * Add this line to the CMakeLists.txt
      ```
      target_link_libraries(proj-Name PRIVATE xxx.so)
      ```
     
### To create static library
   * Go to scripts dir
   * run create-lib script
     ```
     ./create-lib.sh lib-name
     ```
   * To build the library run
     ```
     ./build.sh
     ```
   * To complete linking it with your project Add this line to the CMakeLists.txt
     ```
     target_link_libraries(proj-Name PRIVATE xxx.so)
     ``` 
     Note: everytime you make change to the library you need to build it again
   
### C++ Project Structure
  ```
  <app-name-workSpace>
      <lib1>
          build/
          include/
          src/
          ./build.sh
      <lib2>
        .
        .
      <app-name>
          build/
          include/
          libs/
          scripts/
              rebuild.sh
              release.sh
              start.sh
              create-lib.sh
          src/
              Main.cpp
              .
              .
  ```
  
## Built With

* Shell script - used to generate the project structure and sample code

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details
