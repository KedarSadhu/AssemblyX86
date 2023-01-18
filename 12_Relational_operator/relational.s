.section .rodata
	msg_main_print1 :
	.string "Enter three numbers ::: "

	msg_main_print2 :
	.string "Answer is :: %d\n"

	msg_main_scan :
	.string "%d%d%d"

.section .text
.globl main
.type main,@function

main:
	pushl %ebp
	movl %esp,%ebp

	subl $16,%esp

	pushl $msg_main_print1
	call printf
	addl $4,%esp

	leal -4(%ebp),%eax
	leal -8(%ebp),%edx
	leal -12(%ebp),%ecx

	pushl %ecx
	pushl %edx
	pushl %eax
	pushl $msg_main_scan
	call scanf
	addl $16,%esp

	movl -4(%ebp),%eax	#iNo1 
	movl -8(%ebp),%edx	#iNo2

	cmpl %edx,%eax	#iNo1<iNo2
	jl lable_less_than_true
	movl $0,%eax
	jmp lable_not_equal_check

lable_less_than_true :
	movl $1,%eax

lable_not_equal_check:
	movl -12(%ebp),%edx #iNo3
	cmpl %edx,%eax	#X != iNo3
	jne	 lable_not_equal_true
	movl $0,%eax
	jmp lable_final_result

lable_not_equal_true:
	movl $1,%eax

lable_final_result:
	pushl %eax
	pushl $msg_main_print2
	call printf
	addl $8,%esp

	pushl $0
	call exit





