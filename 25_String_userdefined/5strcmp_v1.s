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

	movl	8(%ebp),%esi	#pStr1
	movl	12(%ebp),%edi	#pStr2

	movl	$255,%ecx

lable_loop:
	cmpsb
	jne		lable_calculate_not_eq
	cmpb 	$0,(%esi)
	je 		lable_eq
	loop	lable_loop	

lable_calculate_not_eq:
	decl	%esi
	decl	%edi

lable_eq:
	movb	(%esi),%dl
	movb	(%edi),%dh

	subb	%dl,%dh
	movsx	%dh,%eax

	movl	%ebp,%esp
	popl	%ebp
	ret
