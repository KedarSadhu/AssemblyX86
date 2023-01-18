.section .rodata
	msg_main_print1:
	.string "Enter value of n :\t"

	msg_main_scan:
	.string "%d"

	msg_main_err_msg:
	.string "Memory allocation failed"

	msg_main_print2:
	.string	"Enter %d value :\t"

	msg_main_print3:
	.string	"Entered elements are :\n"

	msg_main_print4:
	.string	"%d value is :\t%d\n"

.section .text
.globl	main
.type	main,@function

main:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$12,%esp

	pushl	$msg_main_print1
	call	printf
	addl	$4,%esp

	leal	-4(%ebp),%ebx

	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8,%esp

	movl	-4(%ebp),%edx
	movl	$4,%eax

	mul		%edx

	pushl	%eax
	call	malloc
	addl	$4,%esp

	movl	%eax,-12(%ebp)

	cmpl	$0,%eax
	je		lable_err_msg

	movl	$0,-8(%ebp)
	jmp		lable_for1_cond

lable_for1_st:
	pushl	%eax
	pushl	$msg_main_print2
	call	printf
	addl	$8,%esp

	#(pptr,%eax,4)
	movl	-12(%ebp),%ebx
	movl	-8(%ebp),%eax
	leal	(%ebx,%eax,4),%ebx

	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8,%esp

	addl	$1,-8(%ebp)

lable_for1_cond:
	movl	-8(%ebp),%eax
	movl	-4(%ebp),%edx

	cmpl	%edx,%eax
	jl		lable_for1_st

#main() continues
	pushl	$msg_main_print3
	call	printf
	addl	$4,%esp

	movl	$0,-8(%ebp)
	jmp 	lable_for2_cond

lable_for2_st:
	movl	-12(%ebp),%ebx
	movl	(%ebx,%eax,4),%edx

	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print4
	call	printf
	addl	$12,%esp
	
	addl	$1,-8(%ebp)

lable_for2_cond:
	movl	-8(%ebp),%eax
	movl	-4(%ebp),%edx

	cmpl	%edx,%eax
	jl		lable_for2_st


	movl	-12(%ebp),%eax

	pushl	%eax
	call	free
	addl	$4,%esp

	movl	$0,-12(%ebp)

	pushl	$0
	call	exit

lable_err_msg:
	pushl	$msg_main_err_msg
	call	puts
	addl	$4,%esp

	movl	$-1,%eax
	ret
	