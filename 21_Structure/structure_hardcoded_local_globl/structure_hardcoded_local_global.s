.section .rodata
	msg_main_print1:
	.string	"obj1 is \n"

	msg_main_print_obj:
	.string "chChar = %c\tiNo = %d\tshiNo = %hd\n\n"

	msg_main_print2:
	.string "obj2 is \n"

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

	subl	$12,%esp

	movb	$'B',-12(%ebp)
	movl	$30,-8(%ebp)
	movw	$40,-4(%ebp)

	pushl	$msg_main_print1
	call	printf
	addl 	$4,%esp

	movl	$obj1,%ebx		#address

	#xor karva lagel karn push kartana 4 4nech push karaychy
	#pushb/pushw asa kahi nasta mhnun adhi 0 out karun ghetla
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

	pushl	$msg_main_print2
	call	printf
	addl 	$4,%esp


	leal	-12(%ebp),%ebx		#address

	#xor karva lagel karn push kartana 4 4nech push karaychy
	#pushb/pushw asa kahi nasta mhnun adhi 0 out karun ghetla
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

	pushl 	$0
	call	exit


