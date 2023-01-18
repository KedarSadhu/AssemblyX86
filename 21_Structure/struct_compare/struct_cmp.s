.section .rodata

	msg_main_print1:
	.string	"obj1 is \n"

	msg_main_print_obj:
	.string "chChar = %c\tiNo = %d\tshiNo = %hd\n\n"

	msg_main_print2:
	.string "obj2 is \n"

	msg_main_print3:
	.string "obj3 is \n"

	msg_main_print4:
	.string "obj1 & obj2 comparision is : "

	msg_main_print5:
	.string "\nobj2 & obj3 comparision is : "

	msg_main_print_equal:
	.string	"equal\n"

	msg_main_print_unequal:
	.string "not equal\n"

.section .data 
	.globl	obj1
	.type	obj1,@object
	.size	obj1,12
	.align	4

	obj1:
		.ascii	"A"
		.zero	3
		.int	10
		.value	20

.section .text
.type	main,@function
.globl	main

main:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$24,%esp

	movb	$'B',-12(%ebp)
	movl	$30,-8(%ebp)
	movw	$40,-4(%ebp)

	movb	$'B',-24(%ebp)
	movl	$30,-20(%ebp)
	movw	$40,-16(%ebp)

	pushl	$msg_main_print1
	call	printf
	addl 	$4,%esp	

#printing obj1 content
	movl	$obj1,%ebx		#address

	xorl	%eax,%eax
	xorl	%ecx,%ecx

	movb	(%ebx),%al 		#chChar
	movl	4(%ebx),%edx	#iNo
	movw	8(%ebx),%cx		#shiNo

	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_obj
	call	printf
	addl	$16,%esp
#end

	pushl	$msg_main_print2
	call	printf
	addl 	$4,%esp

#printing obj2 content
	leal	-12(%ebp),%ebx		#address

	xorl	%eax,%eax
	xorl	%ecx,%ecx

	movb	(%ebx),%al 		#chChar
	movl	4(%ebx),%edx	#iNo
	movw	8(%ebx),%cx		#shiNo

	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_obj
	call	printf
	addl	$16,%esp
#end

	pushl	$msg_main_print3
	call	printf
	addl 	$4,%esp

#printing obj3 content
	leal	-24(%ebp),%ebx		#address

	xorl	%eax,%eax
	xorl	%ecx,%ecx

	movb	(%ebx),%al 		#chChar
	movl	4(%ebx),%edx	#iNo
	movw	8(%ebx),%cx		#shiNo

	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_obj
	call	printf
	addl	$16,%esp
#end
	
	pushl	$msg_main_print4
	call	printf
	addl	$4,%esp

	movl	$obj1,%ebx		#obj1 address
	leal	-12(%ebp),%edx	#obj2 address

	xorl	%eax,%eax
	xorl	%ecx,%ecx

	movb	(%ebx),%al 		#obj1.chChar
	movb	(%edx),%cl 		#obj2.chChar	

	cmpl	%ecx,%eax
	jne		lable_else

	xorl	%eax,%eax
	xorl	%ecx,%ecx

	movl	4(%ebx),%eax 		#obj1.iNo
	movl	4(%edx),%ecx 		#obj2.iNo	

	cmpl	%ecx,%eax
	jne		lable_else

	xorl	%eax,%eax
	xorl	%ecx,%ecx

	movw	8(%ebx),%ax 		#obj1.shiNo
	movw	8(%edx),%cx 		#obj2.shiNo	

	cmpl	%ecx,%eax
	jne		lable_else	

	pushl	$msg_main_print_equal
	call	printf
	addl	$4,%esp

	jmp		lable_cmp_local_obj	

lable_else:
	pushl	$msg_main_print_unequal
	call	printf
	addl	$4,%esp

lable_cmp_local_obj:
	pushl	$msg_main_print5
	call	printf
	addl	$4,%esp

	leal	-12(%ebp),%ebx	#obj2 address
	leal 	-24(%ebp),%edx	#obj3 address

	xorl	%eax,%eax
	xorl	%ecx,%ecx

	movb	(%ebx),%al 		#obj2.chChar
	movb	(%edx),%cl 		#obj3.chChar	

	cmpl	%ecx,%eax
	jne		lable_else2

	xorl	%eax,%eax
	xorl	%ecx,%ecx

	movl	4(%ebx),%eax 		#obj2.iNo
	movl	4(%edx),%ecx 		#obj3.iNo	

	cmpl	%ecx,%eax
	jne		lable_else2

	xorl	%eax,%eax
	xorl	%ecx,%ecx

	movw	8(%ebx),%ax 		#obj2.shiNo
	movw	8(%edx),%cx 		#obj3.shiNo	

	cmpl	%ecx,%eax
	jne		lable_else2	

	pushl	$msg_main_print_equal
	call	printf
	addl	$4,%esp

	jmp 	lable_exit

lable_else2:
	pushl	$msg_main_print_unequal
	call	printf
	addl	$4,%esp

lable_exit:
	pushl 	$0
	call	exit

