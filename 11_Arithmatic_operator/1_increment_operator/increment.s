.section .rodata
	msg_main_print:
		.string "iNo1=%d\niNo2=%d\niAns1=%d\niAns2=%d\n"

.section .text
.type main,@function
.globl main

main:
	pushl %ebp
	movl %esp,%ebp

	subl $16,%esp

	movl $10,-4(%ebp)
	movl $20,-8(%ebp)

	movl -4(%ebp),%eax
	movl -8(%ebp),%edx

	addl $1,%eax	#iNo1
	movl %eax,-12 (%ebp) #iAns1

	movl %edx,-16(%ebp) #iAns2
	addl $1,%edx	#iNo2

	movl -12(%ebp),%ecx
	movl -16(%ebp),%ebx
	
	pushl %ebx
	pushl %ecx
	pushl %edx
	pushl %eax
	pushl $msg_main_print
	call printf
	addl $20,%esp

	pushl $0
	call exit
	