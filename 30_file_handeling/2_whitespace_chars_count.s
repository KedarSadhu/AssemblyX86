.section .rodata
	filename:
	.string "chars_space_tabs_nl_count.txt"

	mode:
	.string "r"

	msg_print_err:
	.string "\nCant Open File \n"

	msg_main_print1:
	.string "\n No of charecters are :\t%d\n"

	msg_main_print2:
	.string "\n No of spaces are :\t%d\n"

	msg_main_print3:
	.string "\n No of tabs are :\t%d\n"

	msg_main_print4:
	.string "\n No of lines are :\t%d\n"

.section .text
.type main, @function
.globl main

main:
	andl	$-16,%esp
	pushl	%ebp
	movl	%esp,%ebp

	subl	$32,%esp

	movl	$0,-4(%ebp)		#FILE *fp = NULL;
	movl	$0,-8(%ebp)		#iNoofchars
	movl	$0,-12(%ebp)	#iNoOfSpaces
	movl	$0,-16(%ebp)	#iNoOfTabs
	movl	$0,-20(%ebp)	#iNoOfLines


	movl	$filename,(%esp)
	movl	$mode,4(%esp)
	call	fopen

	movl	%eax,-4(%ebp)

	cmpl	$0,%eax
	je 		label_error

label_loop_while1:
	movl	-4(%ebp),%eax

	movl	%eax,(%esp)
	call	fgetc

	cmpl	$-1,%eax
	je		label_main_continue

	addl	$1,-8(%ebp)

	cmpb	$' ',%al
	jne		label_else_if
	addl	$1,-12(%ebp)
	jmp		label_loop_while1

label_else_if:
	cmpb	$'\t',%al
	jne		label_if 
	addl	$1,-16(%ebp)
	jmp		label_loop_while1

label_if:
	cmpb	$'\n',%al
	jne		label_loop_while1 
	addl	$1,-20(%ebp)	

	jmp 	label_loop_while1

label_main_continue:
	movl	-4(%ebp),%eax
	movl	%eax,(%esp)
	call	fclose

	movl	$0,-4(%ebp)

	movl	-8(%ebp),%eax
	movl	$msg_main_print1,(%esp)
	movl	%eax,4(%esp)
	call	printf

	movl	-12(%ebp),%eax
	movl	$msg_main_print2,(%esp)
	movl	%eax,4(%esp)
	call	printf

	movl	-16(%ebp),%eax
	movl	$msg_main_print3,(%esp)
	movl	%eax,4(%esp)
	call	printf

	movl	-20(%ebp),%eax
	movl	$msg_main_print4,(%esp)
	movl	%eax,4(%esp)
	call	printf

	movl	$0,(%esp)
	call	exit


label_error:
	movl	$msg_print_err,(%esp)
	call	printf

	movl	$-1,(%esp)
	call	exit


