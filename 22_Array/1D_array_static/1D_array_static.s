.equ	MAX,50

.section .rodata
	msg_main_print1:
	.string "Enter value of n (< %d):\t"

	msg_main_print2:
	.string	"Enter %d value :\t"

	msg_main_scan:
	.string	"%d"

	msg_main_print3:
	.string	"Entered elements are :\n"

	msg_main_print4:
	.string	"%d value is :\t%d\n"

.section .text
.globl	main
.type	main,@object

main:
	pushl	%ebp
	movl	%esp,%ebp

	#4+4+(4*50) = 208 
	subl	$208,%esp

	pushl	$MAX
	pushl	$msg_main_print1
	call	printf
	addl	$8,%esp

	leal	-4(%ebp),%ebx

	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8,%esp

	movl	$0,-8(%ebp)
	jmp		lable_for1_cond

lable_for1_st:
	pushl	%eax
	pushl	$msg_main_print2
	call	printf
	addl	$8,%esp

	movl	-8(%ebp),%eax

	leal	-208(%ebp,%eax,4),%ebx

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
	movl	-208(%ebp,%eax,4),%edx

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

	pushl	$0
	call	exit
	