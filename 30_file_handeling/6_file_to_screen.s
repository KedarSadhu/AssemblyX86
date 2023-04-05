.section .rodata
	filename:
	.string "keyboard_to_file.txt"

	mode:
	.string "r"

	msg_print_err:
	.string "\nCant Open File \n"

	msg_main_print:
	.string "%s"

.section .text
.type main, @function
.globl main

main:
	andl	$-16,%esp
	pushl	%ebp
	movl	%esp,%ebp

	subl	$80,%esp

	movl	$0,-4(%ebp)	#FILE *fp = NULL;

	movl	$filename,(%esp)
	movl	$mode,4(%esp)
	call	fopen

	movl	%eax,-4(%ebp)

	cmpl	$0,%eax
	je		label_error

	jmp		label_cond

label_body:
	leal 	-54(%ebp),%ebx

	movl	$msg_main_print,(%esp)
	movl	%ebx,4(%esp)
	call	printf

label_cond:
	movl	-4(%ebp),%eax
	leal 	-54(%ebp),%ebx
	
	movl	%ebx,(%esp)
	movl	$49,4(%esp)
	movl	%eax,8(%esp)
	call	fgets

	cmpl	$0,%eax
	jne		label_body

	movl	-4(%ebp),%eax
	movl	%eax,(%esp)
	call	fclose

	movl	$0,-4(%ebp)

	movl	$0,(%esp)
	call	exit


label_error:
	movl	$msg_print_err,(%esp)
	call	printf

	movl	$-1,(%esp)
	call	exit
