.section .rodata
	msg_main_print1:
	.string "\n\nEnter Source String:\t"

	msg_main_print2:
	.string "\n\nSource String Is:\t"

	msg_main_print3:
	.string "\n\nDestination String Is:\t"

.section .text
.type main,@function
.globl main

main:
	andl	$-16,%esp
	pushl 	%ebp
	movl 	%esp,%ebp

	subl 	$48,%esp

	movl	$msg_main_print1,(%esp)
	call 	printf

	leal 	-20(%ebp),%ebx	#source[20]

	movl	%ebx,(%esp)
	call 	gets

	movl	$msg_main_print2,(%esp)
	call 	printf

	leal 	-20(%ebp),%eax	#puts(source);

	movl	%eax,(%esp)	
	call 	puts	

	leal 	-40(%ebp),%eax
	leal 	-20(%ebp),%edx

	movl 	%eax,(%esp)
	movl 	%edx,4(%esp)
	call	mystrcpy

	movl	$msg_main_print3,(%esp)
	call 	printf

	leal 	-40(%ebp),%eax	 #puts(destination);

	movl 	%eax,(%esp)
	call 	puts

	movl 	$0,(%esp)
	call 	exit

.type mystrcpy,@function
.globl mystrcpy

mystrcpy:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$16,%esp

	movl	12(%ebp),%ebx	#pSrc

	movl	%ebx,(%esp)
	call	mystrlen

	movl	%eax,%ecx

	movl	8(%ebp),%edi
	movl	12(%ebp),%esi

	rep 	movsb

	movl	$0,(%edi)

	movl	%edi,%eax

	movl	%ebp,%esp
	popl	%ebp

	ret
	


