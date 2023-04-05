.section .rodata
	msg_main_print_help:
	.string "Invalid arguments : prog_name"

	msg_main_print1:
	.string "Envp Values are :"

.section .text
.globl main 
.type main,@function

main:
	andl	$-16,%ebp
	pushl	%ebp
	movl	%esp,%ebp

	subl	$16,%esp

	movl	4(%ebp),%eax	#argc

	cmpl	$1,%eax
	jne		label_error

	movl	$msg_main_print1,(%esp)
	call	puts

	movl	$0,-4(%ebp)		#iCounter

	#to perform envp[iCounter] aplyala pahile envp parynt 
	#pohchaychy
	movl	4(%ebp),%eax
	addl	$1,%eax	#adding 1 bcz of NULL
	leal	8(%ebp),%ebx
	leal 	(%ebx,%eax,4),%ebx	#base address of envp

	jmp		label_for_cond

label_for_body:
	movl	%edx,(%esp)
	call	puts

	addl	$1,-4(%ebp)

label_for_cond:
	movl	-4(%ebp),%eax
	movl	(%ebx,%eax,4),%edx

	cmpl	$0,%edx
	jne		label_for_body

	movl	$0,(%esp)
	call	exit


label_error:
	movl	$msg_main_print_help,(%esp)
	call	puts

	movl	$-1,(%esp)
	call	exit

