.section .rodata
	filename:
	.string "print_charecters.txt"

	mode:
	.string "r"

	msg_print_err:
	.string "\nCant Open File \n"

	msg_main_print:
	.string "%c"

.section .text
.type main, @function
.globl main

main:
	andl	$-16,%esp
	pushl	%ebp
	movl	%esp,%ebp

	subl	$16,%esp

	movl	$0,-4(%ebp)	#FILE *fp = NULL;

	movl	$filename,(%esp)
	movl	$mode,4(%esp)
	call	fopen

	movl	%eax,-4(%ebp)

	cmpl	$0,%eax
	je		label_error

label_loop_while1:
	movl	-4(%ebp),%eax

	movl	%eax,(%esp)
	call	fgetc

	cmpl	$-1,%eax
	je		label_main_continue

	movl	$msg_main_print,(%esp)
	movl	%eax,4(%esp)
	call 	printf

	jmp		label_loop_while1

label_main_continue:
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
