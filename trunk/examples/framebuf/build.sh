#!/bin/bash
# Build Pascal Barebone OS
# More Info: http://wiki.osdev.org/Pascal 

cd src

#clean
rm kernel
rm *.o
rm *.ppu
rm *.elf
rm *.img

#build
arm-none-eabi-as -I ./ stub.s -o stub.o

fpc -Parm -Tlinux kernel.pas

arm-none-eabi-ld --no-undefined stub.o system.o gpio.o uart.o mailbox.o fb.o font.o kernel.o -Map kernel.map -o output.elf -T memmap

arm-none-eabi-objcopy output.elf -O binary kernel.img 
arm-none-eabi-objdump -d output.elf > kernel.list

cp *.img ../

cd ..
