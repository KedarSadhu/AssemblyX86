.section .rodata
	msg_main_print1:
	.string	"Enter obj2 values--> \n"

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

	msg_main_print_obj2:
	.string "obj2 is \n"

	msg_main_print_obj:
	.string "chChar = %c\tiNo = %d\tshiNo = %hd\n\n"

	msg_main_print_obj1:
	.string "obj1 is \n"

	msg_main_print_obj3:
	.string "obj3 is \n"

.section .bss
	.comm	obj1,12,4

.section .text
.type	main,@function
.globl	main

main :
	pushl	%ebp
	movl	%esp,%ebp

	subl	$24,%esp

#Entering content of Obj2

	pushl	$msg_main_print1
	call	printf
	addl	$4,%esp

	pushl	$msg_main_print_char
	call	printf
	addl	$4,%esp

	leal	-12(%ebp),%ebx	#obj2 address

	pushl	%ebx			#chChar
	pushl	$msg_main_scan_char1
	call	scanf
	addl	$8,%esp

	pushl	$msg_main_print_int
	call	printf
	addl	$4,%esp

	leal	-12(%ebp),%ebx	#obj2 address

	leal	4(%ebx),%ebx	#iNo
	
	pushl	%ebx
	pushl	$msg_main_scan_int1
	call	scanf
	addl	$8,%esp

	pushl	$msg_main_print_short
	call	printf
	addl	$4,%esp

	leal	-12(%ebp),%ebx	#obj2 address

	leal	8(%ebx),%ebx	#shiNo

	pushl	%ebx
	pushl	$msg_main_scan_short1
	call	scanf
	addl	$8,%esp	

#Printing content of obj2

	pushl	$msg_main_print_obj2
	call	printf
	addl 	$4,%esp

	leal	-12(%ebp),%ebx	#obj2 address
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

#assigning obj2 to obj1

	movl	$obj1,%ebx		#obj1 Address
	leal	-12(%ebp),%edx	#obj2 Address

	xorl	%eax,%eax

	movb	(%edx),%al		#obj1.chChar = obj2.chChar
	movb	%al,(%ebx)

	xorl	%eax,%eax

	movl	4(%edx),%eax	#obj1.iNo = obj2.iNo
	movl	%eax,4(%ebx)

	xorl	%eax,%eax

	movw	8(%edx),%ax		#obj1.shiNo = obj2.shiNo
	movw	%ax,8(%ebx)


#assigning obj2 to obj3

	leal	-12(%ebp),%ebx	#obj2 Address
	leal	-24(%ebp),%edx	#obj3 Address

	xorl	%eax,%eax

	movb	(%ebx),%al		#obj3.chChar = obj2.chChar
	movb	%al,(%edx)

	xorl	%eax,%eax

	movl	4(%ebx),%eax	#obj3.iNo = obj2.iNo
	movl	%eax,4(%edx)

	xorl	%eax,%eax

	movw	8(%ebx),%ax		#obj3.shiNo = obj2.shiNo
	movw	%ax,8(%edx)

#Printing content of obj1

	pushl	$msg_main_print_obj1
	call	printf
	addl 	$4,%esp

	movl	$obj1,%ebx

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

#Printing content of obj3

	pushl	$msg_main_print_obj3
	call	printf
	addl 	$4,%esp

	leal	-24(%ebp),%ebx

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
