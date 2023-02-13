# Operating System Development

This repository contains the source code for a custom bootloader and operating system that I built from scratch using C and Assembly. The bootloader is responsible for loading the operating system into memory and starting its execution, while the operating system provides basic functionality such as process management, memory management, and input/output.

## Features

- Custom bootloader that loads the operating system into memory and starts its execution
- Basic operating system with process management, memory management, and input/output
- Demonstration of low-level programming concepts and system architecture

## Tech Stack

This project was built using:

- C programming language
- Assembly language (x86 architecture)
- NASM (Netwide Assembler) for assembling the Assembly code
- GCC (GNU Compiler Collection) for compiling the C code
- VirtualBox (or other virtualization software) for testing the operating system

## Running the Project

1. Clone this repository to your local machine
2. Navigate to the project directory in the terminal
3. Assemble the bootloader and operating system code by running the `make` command
4. Create a virtual machine in VirtualBox or similar software and attach the generated `os.img` file as a floppy disk image
5. Boot the virtual machine and observe the bootloader and operating system in action

## Deployment

This project was designed for educational purposes and is not intended for production deployment. However, you can use the concepts and techniques demonstrated in this project to build your own custom operating system for personal or educational use.

## Contact

If you have any questions or comments about this project, please don't hesitate to reach out through the issue tracker on this repository or via email at ryan.m.coble@gmail.com. I'm always happy to help and collaborate with other developers.

Thank you for checking out this project!
