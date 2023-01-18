.section .rodata
	main_msg_print1:
	.string "Enter number :"

	main_msg_scan:
	.string "%d"

	main_msg_print2:
	.string "\Number is : %d\n"

.section .text
.globl main
.type main,@function

main:
	pushl %ebp
	movl %esp,%ebp

	subl $4,%esp

	pushl $main_msg_print1
	call printf
	addl $4,%esp

	leal -4(%ebp),%ebx
	
	pushl %ebx
	pushl $main_msg_scan
	call scanf
	addl $8,%esp

	movl -4(%ebp),%eax

	pushl %eax
	pushl $main_msg_print2
	call printf
	addl $8,%esp

	pushl $0
	call exit
