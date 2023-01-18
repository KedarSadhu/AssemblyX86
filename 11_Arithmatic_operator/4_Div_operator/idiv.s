.section .rodata
	msg_main_print1:
	.string "Enter numrator :"
	
	msg_main_scan:
	.string "%d"

	msg_main_print2:
	.string "Enter denominator :"
	
	msg_main_print3:
	.string "iQuotient =%d\niRemender = %d\n"

.section .text
.globl main
.type main,@function

main:
	pushl %ebp
	movl %esp,%ebp

	subl $16,%esp

	pushl $msg_main_print1
	call printf
	addl $4,%esp

	leal -4(%ebp),%ebx

	pushl %ebx
	pushl $msg_main_scan
	call scanf
	addl $8,%esp

	pushl $msg_main_print2
	call printf
	addl $4,%esp


	leal -8(%ebp),%ebx

	pushl %ebx
	pushl $msg_main_scan
	call scanf
	addl $8,%esp


	movl -4(%ebp),%eax
	movl -8(%ebp),%ecx

	xorl %edx,%edx
	idivl %ecx

	movl %eax ,-12(%ebp) #quotient
	movl %edx,-16(%ebp) #remender

	pushl %edx
	pushl %eax
	pushl $msg_main_print3
	call printf
	addl $12,%esp

	pushl $0
	call exit
