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

	movl 	$1,-8(%ebp)

	jmp		for_condition

for_statement:
	xorl	%edx,%edx
	movl	$2,%ecx
	divl	%ecx		#icounter%2 --> icounter=%eax 2=%ecx remender=%edx

	cmpl	$0,%edx
	je		lable_manip

	movl	-8(%ebp),%eax
	
	pushl	%eax
	pushl	$msg_main_print2	
	call	printf
	addl	$8,%esp 

lable_manip:
	addl	$1,-8(%ebp)

for_condition:
	movl	-8(%ebp),%eax	#counter
	movl	-4(%ebp),%edx	#iNo

	cmpl	%edx,%eax

	jl		for_statement	

lable_exit:
	pushl	$0
	call	exit
