.section .rodata
	msg_main_print1:
	.string "arr[3][2] is %d\n"

	msg_main_print2:
	.string "&arr is %d\n"

	msg_main_print3:
	.string "&arr[3][2] is %d\n"

.section .text
.globl main
.type main,@function

main:
	pushl 	%ebp
	movl	%esp,%ebp

	subl	$48,%esp

	movl	$10,-48(%ebp)
	movl	$20,-44(%ebp)
	movl	$30,-40(%ebp)
	movl	$40,-36(%ebp)
	movl	$50,-32(%ebp)
	movl	$60,-28(%ebp)
	movl	$70,-24(%ebp)
	movl	$0,-20(%ebp)
	movl	$0,-16(%ebp)
	movl	$0,-12(%ebp)
	movl	$0,-8(%ebp)
	movl	$0,-4(%ebp)

	movl	$3,%eax
	#leal	-48(%ebp,%eax,12),%ebx he chalat nahi
	#12 hi size direct chalat nahi tyala 1,2,4,8 ch lage size
	#tyamule aplyala he calculation manually karav lagel

	leal 	-48(%ebp),%ebx
	movl	$12,%edx	
	mull 	%edx

	addl	%eax,%ebx

	movl	$2,%eax
	movl	(%ebx,%eax,4),%eax

	pushl	%eax
	pushl	$msg_main_print1
	call	printf
	addl	$8,%esp

	leal	-48(%ebp),%ebx

	pushl	%ebx
	pushl	$msg_main_print2
	call	printf
	addl	$8,%esp

	movl	$3,%eax
	leal 	-48(%ebp),%ebx
	movl	$12,%edx	
	mull 	%edx

	addl	%eax,%ebx
	
	movl	$2,%eax
	leal	(%ebx,%eax,4),%ebx

	pushl	%ebx
	pushl	$msg_main_print3
	call	printf
	addl	$8,%esp
	
	pushl	$0
	call	exit

