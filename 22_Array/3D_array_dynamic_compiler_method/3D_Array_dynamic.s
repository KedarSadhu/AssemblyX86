.section .rodata
	msg_main_print1:
	.string "Enter value of planes, rows & columns:\t"

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

	msg_main_print_error:
	.string "Memory allocation FAILED\n"

.section .text
.type main,@function
.globl main

main:
	andl	$-16,%esp
	pushl	%ebp
	movl	%esp,%ebp

	#no of local variable = 7 size = 28
	#Highest no of parameter = 5 size = 20
	#total = 48 = alignment chi garaj nahi 

	subl	$48,%esp

	movl	$msg_main_print1,(%esp)
	call	printf

	leal	-4(%ebp),%eax	#iPlanes
	leal	-8(%ebp),%edx	#irows
	leal	-12(%ebp),%ebx	#icoulmn

	movl	$msg_main_scan3,(%esp)
	movl	%eax,4(%esp)
	movl	%edx,8(%esp)
	movl	%ebx,12(%esp)
	call	scanf

	movl	-4(%ebp),%eax	#iPlanes
	movl	$4,%ecx
	mull	%ecx	#eax = iPlanes *4

	movl	%eax,(%esp)
	call	malloc
	
	movl	%eax,-28(%ebp)	#pppPtr = malloc ne dilela addr

	cmpl	$0,%eax
	je		lable_error

	movl	$0,-16(%ebp)	#icounter1
	jmp		lable_for1_cond

lable_for1_st:
	movl	-8(%ebp),%eax	#iRows
	movl	$4,%ecx
	mull	%ecx	#eax = iRows *4

	movl	%eax,(%esp)
	call	malloc

	cmpl	$0,%eax
	je		lable_error

	movl	-16(%ebp),%ecx	#iCounter1
	movl	-28(%ebp),%ebx	#pppPtr
	movl	%eax,(%ebx,%ecx,4)	#pppPtr[iCounter1] = malloc()
	
	movl	$0,-20(%ebp)	#icounter2
	jmp		lable_for2_cond

lable_for2_st:
	movl	-12(%ebp),%eax	#icolumns
	movl	$4,%ecx
	mull	%ecx	#eax = icoulmns *4

	movl	%eax,(%esp)
	call	malloc

	cmpl	$0,%eax
	je		lable_error
	
	movl	-16(%ebp),%ecx	#iCounter1
	movl	-28(%ebp),%ebx	#pppPtr

	movl	(%ebx,%ecx,4),%ebx	#ebx = pppPtr[iCounter1]

	movl	-20(%ebp),%ecx	#iCounter2

	movl	%eax,(%ebx,%ecx,4)	#pppPtr[iCounter1][iCounter2] = malloc()

	movl	$0,-24(%ebp)	#icounter3
	jmp		lable_for3_cond

lable_for3_st:
	movl	-16(%ebp),%edx	#icounter1
	movl	-20(%ebp),%ecx	#icounter2

	movl	$msg_main_print2,(%esp)
	movl	%edx,4(%esp)	#iCounter1
	movl	%ecx,8(%esp)	#iCounter2
	movl	%eax,12(%esp)	#iCounter3
	call	printf

	movl	-28(%ebp),%ebx	#pppPtr
	movl	-16(%ebp),%eax	#icounter1

	movl	(%ebx,%eax,4),%ebx	#pppPtr[iCounter1]

	movl	-20(%ebp),%eax	#icounter2
	movl	(%ebx,%eax,4),%ebx	#pppPtr[iCounter1][iCounter2]

	movl	-24(%ebp),%eax	#icounter3
	leal	(%ebx,%eax,4),%ebx	#&pppPtr[iCounter1][iCounter2][iCounter3]	

	movl	$msg_main_scan1,(%esp)
	movl	%ebx,4(%esp)
	call	scanf

	addl	$1,-24(%ebp)	#iCounter3++


lable_for3_cond:
	movl	-24(%ebp),%eax	#icounter3
	movl	-12(%ebp),%edx	#icolumns
	
	cmpl	%edx,%eax

	jl		lable_for3_st	

	addl	$1,-20(%ebp)	#iCounter2++

