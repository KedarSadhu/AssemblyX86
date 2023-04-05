.section .rodata
	filename:
	.string "struct_to_file_fwrite.txt"

	mode:
	.string "w"

	msg_print_err:
	.string "\nCant Open File \n"

	msg_main_print1:
	.string "\n\nEnter name,roll no. and percentage:\n"

	msg_main_scan_3ele:
	.string "%s %d %f"

	msg_main_fprintf:
	.string "%s %d %f\n"

	msg_main_print2:
	.string "\nAdd another record (Y/N)"

	msg_main_scan_2ele:
	.string "%c%c"	


.section .text
.type main, @function
.globl main

main:
	andl	$-16,%esp
	pushl	%ebp
	movl	%esp,%ebp

	subl	$80,%esp

	movl	$0,-4(%ebp)	#FILE *fp = NULL;
	movb	$'Y',-5(%ebp)

	movl	$filename,(%esp)
	movl	$mode,4(%esp)
	call	fopen

	movl	%eax,-4(%ebp)

	cmpl	$0,%eax
	je		label_error

	jmp		label_cond

label_loop_body:
	movl	$msg_main_print1,(%esp)
	call	printf

	leal  	-53(%ebp),%eax	#s.szName
	leal    -13(%ebp),%ebx	#&s.iRollNo
	leal 	-9(%ebp),%ecx	#&s.fPerc

	movl	$msg_main_scan_3ele,(%esp)
	movl	%eax,4(%esp)
	movl 	%ebx,8(%esp)
	movl 	%ecx,12(%esp)
	call 	scanf

	leal  	-53(%ebp),%eax	#s.szName
	movl	-4(%ebp),%edx	#fp

	movl	%eax,(%esp)
	movl	$48,4(%esp)
	movl	$1,8(%esp)
	movl 	%edx,12(%esp)
	call 	fwrite

	movl	$msg_main_print2,(%esp)
	call 	printf

	leal 	-54(%ebp),%eax
	leal 	-5(%ebp),%edx

	movl	$msg_main_scan_2ele,(%esp)
	movl	%eax,4(%esp)
	movl 	%edx,8(%esp)
	call 	scanf
	
label_cond:
	movb	-5(%ebp),%al 

	cmpb	$'Y',%al 
	je		label_loop_body
	cmpb	$'y',%al
	je		label_loop_body


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
