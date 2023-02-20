.section .rodata
	msg_main_print1:
	.string "\n\nEnter String1:\t"

	msg_main_print2:
	.string "\n\nEnter String To Be Found:\t"

	msg_main_print3:
	.string "\n\nString Not Found\n"

	msg_main_print4:
	.string "\n\nString Is Found At %d Location\n"
	
	msg_main_print5:
	.string "\n\nString Found In '%s'\n"

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

	leal 	-40(%ebp),%ebx	#substring

	movl 	%ebx,(%esp)			
	call 	gets

	leal 	-20(%ebp),%eax	#string1
	leal 	-40(%ebp),%ebx	#substring	

	movl	%eax,(%esp)
	movl 	%ebx,4(%esp)
	call	mystrstr

	movl 	%eax,-44(%ebp)

	cmpl	$0,%eax
	jne		lable_else

	movl	$msg_main_print3,(%esp)
	call 	printf

	jmp		lable_exit

lable_else:
	leal	-20(%ebp),%ebx	#string1
	subl	%ebx,%eax 		#no need of div operation as size is 1
							# ptr -ptr / size = ptr - ptr/1 = ptr-ptr
	incl	%eax
	movl	$msg_main_print4,(%esp)
	movl	%eax,4(%esp)
	call 	printf

	movl	-44(%ebp),%eax
	movl	$msg_main_print5,(%esp)
	movl	%eax,4(%esp)
	call 	printf


lable_exit:
	movl 	$0,(%esp)
	call 	exit 

.type mystrstr,@function
.globl mystrstr
	
mystrstr:
	pushl	%ebp
	movl 	%esp,%ebp

	subl	$16,%esp

	movl	8(%ebp),%ebx

	movl	%ebx,(%esp)
	call	mystrlen

	movl	%eax,%ecx	#strlen(string1)

	movl	8(%ebp),%edi

lable_start_scan:
	movl	12(%ebp),%ebx	#substr
	movb	(%ebx),%al
	repne	scasb
	je 		lable_char_found
	movl	$0,%eax
	jmp 	lable_ret

lable_char_found:
	movl	%edi,-4(%ebp)
	movl	%ecx,-8(%ebp)	#iCounter1
	movl	12(%ebp),%esi	#substr
	incl	%esi
	movl	%esi,(%esp)
	call	strlen
	movl	%eax,%ecx
	repe 	cmpsb
	jne		lable_reset_pos
	cmpl	$0,%ecx
	je 		lable_substr_found

lable_reset_pos:
	movl	-4(%ebp),%edi
	movl	-8(%ebp),%ecx	#iCounter1
	jmp		lable_start_scan

lable_substr_found:
	decl	-4(%ebp)
	movl	-4(%ebp),%eax

lable_ret:
	movl	%ebp,%esp
	popl	%ebp
	ret
