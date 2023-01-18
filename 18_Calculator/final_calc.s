.section .rodata
	msg_main_print_menu:
	.string "\n1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n5.Exit\n"

	msg_main_print_ch:
	.string "\nEnter your choice :"

	msg_main_scan :
	.string "%d"

	msg_main_print_getno :
	.string	"\nEnter two numbers :"

	msg_main_scan_two_no :
	.string "%d%d"	

	msg_main_print_default:
	.string "Enter valid choice\n"

	msg_main_print_ans:
	.string "\n\nAnswer is : %d\n\n"

	msg_main_print_quit:
	.string "Are you want to enter more choice ? (1/0) : "

.section .text
.type	main,@function
.globl	main 

main:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$16,%esp	#iNo1,iNo2,iAns,iCh

lable_dowhile_st:
	pushl	$msg_main_print_menu
	call 	printf
	addl	$4,%esp

	pushl	$msg_main_print_ch
	call	printf
	addl	$4,%esp

	leal 	-16(%ebp),%ebx

	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8,%esp

	movl	-16(%ebp),%eax

	cmpl 	$0,%eax
	jng		lable_switch_code
	cmpl 	$5,%eax
	jnl	 	lable_switch_code

	pushl	$msg_main_print_getno
	call	printf
	addl	$4,%esp

	leal 	-4(%ebp),%eax	#iNo1
	leal 	-8(%ebp),%edx	#iNo2

	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan_two_no
	call	scanf
	addl	$12,%esp

	movl	-16(%ebp),%eax

lable_switch_code:
	cmpl	$1,%eax
	je		lable_case1_addition

	cmpl	$2,%eax
	je		lable_case2_subtraction

	cmpl	$3,%eax
	je		lable_case3_multiplication

	cmpl	$4,%eax
	je		lable_case4_division

	cmpl	$5,%eax
	je		lable_exit

	jmp		lable_default

lable_case1_addition:
	movl	-4(%ebp),%eax
	movl	-8(%ebp),%edx
	
	pushl	%edx
	pushl	%eax
	call 	Addition
	addl	$8,%esp

	movl	%eax,-12(%ebp)
	jmp		lable_dowhile_st_continued

lable_case2_subtraction:
	movl	-4(%ebp),%eax
	movl	-8(%ebp),%edx
	
	pushl	%edx
	pushl	%eax
	call 	Subtraction 
	addl	$8,%esp

	movl	%eax,-12(%ebp)
	jmp		lable_dowhile_st_continued

lable_case3_multiplication:
	movl	-4(%ebp),%eax
	movl	-8(%ebp),%edx
	
	pushl	%edx
	pushl	%eax
	call 	Multiplication
	addl	$8,%esp

	movl	%eax,-12(%ebp)
	jmp		lable_dowhile_st_continued

lable_case4_division:
	movl	-4(%ebp),%eax
	movl	-8(%ebp),%edx
	
	pushl	%edx
	pushl	%eax
	call 	Division
	addl	$8,%esp

	movl	%eax,-12(%ebp)
	jmp		lable_dowhile_st_continued

lable_default:
	pushl	$msg_main_print_default
	call 	printf
	addl	$4,%esp

	movl	$1,-16(%ebp)
	jmp		lable_dowhile_condition

lable_dowhile_st_continued:
	pushl	%eax
	pushl	$msg_main_print_ans
	call 	printf
	addl 	$8,%esp

	pushl	$msg_main_print_quit
	call 	printf
	addl	$4,%esp

	leal 	-16(%ebp),%ebx
	
	pushl 	%ebx
	pushl	$msg_main_scan
	call 	scanf
	addl 	$8,%esp

lable_dowhile_condition:
	movl	-16(%ebp),%eax
	cmpl 	$1,%eax
	je		lable_dowhile_st

lable_exit:
	pushl	$0
	call 	exit


.globl	Addition
.type	Addition,@function

Addition:
	pushl	%ebp
	movl	%esp,%ebp

	movl	8(%ebp),%eax
	movl	12(%ebp),%edx
	addl	%edx,%eax

	movl	%ebp,%esp
	popl	%ebp

	ret

.globl	Subtraction
.type	Subtraction,@function

Subtraction:
	pushl	%ebp
	movl	%esp,%ebp

	movl	8(%ebp),%eax	
	movl	12(%ebp),%edx
	subl	%edx,%eax	

	movl	%ebp,%esp
	popl	%ebp

	ret
	
.globl	Multiplication
.type	Multiplication,@function

Multiplication:
	pushl	%ebp
	movl	%esp,%ebp

	movl	8(%ebp),%eax
	movl	12(%ebp),%edx
	mul		%edx

	movl	%ebp,%esp
	popl	%ebp

	ret

.globl	Division
.type	Division,@function

Division:
	pushl	%ebp
	movl	%esp,%ebp

	xorl	%edx,%edx
	movl	8(%ebp),%eax
	movl	12(%ebp),%ecx
	divl	%ecx

	movl	%ebp,%esp
	popl	%ebp

	ret
