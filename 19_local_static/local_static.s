.section .rodata
	msg_main_print1:
	.string "\nCalling fun1\n"

	msg_main_print2:
	.string "\ncalling fun2\n"

	msg_fun1_print1:
	.string "In fun1 iNo = %d\n"

	msg_fun2_print2:
	.string	"In fun2 iNo = %d\n"

.section .data
	.type	iNo,@object
	.size	iNo,4
	.align	4

	iNo:
	.int	10

.section .text
.type main,@function
.globl main

main:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$4,%esp

	pushl	$msg_main_print1
	call 	printf
	addl	$4,%esp

	movl	$0,-4(%ebp)
	jmp		lable_for1_condition

lable_for1:
	call 	fun1
	addl	$1,-4(%ebp)

lable_for1_condition:
	movl	-4(%ebp),%eax
	cmpl	$3,%eax
	jl		lable_for1

lable_main_continue:
	pushl	$msg_main_print2
	call 	printf
	addl	$4,%esp

	movl	$0,-4(%ebp)
	jmp		lable_for2_condition

lable_for2:
	call 	fun2
	addl	$1,-4(%ebp)

lable_for2_condition:
	movl	-4(%ebp),%eax
	cmpl	$3,%eax
	jl		lable_for2

lable_exit:
	pushl 	$0
	call 	exit

.type fun1,@function
.globl fun1

fun1:
	pushl	%ebp
	movl 	%esp,%ebp

	subl 	$4,%esp

	movl	$10,-4(%ebp)

	movl	-4(%ebp),%eax

	addl	$1,%eax

	pushl	%eax
	pushl	$msg_fun1_print1
	call 	printf
	addl	$8,%esp

	movl	%ebp,%esp
	popl	%ebp
	ret


.type fun2,@function
.globl fun2

fun2:
	pushl	%ebp
	movl 	%esp,%ebp

	addl	$1,iNo

	pushl	iNo
	pushl	$msg_fun2_print2
	call 	printf
	addl	$8,%esp

	movl 	%ebp,%esp
	popl 	%ebp
	ret
