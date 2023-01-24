.section .rodata
	msg_main_print1:
	.string "Enter value of row and column:\t"
	
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

	msg_main_print_error:
	.string "Memory allocation FAILED\n"

.section .text
.type main,@function
.globl main

main:
	pushl	%ebp
	movl	%esp,%ebp

	#irow,icol,icounter1,icounter2,ppPtr
	subl	$20,%esp

	movl	$0,-20(%ebp)

	pushl	$msg_main_print1
	call	printf
	addl	$4,%esp

	leal	-8(%ebp),%eax 	#icol
	leal	-4(%ebp),%edx	#irow

	pushl	%eax
	pushl	%edx
	pushl	$msg_main_scan2
	call	scanf
	addl	$12,%esp

	movl	-4(%ebp),%eax
	movl	$4,%ecx
	mull	%ecx	#eax = irow *4

	pushl	%eax
	call	malloc
	addl	$4,%esp

	movl	%eax,-20(%ebp)	#ppPtr = malloc ne dilela addr

	cmpl	$0,%eax
	je		lable_error

	movl	$0,-12(%ebp)	#icounter1
	jmp		lable_for1_condition

lable_for1_st:
	movl	-8(%ebp),%ecx	#icol
	movl	$4,%eax
	mull	%ecx	#eax = icol*4

	pushl	%eax
	call	malloc
	addl	$4,%esp

	movl	-12(%ebp),%ecx #iCounter1
	movl	-20(%ebp),%ebx

	movl	%eax,(%ebx,%ecx,4)	#pptr[icounter1] = malloc()

	#movl	(%ebx,%ecx,4),%ebx

	cmpl	$0,%eax
	je		lable_error

	movl	 $0,-16(%ebp)	#icounter2
	jmp		 lable_for2_condition

lable_for2_st:
	movl	-12(%ebp),%edx	#icounter1

	pushl	%eax
	pushl	%edx
	pushl	$msg_main_print2
	call	printf
	addl	$12,%esp

	movl	-20(%ebp),%ebx	#ppPtr
	movl	-12(%ebp),%eax	#icounter1
	
	movl	(%ebx,%eax,4),%ebx

	movl	-16(%ebp),%eax	#icounter2

	leal	(%ebx,%eax,4),%ebx

	pushl	%ebx
	pushl	$msg_main_scan1
	call	scanf
	addl	$8,%esp

	addl	$1,-16(%ebp)	#icounter2++

lable_for2_condition:
	movl	-16(%ebp),%eax	#icounter2
	movl	-8(%ebp),%edx	#icol

	cmpl	%edx,%eax
	jl		lable_for2_st

	addl	$1,-12(%ebp)	#icounter1++

lable_for1_condition:
	movl	-12(%ebp),%eax	#icounter1
	movl	-4(%ebp),%edx	#irow

	cmpl	%edx,%eax
	jl		lable_for1_st

	#main continues

	pushl	$msg_main_print3
	call	printf
	addl	$4,%esp

	movl	$0,-12(%ebp)	#icounter1
	jmp		lable_for3_condition

lable_for3_st:
	movl	$0,-16(%ebp)	#icounter2=0
	jmp		lable_for4_condition

lable_for4_st:
	movl	-12(%ebp),%edx	#icounter1

	movl	-20(%ebp),%ebx

	movl	(%ebx,%edx,4),%ebx

	movl	(%ebx,%eax,4),%ecx

	movl	-12(%ebp),%edx

	pushl	%ecx	#value
	pushl	%eax	#icounter2
	pushl	%edx	#icounter1
	pushl	$msg_main_print4
	call	printf
	addl	$16,%esp

	addl	$1,-16(%ebp)	#icounter2++

lable_for4_condition:
	movl	-16(%ebp),%eax	#icounter2
	movl	-8(%ebp),%edx	#icol

	cmpl	%edx,%eax
	jl		lable_for4_st

	addl	$1,-12(%ebp)	#icounter1++

lable_for3_condition:
	movl	-12(%ebp),%eax	#icounter1
	movl	-4(%ebp),%edx	#irow

	cmpl	%edx,%eax
	jl		lable_for3_st

	#main countinues...
	movl	$0,-12(%ebp)
	jmp		lable_for5_condition

lable_for5_st:
	movl	-20(%ebp),%ebx

	movl	(%ebx,%eax,4),%ebx

	pushl	%ebx
	call	free
	addl	$4,%esp

	movl	-20(%ebp),%ebx
	movl	-12(%ebp),%eax	#icounter1
	movl	$0,(%ebx,%eax,4)	#ppPtr[icounter1] =NULL

	addl	$1,-12(%ebp)	#icounter1++

lable_for5_condition:
	movl	-12(%ebp),%eax	#icounter1
	movl	-4(%ebp),%edx	#irow

	cmpl	%edx,%eax
	jl		lable_for5_st

	#main_continues
	movl	-20(%ebp),%ebx

	pushl	%ebx
	call	free
	addl	$4,%esp

	movl 	$0,-20(%ebp)

	pushl	$0
	call	exit


lable_error:
	pushl	$msg_main_print_error
	call	puts
	addl	$4,%esp
	
	pushl	$-1
	call	exit

