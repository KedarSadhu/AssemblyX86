.section .rodata
	msg_main_display :
	.string "1.Addition\n2.subtraction\n3.Multiplication\n4.Division\n"

	msg_main_choice :
	.string "Enter choice : "

	msg_main_scan :
	.string "%d"

	msg_disp_addition :
	.string "\nAddition\n"

	msg_disp_subtraction :
	.string "\nSubtraction\n"

	msg_disp_multiplication :
	.string "\nMultiplication\n"

	msg_disp_division :
	.string "\nDivision\n"

	msg_disp_invalid:
	.string "\nInvalid choice\n"


.section .text
.globl main
.type main,@function

main:
	pushl %ebp
	movl %esp,%ebp

	subl $4,%esp

	pushl $msg_main_display
	call printf
	addl $4,%esp

	pushl $msg_main_choice
	call printf 
	addl $4,%esp

	leal -4(%ebp),%eax

	pushl %eax
	pushl $msg_main_scan
	call scanf
	addl $8,%esp

	movl -4(%ebp),%eax
	
	cmpl $1,%eax
	jne  lable_ch2
	pushl $msg_disp_addition
	call printf
	addl $4,%esp
	jmp lable_exit

lable_ch2:
	cmpl $2,%eax
	jne  lable_ch3
	pushl $msg_disp_subtraction
	call printf
	addl $4,%esp
	jmp lable_exit	

lable_ch3:
	cmpl $3,%eax
	jne  lable_ch4
	pushl $msg_disp_multiplication
	call printf
	addl $4,%esp
	jmp lable_exit	

lable_ch4:
	cmpl $4,%eax
	jne  lable_ch_invalid
	pushl $msg_disp_division
	call printf
	addl $4,%esp
	jmp lable_exit	

lable_ch_invalid:
	pushl $msg_disp_invalid
	call printf
	addl $4,%esp

lable_exit:
	pushl $0
	call exit
