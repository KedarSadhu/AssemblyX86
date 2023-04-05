.section .rodata
	filename:
	.string "file_to_struct.txt"

	mode:
	.string "r"

	msg_print_err:
	.string "\nCant Open File \n"

	msg_main_scan_3ele:
	.string "%s %d %f"

	msg_main_print:
	.string "%s %d %f\n"

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
	leal  	-52(%ebp),%eax	#s.szName
	movl    -12(%ebp),%ebx	#&s.iRollNo
	flds 	-8(%ebp)	#&s.fPerc-->st0
	
	movl	$msg_main_print,(%esp)
	movl	%eax,4(%esp)
	movl 	%ebx,8(%esp)
	fstpl	12(%esp)
	call 	printf

label_cond:
	movl	-4(%ebp),%eax	#fp		
	leal  	-52(%ebp),%edx	#s.szName
	leal    -12(%ebp),%ebx	#&s.iRollNo
	leal 	-8(%ebp),%ecx	#&s.fPerc

	movl	%eax,(%esp)
	movl	$msg_main_scan_3ele,4(%esp)
	movl	%edx,8(%esp)
	movl	%ebx,12(%esp)
	movl	%ecx,16(%esp)
	call	fscanf

	cmpl	$-1,%eax
	jne		label_body

###
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
