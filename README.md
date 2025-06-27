# 🪛 Libasm: Low-Level Assembly Library Implementation

![Language: x86-64 Assembly](https://img.shields.io/badge/Language-x86--64_Assembly-blue.svg)
![Architecture: Linux](https://img.shields.io/badge/Architecture-Linux-orange.svg)
![Build: Makefile](https://img.shields.io/badge/Build-Makefile-green.svg)
![School: 42 Paris](https://img.shields.io/badge/School-42_Paris-orange.svg)
![Grade: 125/100](https://img.shields.io/badge/Grade-125/100-brightgreen.svg)

## ✨ Overview

`Libasm` is an advanced and highly technical project from 42 Paris, focused on **reimplementing a subset of standard C library functions directly in x86-64 assembly language (Intel syntax)**. The primary goal was to gain a deep, low-level understanding of how C functions operate at the machine code level, including calling conventions, register usage, system calls, and memory management.

This project goes far beyond typical high-level programming, providing invaluable insights into operating system interactions, processor architecture, and the performance implications of low-level code. Achieving all bonuses further demonstrated mastery over complex data structures and varied arguments in assembly.

## 🌟 Implemented Functions & Features

This library provides optimized assembly implementations for critical C functions, ensuring conformity with original behaviors and precise error handling.

### **1. Standard C Library Reimplementations (Mandatory Part)**

*   `ft_strlen`: Calculates the length of a string.
*   `ft_strcpy`: Copies a string.
*   `ft_strcmp`: Compares two strings.
*   `ft_write`: Writes data to a file descriptor (system call wrapper).
*   `ft_read`: Reads data from a file descriptor (system call wrapper).
*   `ft_strdup`: Duplicates a string (involves `malloc`).

### **Core Implementation Details**

*   **x86-64 Assembly (Intel Syntax):** All functions are hand-coded in 64-bit assembly, respecting UNIX calling conventions (SysV ABI).
*   **System Call Interfacing:** Direct interaction with the Linux kernel via system calls (`write`, `read`) in assembly.
*   **`errno` Handling:** Proper setting of the `errno` global variable in case of system call errors.
*   **No `inline ASM`:** All assembly code resides in separate `.s` files, compiled with NASM.
*   **Memory Management:** Careful handling of memory, especially for `ft_strdup` which allocates memory.

### **2. Advanced Assembly Implementations (Bonus Part - Achieved All)**

*   **`ft_atoi_base`:** Converts a string representation of a number to an integer in a specified base (e.g., binary, hexadecimal), a complex parsing and conversion task fully implemented in assembly.
*   **Linked List Functions:** Reimplemented a set of core linked list manipulation functions in assembly, demonstrating dynamic data structure handling at the lowest level:
    *   `ft_list_push_front`: Adds an element to the front of a list.
    *   `ft_list_size`: Returns the number of elements in a list.
    *   `ft_list_sort`: Sorts a linked list.
    *   `ft_list_remove_if`: Removes elements from a list based on a condition.

## 🛠️ Technologies Used

*   **Language:** x86-64 Assembly (Intel Syntax)
*   **Assembler:** NASM
*   **Build System:** Makefile
*   **Concepts:** Low-Level Programming, System Calls, CPU Architecture (Registers, Stack, Memory Addressing), Calling Conventions (SysV ABI), Data Structures (Linked Lists in Assembly), Error Handling (`errno`).

## 🚀 How to Use

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/libasm.git
    cd libasm
    ```
2.  **Compile the library and test program:**
    ```bash
    make
    # This will generate 'libasm.a' and a 'test_libasm' executable (or similar, depending on your Makefile).
    ```
3.  **Run the test program:**
    ```bash
    ./test_libasm
    ```
    (Note: The exact executable name might vary based on your Makefile setup for testing. The output will demonstrate the functionality of the re-implemented assembly functions.)

## 🎓 Learning Outcomes

This project provided unparalleled insights into:

*   **Low-Level System Architecture:** Deep understanding of how hardware executes software instructions.
*   **Assembly Language Programming:** Proficiency in x86-64 assembly, including register manipulation, memory access, and flow control.
*   **System Call Interface:** Direct interaction with the operating system kernel.
*   **Calling Conventions:** Mastery of how arguments are passed and return values are handled at the assembly level.
*   **Performance Optimization:** Understanding the foundations for highly optimized code.
*   **Memory Management:** Detailed insights into how memory is managed at the lowest levels.
*   **Reverse Engineering (Implicit):** The process of reimplementing standard functions often involves analyzing their original behavior at a deeper level.

---
