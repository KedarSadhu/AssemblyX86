.section .rodata
	msg_main_print1:
	.string "\n\nEnter Destination String:\t"

	msg_main_print2:
	.string "\n\nEnter Source String:\t"

	msg_main_print3:
	.string "\n\nEnter Value Of n:\t"

	msg_main_scan:
	.string "%d"

	msg_main_print4:
	.string "\n\nConcatenated String Is:\t"

.section .text
.type main,@function
.globl 	main

main:
	andl 	$-16,%esp
	pushl 	%ebp
	movl 	%esp,%ebp

	subl	$80,%esp

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

	movl	$msg_main_print3,(%esp)
	call 	printf

	leal 	-64(%ebp),%ebx

	movl 	$msg_main_scan,(%esp)
	movl 	%ebx,4(%esp)
	call 	scanf

	leal 	-60(%ebp),%eax
	leal 	-20(%ebp),%ebx
	movl 	-64(%ebp),%edx

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	movl 	%edx,8(%esp)
	call 	mystrncat

	movl	$msg_main_print4,(%esp)
	call 	printf

	leal 	-60(%ebp),%eax	 #puts(destination);

	movl 	%eax,(%esp)
	call 	puts

	movl 	$0,(%esp)
	call 	exit

.type mystrncat,@function
.globl mystrncat

mystrncat:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$16,%esp

	movl	$0,-4(%ebp)	#iCounter
	movl	16(%ebp),%edx	#n

	movl	8(%ebp),%esi	#pDest

	movl	$255,%ecx

	cld

lable_loop1:
	lodsb
	cmpb	$0,%al
	je		loop1_break
	loop 	lable_loop1

loop1_break:
	decl	%esi
	movl	%esi,%edi		#pDest
	movl	12(%ebp),%esi	#pSrc	

lable_loop2:
	lodsb	
	cmpb	$0,%al
	je		lable_ncat_finish
	
	movl	-4(%ebp),%ebx
	cmpl	%edx,%ebx	#iCounter<n
	jnl		lable_ncat_finish	

	addl	$1,-4(%ebp)	#iCounter
	stosb	
	loop 	lable_loop2

lable_ncat_finish:
	movb	$0,(%edi)

	movl	8(%ebp),%eax

	movl	%ebp,%esp
	popl	%ebp

	ret
