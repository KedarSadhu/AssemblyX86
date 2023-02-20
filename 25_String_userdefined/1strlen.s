.section .rodata
	literal1_main:
	.string "Hello"

	literal2_main:
	.string "Morning"

	msg_main_print1:
	.string "\nThe Length Of Hello Is %d\n"

	msg_main_print2:
	.string "The Length Of Good Is %d\n"

	msg_main_print3:
	.string "The Length Of Morning Is %d\n"

.section .text
.type main,@function
.globl main

main:
	andl 	$-16,%esp
	pushl 	%ebp
	movl 	%esp,%ebp

	subl 	$32,%esp

	movl	$literal1_main,-4(%ebp)	#char *ptr="Hello";

	# char str[]="Good";
	movb	$'G',-9(%ebp)
	movb	$'O',-8(%ebp)
	movb	$'O',-7(%ebp)
	movb	$'D',-6(%ebp)
	movb 	$0,-5(%ebp)

	movl 	-4(%ebp),%ebx

	movl 	%ebx,(%esp)
	call 	strlen

	movl	$msg_main_print1,(%esp)
	movl 	%eax,4(%esp)
	call 	printf

	leal 	-9(%ebp),%ebx

	movl 	%ebx,(%esp)
	call 	strlen

	movl	$msg_main_print2,(%esp)
	movl 	%eax,4(%esp)
	call 	printf

	movl 	$literal2_main,%ebx

	movl 	%ebx,(%esp)
	call 	mystrlen

	movl	$msg_main_print3,(%esp)
	movl 	%eax,4(%esp)
	call 	printf

	movl 	$0,(%esp)
	call 	exit

.type mystrlen,@function
.globl mystrlen

mystrlen:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$4,%esp

	movl	$0,-4(%ebp)

	jmp		lable_while_cond

lable_while_st:
	addl	$1,-4(%ebp)
	addl	$1,8(%ebp)

lable_while_cond:
	movl	8(%ebp),%eax
	movb	(%eax),%al 

	cmpb	$0,%al
	jne		lable_while_st

	movl	-4(%ebp),%eax

	movl	%ebp,%esp
	popl	%ebp

	ret
