.section .rodata
	msg_main_print1:
	.string "Answer is :: %f\n"

	l1:
	.float 43.65

	l2:
	.int 22

	l3:
	.float 76.34

	l4:
	.float 3.1

	l5:
	.float 12.45

	l6:
	.int 6

	l7:
	.float 140.2

	l8:
	.float 94.21

#((l1     /l2) + (l3	* l4))
#((43.65 / 22) + (76.34 * 3.1)) / 
#((12.45 * 6) - (140.2 / 94.21))

.section .text
.type main,@function
.globl main

main:
	andl	$-16,%esp
	pushl	%ebp
	movl	%esp,%ebp

	subl	$32,%esp

	flds	l1	#st0
	fidiv	l2	#st(0) = 43.65/22

	flds 	l3	#(st1)
	flds	l4	#(st0)
	fmulp	%st(0),%st(1)	#st(1) = 76.34 * 3.1

	fadd	%st(1),%st(0)	#st(0) = ((43.65 / 22) + (76.34 * 3.1)) 

	flds	l5	#st(0)
	fimul	l6	#st(0) = (12.45 * 6)

	flds	l8	#st(1)
	flds	l7  #st(0)
	fdivp	%st(0),%st(1)	#st0 = 140.2 / 94.21

	fsubr	%st(1),%st(0)

	fxch	%st(2)

	fdivp	%st(0),%st(1)

	movl	$msg_main_print1,(%esp)
	fstpl	4(%esp)
	call	printf	

	movl	$0,(%esp)
	call	exit
