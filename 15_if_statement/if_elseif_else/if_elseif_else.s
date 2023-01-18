.section .rodata
	msg_main_print1:
	.string "Enter number :"

	msg_main_scan:
	.string "%d"

	msg_main_print_less:
	.string "\nNumber is less than 2\n"

	msg_main_print_greater:
	.string "\nNumber is greater than 2\n"

	msg_main_print_equal:
	.string "\nNumber is equal to 2\n"



.section .text
.type main, @function
.globl main

main:
	pushl %ebp
	movl %esp,%ebp

	subl $4,%esp

	pushl $msg_main_print1
	call printf
	addl $4,%esp

	leal -4(%ebp),%eax

	pushl %eax
	pushl $msg_main_scan
	call scanf
	addl $8,%esp

	movl -4(%ebp),%eax

	cmpl $2,%eax
	jnl lable_greater

	pushl $msg_main_print_less
	call printf
	addl $4,%esp
	jmp lable_exit

lable_greater:
	je lable_equal
	pushl $msg_main_print_greater
	call printf
	addl $4,%esp
	jmp lable_exit	

lable_equal:
	pushl $msg_main_print_equal
	call printf
	addl $4,%esp

lable_exit:
	pushl $0
	call exit



