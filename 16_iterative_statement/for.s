.section .rodata
	msg_main_print1:
	.string "Enter number : "

	msg_main_scan:
	.string "%d"

	msg_main_print2 :
	.string "%d\n"

.section .text
.type main,@function
.globl main

main:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$8,%esp

	pushl	$msg_main_print1
	call 	printf
	addl	$4,%esp

	leal	-4(%ebp),%ebx
	
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8,%esp

	movl	$0,-8(%ebp)

	jmp		lable_for_condition

lable_for_st :
	pushl	%eax
	pushl	$msg_main_print2
	call 	printf
	addl	$8,%esp
	
	addl 	$1,-8(%ebp)

lable_for_condition:
	movl 	-8(%ebp),%eax
	movl	-4(%ebp),%edx
	cmpl	%edx,%eax
	jl		lable_for_st

	pushl	$0
	call	exit
