.section .rodata
	msg_main_print1:
	.string "Enter two number :: "

	msg_main_scan:
	.string "%d%d"

	msg_main_print2:
	.string "In main iNo1 = %d\tiNo2 = %d\tiNo3 = %d\n"

.section .bss
	.comm iNo2,4,4

.section .data
	.globl iNo1
	.type iNo1,@object
	.size iNo1,4
	.align 4

	iNo1:
	.int 10

.section .text
.globl main
.type main,@function

main:
	pushl %ebp
	movl %esp,%ebp

	subl $4,%esp

	pushl $msg_main_print1
	call printf
	addl $4,%esp

	movl $iNo2,%eax
	leal -4(%ebp),%edx

	pushl %edx
	pushl %eax
	pushl $msg_main_scan
	call scanf
	addl $12,%esp

	
	movl -4(%ebp),%eax
	movl iNo2,%edx
	movl iNo1,%ecx

	pushl %eax
	pushl %edx
	pushl %ecx
	pushl $msg_main_print2
	call printf
	addl $16,%esp

	call fun1
	
	pushl $0
	call exit

