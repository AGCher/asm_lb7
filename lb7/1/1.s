%include "syscall.mac"
SECTION .text
	global _start
	EXTERN printhex
_start:
    	mov rdx, [B+8*0]
	clc
	mov r11, [R+8*0]
	mulx r11, rax, [A+8*0]
	mov [R+8*0], r11
	mov [C+8*0], rax

	stepone 1, 0
	stepone 2, 1
	stepone 3, 2
	stepone 4, 3
	stepone 5, 4
	stepone 6, 5
	stepone 7, 6
	mov r11, 0
	adc [R+8*7], r11

	%assign i 1
	%rep 7
	starttwo i
	two_1 0, 1
	two_2 1, 2
	two_1 2, 3
	two_2 3, 4
	two_1 4, 5
	two_2 5, 6
	two_1 6, 7
	mov [R+8*7], r9
	%assign i i+1
	%endrep
	
	%assign i 0
	%rep 8
	mov r9, [R+i*8]
	mov [(C+64)+i*8], r9
	%assign i i+1
	%endrep

      print A, 64
	print B, 64
	print C, 128
		EXIT
;==================================================
	SECTION .data
A dq 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff
B dq 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffffffffff
C dq 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
RD dq 0x0
R dq 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
