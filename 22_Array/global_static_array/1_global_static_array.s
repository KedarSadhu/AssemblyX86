.equ	MAX,10

.section .rodata
	msg_main_print1:
	.string	"Enter value of n (< %d):\t"

	msg_main_scan:
	.string	"%d"

	msg_main_print2:
	.string "Enter %d value :\t"

	msg_main_print3:
	.string "arr1 is :\n"

	msg_main_print_arr_content:
	.string "%d value is :\t%d\n"

	msg_main_print4:
	.string "arr2 is :\n"

.section .data
	.globl	arr1
	.type	arr1,@object
	.size	arr1,12
	.align	4

	arr1:
	.int	10
	.int	20
	.int	30

.section .bss
	.comm	arr2,40,4

.section .text

.globl	main
.type	main,@function

main:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$8,%esp

	pushl	$MAX
	pushl	$msg_main_print1
	call	printf
	addl	$8,%esp

	leal	-4(%ebp),%ebx

	pushl	%ebx				#iMax
	pushl	$msg_main_scan	
	call	scanf
	addl	$8,%esp

	movl	$0,-8(%ebp)
	jmp		lable_for1_condition

lable_for1_st:
	pushl	%eax
	pushl	$msg_main_print2
	call	printf
	addl	$8,%esp

	movl	-8(%ebp),%eax
	leal	arr2(,%eax,4),%ebx

	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8,%esp

	addl	$1,-8(%ebp)

lable_for1_condition:
	movl	-8(%ebp),%eax	#icounter
	movl	-4(%ebp),%edx	#iMax

	cmpl	%edx,%eax
	jl		lable_for1_st

#continue main body
	pushl	$msg_main_print3
	call 	printf
	addl	$4,%esp

	movl	$0,-8(%ebp)
	jmp		lable_for2_condition

lable_for2_st:
	movl	arr1(,%eax,4),%edx
	
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_arr_content
	call	printf
	addl	$12,%esp

	addl	$1,-8(%ebp)

lable_for2_condition:
	movl	-8(%ebp),%eax
	movl	$3,%edx

	cmpl	%edx,%eax
	jl		lable_for2_st

#continue main body
	pushl	$msg_main_print4
	call 	printf
	addl	$4,%esp

	movl	$0,-8(%ebp)
	jmp		lable_for3_condition

lable_for3_st:
	movl	arr2(,%eax,4),%edx
	
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_arr_content
	call	printf
	addl	$12,%esp

	addl	$1,-8(%ebp)

lable_for3_condition:
	movl	-8(%ebp),%eax	#icounter
	movl	-4(%ebp),%edx	#iMax

	cmpl	%edx,%eax
	jl		lable_for3_st


	pushl	$0
	call	exit
