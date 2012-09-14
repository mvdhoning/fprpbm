/******************************************************************************
*	main.s
*	 by Alex Chadwick
*
*	A sample assembly code implementation of the screen04 operating system, that 
*	renders formatted text to the screen.
*
*	main.s contains the main operating system, and IVT code.
******************************************************************************/

/*
* .globl is a directive to our assembler, that tells it to export this symbol
* to the elf file. Convention dictates that the symbol _start is used for the 
* entry point, so this all has the net effect of setting the entry point here.
* Ultimately, this is useless as the elf itself is not used in the final 
* result, and so the entry point really doesn't matter, but it aids clarity,
* allows simulators to run the elf, and also stops us getting a linker warning
* about having no entry point. 
*/
.section .init
.globl _start
_start:

/*
* According to the design of the RaspberryPi, addresses 0x00 through 0x20 
* actually have a special meaning. This is the location of the interrupt 
* vector table. Thus, we shouldn't make the code for our operating systems in 
* this area, as we will need it in the future. In fact the first address we are
* really safe to use is 0x8000.
*/
b main

/*
* This command tells the assembler to put this code at 0x8000.
*/
.section .text



/*
* main is what we shall call our main operating system method. It never 
* returns, and takes no parameters.
* C++ Signature: void main()
*/
main:

/* 
* Start the pascal kernel.
*/
.extern kmain
	bl kmain

loop$:
	b loop$

.global rpiwait
rpiwait:
mov r2,#0x3F0000
wait1$:
	sub r2,#1
	cmp r2,#0
	bne wait1$
mov pc,lr