lable_for2_cond:
	movl	-20(%ebp),%eax	#icounter2
	movl	-8(%ebp),%edx	#irows

	cmpl	%edx,%eax

	jl		lable_for2_st

	addl	$1,-16(%ebp)	#iCounter1++

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
	movl	-28(%ebp),%ebx	#pppPtr
	movl	-16(%ebp),%eax	#icounter1

	movl	(%ebx,%eax,4),%ebx	#pppPtr[iCounter1]

	movl	-20(%ebp),%eax	#icounter2
	movl	(%ebx,%eax,4),%ebx	#pppPtr[iCounter1][iCounter2]

	movl	-24(%ebp),%eax	#icounter3
	movl	(%ebx,%eax,4),%ebx	#pppPtr[iCounter1][iCounter2][iCounter3]	


	movl	-16(%ebp),%edx	#icounter1
	movl	-20(%ebp),%ecx	#icounter2

	movl	$msg_main_print4,(%esp)
	movl	%edx,4(%esp)	#icounter1
	movl	%ecx,8(%esp)	#icounter2
	movl	%eax,12(%esp)	#icounter3
	movl	%ebx,16(%esp)	#pppPtr[iCounter1][iCounter2][iCounter3]
	call 	printf

	addl	$1,-24(%ebp)	#iCounter3++

lable_for6_cond:
	movl	-24(%ebp),%eax	#icounter3
	movl	-12(%ebp),%edx	#icolumns
	
	cmpl	%edx,%eax

	jl		lable_for6_st	

	addl	$1,-20(%ebp)	#iCounter2++

lable_for5_cond:
	movl	-20(%ebp),%eax	#icounter2
	movl	-8(%ebp),%edx	#irows

	cmpl	%edx,%eax

	jl		lable_for5_st

	addl	$1,-16(%ebp)	#iCounter1++

lable_for4_cond:
	movl	-16(%ebp),%eax	#icounter1
	movl	-4(%ebp),%edx	#iplanes

	cmpl	%edx,%eax

	jl		lable_for4_st

	#main continues...
	movl	$0,-16(%ebp)	#icounter1
	jmp		lable_for7_cond

lable_for7_st:	
	movl	$0,-20(%ebp)	#icounter2
	jmp		lable_for8_cond

lable_for8_st:
	movl	-28(%ebp),%ebx	#pppPtr
	movl	-16(%ebp),%eax	#icounter1

	movl	(%ebx,%eax,4),%ebx	#pppPtr[iCounter1]

	movl	-20(%ebp),%eax	#icounter2
	movl	(%ebx,%eax,4),%ebx	#pppPtr[iCounter1][iCounter2]

	movl	%ebx,(%esp)
	call	free

	movl	-16(%ebp),%eax	#icounter1
	movl	-28(%ebp),%ebx	#pppPtr
	movl	(%ebx,%eax,4),%ebx	#pppPtr[iCounter1]
	
	movl	-20(%ebp),%eax	#icounter2
	movl	$0,(%ebx,%eax,4)	#pppPtr[iCounter1][iCounter2] = NULL
	

	addl	$1,-20(%ebp) #iCounter2++

lable_for8_cond:
	movl	-20(%ebp),%eax	#icounter2
	movl	-8(%ebp),%edx	#irows

	cmpl	%edx,%eax

	jl		lable_for8_st

	#for7 code 
	movl	-28(%ebp),%ebx	#pppPtr
	movl	-16(%ebp),%eax	#icounter1

	movl	(%ebx,%eax,4),%ebx	#pppPtr[iCounter1]

	movl	%ebx,(%esp)
	call	free

	movl	-16(%ebp),%eax	#icounter1
	movl	$0,(%ebx,%eax,4)	#pppPtr[iCounter1] = NULL

	addl	$1,-16(%ebp)	#iCounter1++

lable_for7_cond:
	movl	-16(%ebp),%eax	#icounter1
	movl	-4(%ebp),%edx	#iplanes

	cmpl	%edx,%eax

	jl		lable_for7_st

	#main continues ...

	movl	-28(%ebp),%ebx	#pppPtr

	movl	%ebx,(%esp)
	call	free

	movl	$0,-28(%ebp)	#pppPtr =NULL
	

	movl	$0,(%esp)
	call	exit

lable_error:
	movl	$msg_main_print_error,(%esp)
	call	puts

	movl	$-1,(%esp)
	call	exit
