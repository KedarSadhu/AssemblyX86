.section .rodata
	msg_fun_print:
	.string "In fun, g_iNo :: %d\n"

.section .bss
	.comm g_iNo,4,4

.section .text
.globl fun
.type fun,@function

fun:
	pushl %ebp
	movl %esp,%ebp

	movl g_iNo,%eax
	pushl %eax
	pushl $msg_fun_print
	call printf
	addl $8,%esp

	movl %ebp,%esp
	popl %ebp
	ret
