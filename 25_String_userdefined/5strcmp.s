.section .rodata
	msg_main_print1:
	.string "\n\nEnter String1:\t"

	msg_main_print2:
	.string "\n\nEnter String2:\t"

	msg_main_print3:
	.string "ch = %d\n"

	msg_main_print4:
	.string "\n\nBoth Strings Are Same\n"

	msg_main_print5:
	.string "\n\nBoth Strings Are Diffrent\n"

.section .text
.type main,@function
.globl main

main:
	andl 	$-16,%esp
	pushl 	%ebp
	movl 	%esp,%ebp

	subl 	$64,%esp

	movl 	$msg_main_print1,(%esp)
	call	printf

	leal 	-20(%ebp),%ebx	#string1

	movl 	%ebx,(%esp)			
	call 	gets

	movl 	$msg_main_print2,(%esp)
	call	printf

	leal 	-40(%ebp),%ebx	#string2

	movl 	%ebx,(%esp)			
	call 	gets

	leal 	-20(%ebp),%eax	#string1
	leal 	-40(%ebp),%ebx	#string2	

	movl	%eax,(%esp)
	movl 	%ebx,4(%esp)
	call	mystrcmp

	movl 	%eax,-44(%ebp)

	cmpl	$0,%eax
	jne		lable_else

	movl	$msg_main_print4,(%esp)
	call 	printf

	jmp		lable_exit

lable_else:
	movl	$msg_main_print5,(%esp)
	call 	printf

lable_exit:
	movl 	$0,(%esp)
	call 	exit 

.type mystrcmp,@function
.globl mystrcmp
	
mystrcmp:
	pushl	%ebp
	movl 	%esp,%ebp

	subl	$16,%esp

	jmp		lable_loop_cond

lable_loop_body:
	cmpb	%dl,%al
	jne		lable_not_eq

	addl	$1,8(%ebp)
	addl	$1,12(%ebp)

lable_loop_cond:
	movl	8(%ebp),%eax
	movl	12(%ebp),%edx

	movb	(%eax),%al		#*pStr1
	movb	(%edx),%dl		#*pStr2

	cmpb	$0,%al
	jne		lable_loop_body

	cmpb	$0,%dl
	jne		lable_loop_body

	movl	$0,%eax
	jmp		lable_ret

lable_not_eq:
	movl	$-1,%eax

lable_ret:
	movl	%ebp,%esp
	popl	%ebp
	ret
