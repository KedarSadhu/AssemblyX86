.section .rodata
	msg_main_print1:
	.string "\n\nEnter The String:\t"

	msg_main_print2:
	.string "\n\nEnter The Character To Set:\t"

	msg_main_print3:
	.string "\n\nNow String Is:\t"

	msg_main_scan:
	.string "%c"

.section .text
.type main,@function
.globl main

main:
	andl	$-16,%esp
	pushl	%ebp
	movl 	%esp,%ebp

	subl	$32,%esp

	movl 	$msg_main_print1,(%esp)
	call 	printf

	leal 	-20(%ebp),%ebx

	movl 	%ebx,(%esp)
	call 	gets

	movl 	$msg_main_print2,(%esp)
	call 	printf

	leal	-21(%ebp),%ebx

	movl 	$msg_main_scan,(%esp)
	movl	%ebx,4(%esp)
	call 	scanf

	movb	-21(%ebp),%al
	leal 	-20(%ebp),%ebx

	movl	%ebx,(%esp)
	movb 	%al,4(%esp)
	call 	mystrset

	movl 	$msg_main_print3,(%esp)
	call 	printf

	leal	-20(%ebp),%ebx

	movl	%ebx,(%esp)
	call 	puts

	movl 	$0,(%esp)
	call 	exit

.type 	mystrset,@function
.globl	mystrset

mystrset:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$16,%esp

	movl	8(%ebp),%ebx
	movl	%ebx,-4(%ebp)	#pBase

	movb	12(%ebp),%cl
	jmp		loop_while_cond

loop_while_st:
	movb	%cl,(%edx)
	incl 	8(%ebp)	

loop_while_cond:
	movl	8(%ebp),%edx
	movb	(%edx),%al

	cmpb	$0,%al
	jne		loop_while_st


	movl	-4(%ebp),%eax	#pTemp
	
	movl	%ebp,%esp
	popl	%ebp
	ret
