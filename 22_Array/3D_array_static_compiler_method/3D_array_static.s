.equ	MAX1,5
.equ	MAX2,50

.section .rodata
	msg_main_print1:
	.string "Enter value of planes, rows & columns(< %d, %d, %d):\t"

	msg_main_scan3:
	.string	"%d%d%d"

	msg_main_print2:
	.string "Enter [%d] [%d] [%d] value:\t"

	msg_main_scan1:
	.string "%d"

	msg_main_print3:
	.string "Entered elements are:\n"

	msg_main_print4:
	.string	"[%d][%d][%d] value is:\t%d\n"

.section .text
.type main,@function
.globl main

main:
	andl	$-16,%esp
	pushl	%ebp
	movl	%esp,%ebp

	#no of local variable = 7 size = 50024
	#highest no of parameter = 5 size = 20
	#total = 50044
	#50044/16 = 3127.5 ~ 3128
	#3128*16 = 50048 = size with alignment

	subl	$50048,%esp

	movl	$msg_main_print1,(%esp)
	movl	$MAX1,4(%esp)
	movl	$MAX2,8(%esp)
	movl	$MAX2,12(%esp)
	call	printf

	leal	-4(%ebp),%eax	#iPlanes
	leal	-8(%ebp),%edx	#irows
	leal	-12(%ebp),%ebx	#icoulmn

	movl	$msg_main_scan3,(%esp)
	movl	%eax,4(%esp)
	movl	%edx,8(%esp)
	movl	%ebx,12(%esp)
	call	scanf

	movl	$0,-16(%ebp)	#icounter1
	jmp		lable_for1_cond

lable_for1_st:

	movl	$0,-20(%ebp)	#icounter2
	jmp		lable_for2_cond

lable_for2_st:

	movl	$0,-24(%ebp)	#icounter3
	jmp		lable_for3_cond

lable_for3_st:

	movl	-16(%ebp),%edx	#icounter1
	movl	-20(%ebp),%ecx	#icounter2

	#movl	$msg_tmp,(%esp)
	#call 	printf

	movl	$msg_main_print2,(%esp)
	movl	%edx,4(%esp)	#iCounter1
	movl	%ecx,8(%esp)	#iCounter2
	movl	%eax,12(%esp)	#iCounter3
	call	printf

	#step1 : reach to the 2d array by manual calculation
	#1.1 -> baseaddr+icounter1*(icol *4 *irow)
	movl	-8(%ebp),%eax	#irow
	movl	-12(%ebp),%edx	#icolumns

	mull	%edx	#%eax =irow*icol

	movl	$4,%edx
	mull	%edx 	#%eax = =irow*icol*4

	movl	-16(%ebp),%edx	#icounter1
	mull	%edx 	#%eax = icounter1 *(irow*icol*4)	

	leal	-50024(%ebp),%ebx
	addl	%eax,%ebx	#%ebx = baseddr+icounter1 *(irow*icol*4)

	#step2 : reach to the 1d array by manual calculation
	#2.1 ->	output_of_step1(addr)+icounter2*(icol *4)
	movl	$4,%eax
	movl	-12(%ebp),%edx	#icol

	mull	%edx	#%eax = icol * 4

	movl	-20(%ebp),%edx	#icounter2

	mull	%edx	#eax = icounter2 * icol * 4

	addl	%eax,%ebx	#output_of_step1(addr)+icounter2*(icol *4) 

	#step3 : reach to the actual element by index addr mode
	#3.1 -> (output_of_step2(addr),icounter3,4)
	movl	-24(%ebp),%eax	#icounter3
	leal	(%ebx,%eax,4),%ebx

	movl	$msg_main_scan1,(%esp)
	movl	%ebx,4(%esp)
	call 	scanf

	addl	$1,-24(%ebp)

lable_for3_cond:
	movl	-24(%ebp),%eax	#icounter3
	movl	-12(%ebp),%edx	#icolumns
	
	cmpl	%edx,%eax

	jl		lable_for3_st	

	addl	$1,-20(%ebp)

lable_for2_cond:
	movl	-20(%ebp),%eax	#icounter2
	movl	-8(%ebp),%edx	#irows

	cmpl	%edx,%eax

	jl		lable_for2_st

	addl	$1,-16(%ebp)

lable_for1_cond:
	movl	-16(%ebp),%eax	#icounter1
	movl	-4(%ebp),%edx	#iplanes

	cmpl	%edx,%eax

	jl		lable_for1_st

	#main continues ...
	movl	$msg_main_print3,(%esp)
	call 	printf

	movl	$0,-16(%ebp)	#icounter1
	jmp		lable_for4_cond

lable_for4_st:
	movl	$0,-20(%ebp)	#icounter2
	jmp		lable_for5_cond

lable_for5_st:
	movl	$0,-24(%ebp)	#icounter3
	jmp		lable_for6_cond

lable_for6_st:

	#step1 : reach to the 2d array by manual calculation
	#1.1 -> baseaddr+icounter1*(icol *4 *irow)
	movl	-8(%ebp),%eax	#irow
	movl	-12(%ebp),%edx	#icolumns

	mull	%edx	#%eax =irow*icol

	movl	$4,%edx
	mull	%edx 	#%eax = =irow*icol*4

	movl	-16(%ebp),%edx	#icounter1
	mull	%edx 	#%eax = icounter1 *(irow*icol*4)	

	leal	-50024(%ebp),%ebx
	addl	%eax,%ebx	#%ebx = baseddr+icounter1 *(irow*icol*4)

	#step2 : reach to the 1d array by manual calculation
	#2.1 ->	output_of_step1(addr)+icounter2*(icol *4)
	movl	$4,%eax
	movl	-12(%ebp),%edx	#icol

	mull	%edx	#%eax = icol * 4

	movl	-20(%ebp),%edx	#icounter2

	mull	%edx	#eax = icounter2 * icol * 4

	addl	%eax,%ebx	#output_of_step1(addr)+icounter2*(icol *4) 

	#step3 : reach to the actual element by index addr mode
	#3.1 -> (output_of_step2(addr),icounter3,4)
	movl	-16(%ebp),%edx	#icounter1
	movl	-20(%ebp),%ecx	#icounter2
	movl	-24(%ebp),%eax	#icounter3
	movl	(%ebx,%eax,4),%ebx #arr[icounter1][icounter2][icounter3]

	movl	$msg_main_print4,(%esp)
	movl	%edx,4(%esp)
	movl	%ecx,8(%esp)
	movl	%eax,12(%esp)
	movl	%ebx,16(%esp)
	call 	printf


	addl	$1,-24(%ebp)

lable_for6_cond:
	movl	-24(%ebp),%eax	#icounter3
	movl	-12(%ebp),%edx	#icolumns
	
	cmpl	%edx,%eax

	jl		lable_for6_st	

	addl	$1,-20(%ebp)

lable_for5_cond:
	movl	-20(%ebp),%eax	#icounter2
	movl	-8(%ebp),%edx	#irows

	cmpl	%edx,%eax

	jl		lable_for5_st

	addl	$1,-16(%ebp)

lable_for4_cond:
	movl	-16(%ebp),%eax	#icounter1
	movl	-4(%ebp),%edx	#iplanes

	cmpl	%edx,%eax

	jl		lable_for4_st


	movl	$0,(%esp)
	call 	exit


