.section .rodata
	msg_main_print:
	.string "Addition is :: %qd\n"

.section .data 
	.globl 	value1
	.type 	value1,@object
	.size 	value1,8
	.align  4
	
	value1:
	.quad	2147483648		#2^32 / 2

	.globl 	value2
	.type 	value2,@object
	.size 	value2,8
	.align  4
	
	value2:
	.quad	2147483700		#2^32 / 2 +52

.section .text
.globl	main 
.type main,@function

main : 
	andl	$-16,%esp
	pushl	%ebp
	movl	%esp,%ebp

	subl	$16,%esp

	movl	value1,%eax
	movl	value1+4,%edx

	movl	value2,%ecx
	movl	value2+4,%ebx

	addl	%eax,%ecx
	adcl	%edx,%ebx

	movl	$msg_main_print,(%esp)
	movl	%ecx,4(%esp)
	movl	%ebx,8(%esp)
	call	printf

	movl	$0,(%esp)
	call	exit
	