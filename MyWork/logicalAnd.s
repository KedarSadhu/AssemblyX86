.section .rodata
	main_msg_print1:
	.string "Enter number :"

	main_msg_scan:
	.string "%d"

	main_msg_print2:
	.string "\nNumber is : %d\n"

	msg_main_print3:
	.string	"\n%d is between 0 to 5\n"

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

	movl -4(%ebp),%eax
	cmpl $0,%eax
	jng	lable_exit
	cmpl $5,%eax
	jnl	 lable_exit

	pushl %eax
	pushl $msg_main_print3
	call printf
	addl $8,%esp

lable_exit:
	pushl $0
	call exit
	