.section .text
.type mystrlen,@function
.globl mystrlen

mystrlen:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$4,%esp

	movl	$0,-4(%ebp)

	jmp		lable_while_cond

lable_while_st:
	addl	$1,-4(%ebp)
	addl	$1,8(%ebp)

lable_while_cond:
	movl	8(%ebp),%eax
	movb	(%eax),%al 

	cmpb	$0,%al
	jne		lable_while_st

	movl	-4(%ebp),%eax

	movl	%ebp,%esp
	popl	%ebp

	ret
