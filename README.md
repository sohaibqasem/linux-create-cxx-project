[![Os](https://img.shields.io/badge/os-linux-green.svg?branch=master)](https://img.shields.io/badge/os-linux-green)
[![License](https://img.shields.io/github/license/sohaibqasem/linux-create-cxx-project)](https://img.shields.io/github/license/sohaibqasem/linux-create-cxx-project)

![Release](https://img.shields.io/github/v/release/sohaibqasem/linux-create-cxx-project?include_prereleases)

![downloads](https://img.shields.io/npm/dw/linux-create-cxx-project)


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
 * Generate static, shared libraries and link it to your projects
 * Add setup script for easy installation
 * manage the project throgh npm scripts 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

## OverView

### Prerequisites

you will need to install **cmake**, **make**, **g++**, you can install these tools from your package manager

* To check if a dependenciy installed
```
<toolName> --version
```
## How to use

```
npx linux-create-cxx-project <appName>
cd <appName-workSpace>
npm start
npm run exe
```

## Install it locally
  - clone it
  - run
    ```
    cd linux-create-cxx-project
    sudo ./setup.sh
    cd && echo "export PATH=\$PATH:/usr/local/bin/linux-create-cxx-project" >> .bashrc
    ```
  - navigate where you want to create the project and run:
      ```
      create-cplusplus-project.sh <app-name>
      ```

enjoy coding :rocket:

### Use Cases
* Navigate to what dir you want
* run the script 
Ex:
```
npx linux-create-cxx-project <appName>
```
### To build and compile your code
  ```
  npm start
  npm run exe
  ```
  
### To build a release
   ```
   npm release
   npm run exe
   ```

### To import static library
   * Move header files to include dir
   * Move xxx.a file to libs dir

### To import dynamic library
   * Move header files to include dir
   * Move xxx.so file to libs dir
     
### To create a library
  ```
  npm run create-lib <lib-name> <lib-type>
  ```
       * lib types
          - st >> static
          - dy >> shared
   - to build the library run 
     ```
     npm run build-lib <lib-name>
     ```
   - to build the library and link it run
     ```
     npm run build-lib <lib-name> <app-name>
     ```
     Note: everytime you make change to the library you need to build it again
   
### C++ Project Structure
  ```
  <appName-workSpace>
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
          src/
              Main.cpp
              .
              .
      scripts/
              release.sh
              start.sh
              create-lib.sh
              build-lib.sh
  ```
  
## Built With

* Shell script - used to generate the project structure and sample code

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details
