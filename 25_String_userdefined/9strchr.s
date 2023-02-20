.section .rodata
	msg_main_print1:
	.string "\n\nEnter The String:\t"

	msg_main_print2:
	.string "\n\nEnter Character To Be Found:\t"

	msg_main_scan:
	.string "%c"

	msg_main_print3:
	.string "\n\nCharacter Is Not Found\n"

	msg_main_print4:
	.string "\n\nCharacter Is Found At %d Location\n"

.section .text
.type main,@function
.globl main

main:
	andl	$-16,%esp
	pushl	%ebp
	movl	%esp,%ebp

	subl	$32,%esp

	movl	$msg_main_print1,(%esp)
	call	printf

	leal	-20(%ebp),%ebx

	movl	%ebx,(%esp)
	call	gets

	movl	$msg_main_print2,(%esp)
	call 	printf

	leal	-21(%ebp),%ebx

	movl	$msg_main_scan,(%esp)
	movl	%ebx,4(%esp)
	call	scanf

	leal	-20(%ebp),%ebx
	movb	-21(%ebp),%al 

	movl	%ebx,(%esp)
	movb	%al,4(%esp)
	call	mystrchr

	cmpl	$0,%eax
	jne		label_else
	movl	$msg_main_print3,(%esp)
	call 	printf
	jmp		label_ret

label_else:
	leal	-20(%ebp),%ebx
	subl	%ebx,%eax 		#no need of div operation as size is 1
							# ptr -ptr / size = ptr - ptr/1 = ptr-ptr
	incl	%eax
	movl	$msg_main_print4,(%esp)
	movl	%eax,4(%esp)
	call 	printf

label_ret:
	movl	$0,(%esp)
	call 	exit	

.type 	mystrchr,@function
.globl	mystrchr

mystrchr:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$16,%esp

	movl	8(%ebp),%ebx

	movl	%ebx,(%esp)
	call 	mystrlen

	movl	%eax,%ecx

	movb	12(%ebp),%al
	movl	8(%ebp),%edi

	repne	scasb
	je		label_found
	movl	$0,%eax
	jmp		lable_ret

label_found:
	decl	%edi
	movl	%edi,%eax

lable_ret:
	movl	%ebp,%esp
	popl	%ebp
	ret
