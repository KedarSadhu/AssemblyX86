.section .rodata
	msg_main_print1:
	.string "fNo1 = %f\tfNo2 = %f\n"

	msg_main_print2:
	.string "fAns1 = %f\n"
	
	msg_main_print3:
	.string "fAns2 = %f\n"

	msg_main_print4:
	.string "fAns3 = %f\n"

	literal5:
	.int 5

.section .data
	.globl	fNo1
	.type	fNo1,@object
	.size	fNo1,4
	fNo1:
	.float	10.22

	.globl	fNo2
	.type	fNo2,@object
	.size	fNo2,4
	fNo2:
	.float	20.22

.section .bss
	.comm	fAns1,4,4
	.comm	fAns2,4,4
	.comm	fAns3,4,4

.section .text
.type main,@function
.globl main

main:
	andl	$-16,%esp
	pushl	%ebp
	movl	%esp,%ebp

	subl	$32,%esp

	flds 	fNo2	#(st1)
	flds	fNo1	#(st0)
	movl	$msg_main_print1,(%esp)
	fstpl	4(%esp)
	fstpl	12(%esp)
	call	printf

	flds	fNo1 #st(0)
	flds	fNo2 #st(1) 	
	fsub	%st(1),%st(0)	#ino2 - ino1 
	fstps	fAns1

	flds	fNo2 #st(0)
	flds	fNo1 #st(1) 	
	fsub	%st(1),%st(0)	#ino1 - ino2 
	fstps	fAns2

	flds 	fNo1		#st(0)
	fisub	literal5
	fstps	fAns3	

	flds	fAns1
	movl	$msg_main_print2,(%esp)
	fstpl	4(%esp)
	call	printf	
	
	flds	fAns2
	movl	$msg_main_print3,(%esp)
	fstpl	4(%esp)
	call	printf

	flds	fAns3
	movl	$msg_main_print4,(%esp)
	fstpl	4(%esp)
	call	printf
	

	movl	$0,(%esp)
	call	exit
