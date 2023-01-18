.section .rodata
	msg_main_print:
	.string "Enter two numbers :"

	msg_main_scan:
	.string	"%d%d"

	msg_main_print_and:
	.string "iNo1 & iNo2 = %d\n"

	msg_main_print_or:
	.string "iNo1 | iNo2 = %d\n"

	msg_main_print_xor:
	.string "iNo1 ^ iNo2 = %d\n"

	msg_main_print_not:
	.string "~iNo2 = %d\n"

	msg_main_print_leftshift:
	.string "iNo1 << 2 = %d\n"

	msg_main_print_rightshift:
	.string "iNo2 >> 2 = %d\n"

.section .text
.type 	main,@function
.globl	main

main:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$8,%esp

	pushl	$msg_main_print
	call 	printf 
	addl	$4,%esp

	leal	-4(%ebp),%eax
	leal	-8(%ebp),%edx

	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan
	call	scanf
	addl	$12,%esp

	#iNo1&iNo2
	movl	-4(%ebp),%eax
	movl	-8(%ebp),%edx

	andl	%edx,%eax

	pushl	%eax
	pushl	$msg_main_print_and
	call	printf
	addl	$8,%esp

	#iNo1|iNo2
	movl	-4(%ebp),%eax
	movl	-8(%ebp),%edx

	orl	%edx,%eax

	pushl	%eax
	pushl	$msg_main_print_or
	call	printf
	addl	$8,%esp

	#iNo1^iNo2
	movl	-4(%ebp),%eax
	movl	-8(%ebp),%edx

	xorl	%edx,%eax

	pushl	%eax
	pushl	$msg_main_print_xor
	call	printf
	addl	$8,%esp

	#~iNo2
	movl	-8(%ebp),%eax
	notl	%eax

	pushl	%eax
	pushl	$msg_main_print_not
	call	printf
	addl	$8,%esp

	#iNo1<<2	--> sal -->shift at left 

	movl	-4(%ebp),%eax
	sall	$2,%eax

	pushl	%eax
	pushl	$msg_main_print_leftshift
	call	printf
	addl	$8,%esp

	#iNo2>>2   --> sar --> shift at right

	movl	-8(%ebp),%eax
	sarl	$2,%eax

	pushl	%eax
	pushl	$msg_main_print_rightshift
	call	printf
	addl	$8,%esp

	pushl 	$0
	call	exit

