.equ	MAX,50

.section .rodata
	msg_main_print1:
	.string "Enter value of row and column(<%d):\t"

	msg_main_print2:
	.string "Enter[%d][%d] value:\t"

	msg_main_print3:
	.string "Entered elements are :\n"

	msg_main_print4:
	.string "[%d][%d] value is :\t%d\n"

	msg_main_scan1:
	.string "%d"

	msg_main_scan2:
	.string "%d%d"

.section .text
.globl main 
.type main,@function

main:
	pushl	%ebp
	movl	%esp,%ebp

	#iRows,iCoulmns,iCounter1,iCounter2,arr[MAX][MAX]
	subl 	$10016,%esp 

	pushl	$MAX
	pushl	$msg_main_print1
	call	printf
	addl	$8,%esp

	leal	-8(%ebp),%eax	#iCoulmns
	leal	-4(%ebp),%edx	#iRows

	pushl	%eax
	pushl	%edx
	pushl	$msg_main_scan2
	call	scanf
	addl	$12,%esp
	
	movl	$0,-12(%ebp) #iCounter1
	jmp		lable_for1_condition

lable_for1_st:
	movl	$0,-16(%ebp)	#iCounter2
	jmp		lable_for2_condition

lable_for2_st:
	movl	-12(%ebp),%edx	#icounter1

	pushl	%eax	#icounter2
	pushl	%edx
	pushl	$msg_main_print2
	call	printf
	addl	$12,%esp

#START : Calculation for reaching 1D array
	
	#calculate size = iColumn * 4
	movl	-8(%ebp),%eax	#iCoulmns
	movl	$4,%edx

	mull	%edx	#%eax = size

	#iCounter1 * size
	movl	-12(%ebp),%edx	#icounter1
	mull	%edx	#%eax = iCounter1 * size

	leal	-10016(%ebp),%ebx

	#base_Address+index*size
	addl	%eax,%ebx	#%ebx+icounter1*size
	
	#END

	#START : Accessing the actual element
	movl	-16(%ebp),%eax
	leal	(%ebx,%eax,4),%ebx

	pushl	%ebx
	pushl	$msg_main_scan1
	call 	scanf
	addl	$8,%esp
	
	addl	$1,-16(%ebp)	#iCounter2++

lable_for2_condition:
	movl	-16(%ebp),%eax	#icounter2
	movl	-8(%ebp),%edx	#icolumns

	cmpl	%edx,%eax

	jl		lable_for2_st

	addl	$1,-12(%ebp)	#iCounter1++

lable_for1_condition:
	movl	-12(%ebp),%eax	#icounter1
	movl	-4(%ebp),%edx	#irows

	cmpl	%edx,%eax
	jl		lable_for1_st

	#Main continues...

	pushl	$msg_main_print3
	call 	printf
	addl	$4,%esp

	movl	$0,-12(%ebp) #iCounter1
	jmp		lable_for3_condition


lable_for3_st:
	movl	$0,-16(%ebp)
	jmp		lable_for4_condition

lable_for4_st:
	#START : Calculation for reaching 1D array
	
	#calculate size = iColumn * 4
	movl	-8(%ebp),%eax	#iCoulmns
	movl	$4,%edx

	mull	%edx	#%eax = size

	#iCounter1 * size
	movl	-12(%ebp),%edx	#icounter1
	mull	%edx	#%eax = iCounter1 * size

	leal	-10016(%ebp),%ebx

	#base_Address+index*size
	addl	%eax,%ebx	#%ebx+icounter1*size
	
	#END
	movl	-12(%ebp),%edx	#icounter1
	
	#START : Accessing the actual element
	movl	-16(%ebp),%eax	#iCounter2
	movl	(%ebx,%eax,4),%ecx	#arr[iCounter1][iCounter2]

	pushl	%ecx	#arr[iCounter1][iCounter2]
	pushl	%eax	#iCounter2
	pushl	%edx	#iCounter1
	pushl	$msg_main_print4
	call 	printf
	addl	$16,%esp

	addl	$1,-16(%ebp)	#iCounter2++

lable_for4_condition:
	movl	-16(%ebp),%eax	#icounter2
	movl	-8(%ebp),%edx	#icolumns

	cmpl	%edx,%eax

	jl		lable_for4_st

	addl	$1,-12(%ebp)	#iCounter1++

lable_for3_condition:
	movl	-12(%ebp),%eax	#icounter1
	movl	-4(%ebp),%edx	#irows

	cmpl	%edx,%eax
	jl		lable_for3_st

	pushl	$0
	call 	exit
