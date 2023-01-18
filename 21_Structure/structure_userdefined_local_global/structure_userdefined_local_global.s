.section .rodata
	msg_main_print1:
	.string	"Enter obj1 values--> \n"

	msg_main_print_char:
	.string	"Enter chChar\t:"

	msg_main_scan_char1:
	.string	"%c"

	msg_main_print_int:
	.string	"Enter iNo\t:"

	msg_main_scan_int1:
	.string	"%d"

	msg_main_print_short:
	.string	"Enter shiNo\t:"

	msg_main_scan_short1:
	.string	"%hd"

	msg_main_print2:
	.string	"Enter obj2 values--> \n"

	msg_main_scan_char2:
	.string	"%c%c"

	msg_main_scan_int2:
	.string	"%c%d"

	msg_main_scan_short2:
	.string	"%c%hd"

	msg_main_print3:
	.string	"obj1 is \n"

	msg_main_print_obj:
	.string "chChar = %c\tiNo = %d\tshiNo = %hd\n\n"

	msg_main_print4:
	.string "obj2 is \n"

.section .bss
	.comm	obj1,12,4

.section .text
.type	main,@function
.globl	main

main :
	pushl	%ebp
	movl	%esp,%ebp

	subl	$13,%esp

#Entering content of Obj1

	pushl	$msg_main_print1
	call	printf
	addl	$4,%esp

	pushl	$msg_main_print_char
	call	printf
	addl	$4,%esp

	movl	$obj1,%ebx

	pushl	%ebx
	pushl	$msg_main_scan_char1
	call	scanf
	addl	$8,%esp


	pushl	$msg_main_print_int
	call	printf
	addl	$4,%esp

	movl	$obj1,%ebx
	
	leal	4(%ebx),%eax
	
	pushl	%eax
	pushl	$msg_main_scan_int1
	call	scanf
	addl	$8,%esp

	pushl	$msg_main_print_short
	call	printf
	addl	$4,%esp

	movl	$obj1,%ebx

	leal	8(%ebx),%eax

	pushl	%eax
	pushl	$msg_main_scan_short1
	call	scanf
	addl	$8,%esp	


#Entering content in obj2

	pushl	$msg_main_print2
	call	printf
	addl	$4,%esp

	pushl	$msg_main_print_char
	call	printf
	addl	$4,%esp

	leal	-12(%ebp),%ebx	#obj2
	leal	-13(%ebp),%eax	#t

	pushl	%ebx
	pushl	%eax
	pushl	$msg_main_scan_char2
	call	scanf
	addl	$12,%esp

	pushl	$msg_main_print_int
	call	printf
	addl	$4,%esp

	leal	-12(%ebp),%ebx	#obj2
	leal	-13(%ebp),%eax	#t
	leal	4(%ebx),%edx	#&obj2.iNo
	
	pushl	%edx	
	pushl	%eax
	pushl	$msg_main_scan_int2
	call	scanf
	addl	$12,%esp

	pushl	$msg_main_print_short
	call	printf
	addl	$4,%esp

	leal	-12(%ebp),%ebx	#obj2
	leal	-13(%ebp),%eax	#t
	leal	8(%ebx),%edx	#&obj2.shiNo

	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan_short2
	call	scanf
	addl	$12,%esp	


#Printing content of obj1

	pushl	$msg_main_print3
	call	printf
	addl 	$4,%esp

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

#Printing content of Obj2
	pushl	$msg_main_print4
	call	printf
	addl 	$4,%esp

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

	pushl	$0
	call	exit

	
