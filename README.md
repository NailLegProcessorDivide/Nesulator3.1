# Nesulator

## About

A Nintendo entertainment system emulator written in c.

## Usage

To run the program put the following in the command line:

```
Nesulator <NES ROM Filepath>
```

## Build Instructions

Once downloaded build the program using the following lines

```
cmake .
make
```

## Motivation

I saw a friends Retro Pi based home made hand held console,
and I was inspired try to make my own retro console emulator.

## Challenges

and wanting to find a more effective way to implement them.

the solution i found was to use macros to create all of my functions and pass the
opcodes as parameters used to get the address of the byte the cpu is going to be operating on.

This cut the number of functions i needed to create by hand down 
to only 1 per unique operation and 1 per addressing mode.

### Memory Map

Another challend I found was the memory system as I had to have a
way of managing the memoring mapped io and different devices scattered 
throughout the address space.

I solved with the concept of a device interface that occupies an address range 
The ppu was also challenging  due to the high comlexity and specific timings,
and shared registers for multiple functions, along with having the majority
of documentation i have found being aimed at programming for the hardware
not recreating the hardware in software.
