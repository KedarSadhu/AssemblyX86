.section .rodata
	msg_main_print1:
	.string "\n\nEnter Destination String:\t"

	msg_main_print2:
	.string "\n\nEnter Source String:\t"

	msg_main_print3:
	.string "\n\nConcatenated String Is:\t"
	
.section .text
.type main,@function
.globl main

main:
	andl	$-16,%esp
	pushl 	%ebp
	movl 	%esp,%ebp

	subl 	$80,%esp

	movl	$msg_main_print1,(%esp)
	call 	printf

	leal 	-60(%ebp),%ebx	#destination[40];

	movl	%ebx,(%esp)
	call 	gets		#gets(destination);

	movl	$msg_main_print2,(%esp)
	call 	printf

	leal 	-20(%ebp),%ebx	#source[20]

	movl	%ebx,(%esp)
	call 	gets

	leal 	-60(%ebp),%eax
	leal 	-20(%ebp),%edx

	movl 	%eax,(%esp)
	movl 	%edx,4(%esp)
	call	mystrcat

	movl	$msg_main_print3,(%esp)
	call 	printf

	leal 	-60(%ebp),%eax	 #puts(destination);

	movl 	%eax,(%esp)
	call 	puts

	movl 	$0,(%esp)
	call 	exit

.type mystrcat,@function
.globl mystrcat

mystrcat:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$16,%esp

	movl	8(%ebp),%ebx	#pDest

	movl	%ebx,(%esp)
	call 	mystrlen

	movl	8(%ebp),%ebx	#pDest
	addl	%eax,%ebx

	movl	%ebx,%edi

	movl	12(%ebp),%ebx	#pSrc
	movl	%ebx,%esi

	movl	%ebx,(%esp)
	call 	mystrlen

	movl	%eax,%ecx

	cld

	rep 	movsb

	movb	$0,(%edi)

	movl	8(%ebp),%eax

	movl	%ebp,%esp
	popl	%ebp

	ret
