.section .rodata
	msg_main_print:
	.string "g_iNo : %d\n"

.section .data
	.globl g_iNo
	.type g_iNo,@object
	.size g_iNo, 4
	.align 4
	g_iNo:
	.int 10

.section .text
.globl main
.type main,@function

main:
	pushl %ebp
	movl %esp,%ebp

	movl g_iNo,%eax
	pushl %eax
	pushl $msg_main_print
	call printf
	addl $8,%esp

	pushl $0
	call exit
	