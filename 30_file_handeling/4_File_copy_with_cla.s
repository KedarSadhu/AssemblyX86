.section .rodata
	read_mode:
	.string "r"

	write_mode:
	.string "w"

	msg_print_err1:
	.string "\nCant Open Source File \n"

	msg_print_err2:
	.string "\nCant Open Target File \n"

	msg_main_print:
	.string "\nCopied Successfully\n"


.section .text
.type main, @function
.globl main

main:
	andl	$-16,%esp
	pushl	%ebp
	movl	%esp,%ebp

	subl	$32,%esp

	movl	$0,-4(%ebp)		#FILE *fpSource = NULL
	movl	$0,-8(%ebp)		#FILE *fpDestination = NULL;

	movl	12(%ebp),%ebx		#argv[1]

	movl	%ebx,(%esp)
	movl	$read_mode,4(%esp)
	call	fopen

	movl	%eax,-4(%ebp)

	cmpl	$0,%eax
	je 		label_error1

	movl	16(%ebp),%ebx		#argv[2]

	movl	%ebx,(%esp)
	movl	$write_mode,4(%esp)
	call	fopen

	movl	%eax,-8(%ebp)

	cmpl	$0,%eax
	je 		label_error2

label_loop_while1:
	movl	-4(%ebp),%eax

	movl	%eax,(%esp)
	call	fgetc

	cmpl	$-1,%eax
	je		label_main_continue

	movl	-8(%ebp),%edx

	movl	%eax,(%esp)
	movl	%edx,4(%esp)
	call	fputc

	jmp		label_loop_while1

label_main_continue:
	movl	-4(%ebp),%eax
	movl	%eax,(%esp)
	call	fclose

	movl	$0,-4(%ebp)

	movl	-8(%ebp),%eax
	movl	%eax,(%esp)
	call	fclose

	movl	$0,-8(%ebp)

	movl	$msg_main_print,(%esp)
	call	printf

	movl	$0,(%esp)
	call	exit

label_error1:
	movl	$msg_print_err1,(%esp)
	call	printf

	movl	$-1,(%esp)
	call	exit

label_error2:
	movl	$msg_print_err2,(%esp)
	call	printf

	movl	-4(%ebp),%eax
	movl	%eax,(%esp)
	call	fclose

	movl	$0,-4(%ebp)

	movl	$-1,(%esp)
	call	exit

