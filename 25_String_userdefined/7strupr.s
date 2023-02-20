.section .rodata
	msg_main_print1:
	.string "\n\nEnter The String:\t"

	msg_main_print2:
	.string "\nString In Upper Case Is:\t"

.section .text
.type main,@function
.globl main

main:
	andl	$-16,%esp
	pushl 	%ebp
	movl 	%esp,%ebp

	subl 	$32,%esp

	movl	$msg_main_print1,(%esp)
	call 	printf

	leal	-20(%ebp),%ebx

	movl 	%ebx,(%esp)
	call 	gets

	leal	-20(%ebp),%ebx
	movl 	%ebx,(%esp)
	call	mystrupr

	movl 	$msg_main_print2,(%esp)
	call 	printf

	leal	-20(%ebp),%ebx

	movl 	%ebx,(%esp)
	call 	puts

	movl 	$0,(%esp)
	call 	exit

	
.type 	mystrupr,@function
.globl	mystrupr

mystrupr:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$16,%esp

	movl	8(%ebp),%ebx
	movl	%ebx,-4(%ebp)	#pTemp

	jmp		loop_while_cond

loop_while_st:
	cmpb	$'a',%al
	jl		loop_while_st_continue
	cmpb	$'z',%al
	jg		loop_while_st_continue

	subb	$32,%al

	movb	%al,(%edx)


loop_while_st_continue:	
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
