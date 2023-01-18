.section .rodata
	msg_main_print:
	.string "In main ,no :: %d\n"

.section .bss
	.lcomm g_iNo,4

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

	call fun

	pushl $0
	call exit
