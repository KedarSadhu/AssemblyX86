.section .rodata
    msg_main_print1:
	.string "Hello\n"

	msg_main_print2:
	.string "%d\n"

	msg_main_print3:
	.string "%d\t%c\n"

	msg_main_print4:
	.string "%c\t%d\n"

	msg_main_print5:
	.string "Addition is %d\n"

.section .text
.globl main
.type main, @function
main:
	andl $-16,%esp

	pushl %ebp
	movl %esp, %ebp

	subl $32,%esp

	movl $msg_main_print1,(%esp)
	call myprintf

	movl $msg_main_print2,(%esp)
	movl $10,4(%esp)
	call myprintf

	movl $msg_main_print3,(%esp)
	movl $10,4(%esp)
	movb $'A',8(%esp)
	call myprintf

	movl $msg_main_print4,(%esp)
	movb $'A',4(%esp)
	movl $10,8(%esp)
	call myprintf

	movl $2,(%esp)
	movl $10,4(%esp)
	movl $20,8(%esp)
	call addition

	movl $msg_main_print5,(%esp)
	movl %eax,4(%esp)
	call myprintf

	movl $3,(%esp)
	movl $10,4(%esp)
	movl $20,8(%esp)
	movl $30,12(%esp)
	call addition

	movl $msg_main_print5,(%esp)
	movl %eax,4(%esp)
	call myprintf

	movl $4,(%esp)
	movl $10,4(%esp)
	movl $20,8(%esp)
	movl $30,12(%esp)
	movl $40,16(%esp)
	call addition

	movl $msg_main_print5,(%esp)
	movl %eax,4(%esp)
	call myprintf

	movl $0,(%esp)
	call exit

.globl myprintf
.type myprintf, @function
myprintf:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$16,%esp

	movl	$0,-8(%ebp)	#va_list pArg = NULL; // char *

	leal	12(%ebp),%ebx

	movl	%ebx,-8(%ebp)

	movl	8(%ebp),%eax

	movl	%eax,(%esp)
	movl	%ebx,4(%esp)
	call	vprintf

	movl	$0,-8(%ebp)

	movl	%eax,-4(%ebp)

	movl	%ebp,%esp
	popl	%ebp
	ret

.globl addition
.type addition, @function
addition:
	pushl	%ebp
	movl	%esp,%ebp

	subl	$16,%esp

	movl	$0,-12(%ebp)	#va_list pArg = NULL; // char *

	leal	12(%ebp),%ebx

	movl	%ebx,-12(%ebp) #va_start(pArg, iTotalParam);

	movl	$0,-4(%ebp)	#icounter
	movl	$0,-8(%ebp)
	movl	$4,%ecx
	jmp		lable_for_cond

lable_for_body:
	mull	%ecx	
	addl	%ebx,%eax
	movl	-8(%ebp),%edx
	addl	(%eax),%edx
	movl	%edx,-8(%ebp)

	addl	$1,-4(%ebp)

lable_for_cond:
	movl	-4(%ebp),%eax #icounter
	movl	8(%ebp),%edx  #itotlparam
	cmpl	%edx,%eax
	jl		lable_for_body


	movl	$0,-12(%ebp)

	movl	-8(%ebp),%eax
	movl	%ebp,%esp
	popl	%ebp
	ret
