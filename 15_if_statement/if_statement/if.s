.section .rodata
	msg_main_print1:
	.string "Enter two number :"

	msg_main_scan:
	.string "%d"

	msg_main_print2:
	.string "\nNumber is Even\n"

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

	xorl %edx,%edx
	movl $2,%ecx

	divl %ecx

	cmpl $0,%edx
	jne lable_exit

	pushl $msg_main_print2
	call printf
	addl $4,%esp

lable_exit:
	pushl $0
	call exit



