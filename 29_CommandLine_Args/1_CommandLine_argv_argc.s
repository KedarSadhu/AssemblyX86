.section .rodata
	msg_main_print1:
	.string "argc is : %d\n\n"

	msg_main_print_help:
	.string "Invalid arguments : prog_name arg1 arg2"

	msg_main_print2:
	.string "Values are :"

	msg_main_print_newline:
	.string "\n"

	msg_main_print3:
	.string "Sum is %d\n"

.section .text
.globl main 
.type main,@function

main:
	andl	$-16,%ebp
	pushl	%ebp
	movl	%esp,%ebp

	subl	$16,%esp

	movl	4(%ebp),%eax	#argc

	movl	$msg_main_print1,(%esp)
	movl	%eax,4(%esp)
	call	printf

	movl	4(%ebp),%eax	#argc	
	
	cmpl	$3,%eax
	jne		label_error

	movl	$msg_main_print2,(%esp)
	call	puts

	movl	$0,-4(%ebp)		#iCounter

	jmp		label_for_cond

label_for_body:
	leal	8(%ebp),%ebx
	movl	(%ebx,%eax,4),%ebx

	movl	%ebx,(%esp)
	call	puts

	addl	$1,-4(%ebp)

label_for_cond:
	movl	-4(%ebp),%eax	#iCounter
	movl	4(%ebp),%edx	#argc
	cmpl	%edx,%eax
	jl		label_for_body
	
	movl	$msg_main_print_newline,(%esp)
	call	printf

	movl	12(%ebp),%eax	#argv[1]
	movl	%eax,(%esp)
	call	atoi
	movl	%eax,-8(%ebp)

	movl	16(%ebp),%edx	#argv[2]
	movl	%edx,(%esp)
	call	atoi

	movl	-8(%ebp),%edx
	addl	%edx,%eax

	movl	%eax,-8(%ebp)

	movl	$msg_main_print3,(%esp)
	movl	%eax,4(%esp)
	call	printf

	movl	$0,(%esp)
	call	exit


label_error:
	movl	$msg_main_print_help,(%esp)
	call	puts

	movl	$-1,(%esp)
	call	exit

