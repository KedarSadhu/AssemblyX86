.section .rodata
	filename:
	.string "keyboard_to_file.txt"

	mode:
	.string "w"

	newline:
	.string "\n"

	msg_print_err:
	.string "\nCant Open File \n"

	msg_main_print:
	.string "\nEnter strings:\n"

.section .text
.type main, @function
.globl main

main:
	andl	$-16,%esp
	pushl	%ebp
	movl	%esp,%ebp

	subl	$64,%esp

	movl	$0,-4(%ebp)	#FILE *fp = NULL;

	movl	$filename,(%esp)
	movl	$mode,4(%esp)
	call	fopen

	movl	%eax,-4(%ebp)

	cmpl	$0,%eax
	je		label_error

	movl	$msg_main_print,(%esp)
	call	printf

	jmp		label_cond

label_body:
	movl	-4(%ebp),%eax
	leal 	-54(%ebp),%ebx

	movl	%ebx,(%esp)
	movl	%eax,4(%esp)
	call	fputs

	movl	-4(%ebp),%eax
	
	movl	$newline,(%esp)
	movl	%eax,4(%esp)
	call	fputs

label_cond:
	leal 	-54(%ebp),%ebx
	movl	%ebx,(%esp)
	call	gets

	movl	%eax,(%esp)
	call	strlen

	cmpl	$0,%eax
	jg		label_body

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
