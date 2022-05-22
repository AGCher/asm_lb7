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
	two 0,1,2
	two 1,2,3
	two 2,3,4
	two 3,4,5
	two 4,5,6
	two 5,6,7
	mov r10,[R+8*6]
	mulx r8, r10, [A+8*7]
	mov [R+8*6], r10
	mov r10, [R+8*6]
	mov r11, [R+8*7]
	adox r10, r11
	mov [R+8*6], r10
	mov [R+8*7], r11
	mov [R+8*8], r10
	adcx r10, rax
	mov [R+8*8], r10
	mov [R+8*7], r8
	mov r10, [R+8*7]
	adox r10, rax
	mov [R+8*7], r10
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
A dq 0x80fecbf27b13bfe7, 0x8999e384e1afb4a6, 0x9944b7dbd5f20fbe, 0x144d8d5580cd57ea, 0x57e065c13cdc8707, 0x060d982b8c0fbe34, 0xb6af816d53cafd76, 0x7dd2e28a9409473e
B dq 0x1b6a7a40e259c5a3, 0xfc1c72b800f2b629, 0x7f3ada24e98416ad, 0x9e23e5e2dbcb572a, 0x36050ed250390503, 0x4a047c7b88a5f472, 0x311cc83534343fa5, 0xa5c4a95abdaebdba
C dq 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
RD dq 0x0
R dq 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
