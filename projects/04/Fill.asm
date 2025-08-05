// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.


(START)
   @KBD
   D=M
   @DRAW_BLACK
   D;JNE
   @DRAW_WHITE
   0;JMP

 (DRAW_BLACK)  
   @8192
   D=A
   @n
   M=D
   // addr = base address of first screen row
   @SCREEN
   D=A
   @addr
   M=D
(LOOP_BLACK)
   // RAM[addr] = -1
   @addr
   A=M
   M=-1
   // addr = base address of next screen row
   @addr
   M=M+1
   // decrements n and loops
   @n
   MD=M-1
   @LOOP_BLACK
   D;JGT
   @START
   0;JMP

   (DRAW_WHITE)  
   @8192
   D=A
   @n
   M=D
   // addr = base address of first screen row
   @SCREEN
   D=A
   @addr
   M=D
(LOOP_WHITE)
   // RAM[addr] = 0
   @addr
   A=M
   M=0
   // addr = base address of next screen row
   @addr
   M=M+1
   // decrements n and loops
   @n
   MD=M-1
   @LOOP_WHITE
   D;JGT
   @START
   0;JMP

   