.section .rodata
	msg_main_print1:
	.string "\n\nEnter The String:\t"

	msg_main_print2:
	.string "\n\nReverse String Is:\t"

	msg_main_print3:
	.string "here\n"

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
	call	mystrrev

	movl 	$msg_main_print2,(%esp)
	call 	printf

	leal	-20(%ebp),%ebx

	movl 	%ebx,(%esp)
	call 	puts

	movl 	$0,(%esp)
	call 	exit

.type 	mystrrev,@function
.globl	mystrrev

mystrrev:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$16,%esp

	movl	8(%ebp),%ebx
	movl	%ebx,-4(%ebp)	#pBase
	movl	%ebx,-8(%ebp)	#pTemp

	jmp		loop_while1_cond

loop_while1_st:
	incl 	-8(%ebp)	#pTemp++
	
loop_while1_cond:
	movl	-8(%ebp),%eax
	movb	(%eax),%al

	cmpb	$0,%al
	jne		loop_while1_st

#function body continues
	decl 	-8(%ebp)
	
	jmp		loop_while2_cond

loop_while2_st:
	movb	(%eax),%cl 	#*pBase
	movb	(%edx),%ch	#*pTemp
	movb	%ch,(%eax)  
	movb 	%cl,(%edx)

	incl 	-4(%ebp)
	decl	-8(%ebp)	

loop_while2_cond:
	movl	-8(%ebp),%edx	#pTemp
	movl	-4(%ebp),%eax	#pBase

	cmpl	%edx,%eax
	jle		loop_while2_st

	movl	8(%ebp),%eax	#pStr
	
	movl	%ebp,%esp
	popl	%ebp
	ret
