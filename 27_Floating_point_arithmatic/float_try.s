.section .rodata
	msg_main_print1:
	.string "Enter two floating point numbers :: "

	msg_main_scan:
	.string "%f%f"

	msg_main_print2:
	.string "fNo1 is less than fNo2"

	msg_main_print3:
	.string "fNo1 is greater than fNo2"

	msg_main_print4:
	.string "Equal"

.section .text 
.globl main
.type main,@function

main:
	andl	$-16,%esp
	pushl	%ebp
	movl	%esp,%ebp

	subl	$32,%esp

	movl	$msg_main_print1,(%esp)
	call 	printf

	leal	-4(%ebp),%eax
	leal	-8(%ebp),%edx

	movl	$msg_main_scan,(%esp)
	movl	%eax,4(%esp)
	movl	%edx,8(%esp)
	call	scanf

	movl	-4(%ebp),%eax
	movl	-8(%ebp),%edx

	movl	%eax,(%esp)
	movl	%edx,4(%esp)
	call	compare

	movl	%eax,-12(%ebp)

	cmpl	$-1,%eax
	jne		lable_cmp_1
	movl	$msg_main_print2,(%esp)
	call	puts
	jmp		lable_exit

lable_cmp_1:
	cmpl	$1,%eax
	jne		lable_else
	movl	$msg_main_print3,(%esp)
	call	puts
	jmp		lable_exit

lable_else:
	movl	$msg_main_print4,(%esp)
	call	puts

lable_exit:
	movl	$0,(%esp)
	call	exit

.globl	compare
.type 	compare,@function
compare:
	pushl	%ebp
	movl	%esp,%ebp

	flds	12(%ebp)	#fNo2 - 
	flds	8(%ebp)		

	#compares st(0) with st(1) 
	#and store status in fpu status register
	fcomip		

	#retrives status register from fpu to AX
	#fstsw

	#loads eflags from AH
	#sahf

	jb		lable_less
	ja		lable_greater
	movl	$0,%eax
	jmp		lable_ret

lable_less:
	movl	$-1,%eax
	jmp		lable_ret

lable_greater:
	movl	$1,%eax
	
lable_ret:
	movl	%ebp,%esp
	popl	%ebp
	ret

