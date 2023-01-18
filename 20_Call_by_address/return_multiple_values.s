.section .rodata
	msg_main_print1:
	.string "Enter two numbers : "

	msg_main_scan :
	.string	"%d%d"

	msg_main_print_sum:
	.string "Sum is %d\n"

	msg_main_print_diff:
	.string "Diff is %d\n"

.section .text

.type	main,@function
.globl	main

main:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$16,%esp	#iNo1,iNo2,iSum,iDiff

	pushl	$msg_main_print1
	call	printf
	addl	$4,%esp

	leal	-4(%ebp),%eax
	leal	-8(%ebp),%edx
	
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan
	call	scanf
	addl	$12,%esp

	leal	-16(%ebp),%ebx	#iDiff
	leal	-12(%ebp),%ecx	#iSum
	movl	-8(%ebp),%edx	#iNo2
	movl	-4(%ebp),%eax	#iNo1

	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	SumDiff
	addl	$16,%esp
	
	movl	-12(%ebp),%eax

	pushl	%eax
	pushl	$msg_main_print_sum
	call	printf
	addl	$8,%esp

	movl	-16(%ebp),%eax

	pushl	%eax
	pushl	$msg_main_print_diff
	call	printf
	addl	$8,%esp	

	pushl	$0
	call	exit

.type	SumDiff,@function
.globl	SumDiff

SumDiff:
	pushl	%ebp
	movl	%esp,%ebp

	movl	8(%ebp),%eax
	movl	12(%ebp),%edx

	addl	%edx,%eax

	movl	16(%ebp),%ebx	#&iSum
	movl	%eax,(%ebx)

	movl	8(%ebp),%eax
	
	movl	20(%ebp),%ebx

	subl	%edx,%eax

	movl	%eax,(%ebx)

	movl	%ebp,%esp
	popl	%ebp

	ret




