.section .rodata
	msg_main_print1:
	.string "Enter 3 Numbers :"

	msg_main_scan:
	.string "%d%d%d"

	msg_main_print2:
	.string "iNo1=%d\tiNo2=%d\tiNo3=%d\tiAns=%d\n"


.section .text
.type main,@function
.globl main

#Evaluation --> iNo1 && iNo2++ || iNo3++

main:
	pushl %ebp
	movl %esp,%ebp

	subl $16 ,%esp

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

	movl -4(%ebp),%eax
		
	#logical operator && 
	#1st operand 0 asel tr to 2nd evaluate karnar nahi  
	cmpl $0,%eax
	je lable_zero_and

	movl -8(%ebp),%eax
	addl $1,-8(%ebp)
	cmpl $0,%eax
	je	lable_zero_and

	movl $1,%eax
	jmp lable_ans

lable_zero_and:

	movl -12(%ebp),%eax
	addl $1,-12(%ebp)
	cmpl $0,%eax
	je lable_ans

	movl $1,%eax

lable_ans:
	movl %eax,-16(%ebp)	#iAns

	movl -12(%ebp),%edx
	movl -8(%ebp),%ecx
	movl -4(%ebp),%ebx

	pushl	%eax
	pushl	%edx
	pushl 	%ecx
	pushl	%ebx
	pushl	$msg_main_print2
	call	printf
	addl $20,%esp

	pushl $0
	call exit


