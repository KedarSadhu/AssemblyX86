.section .rodata
	msg_main_print1:
	.string "arr = %-10d \t *arr = %-10d \t &arr = %-10d\n"
	
	msg_main_print2:
	.string "p = %-10d \t *p = %-10d \t **p = %-10d\n"
	
	msg_main_print3:
	.string "ptr = %-10d \t *ptr = %-10d \t **ptr = %-10d\n"
	
	msg_main_print4:
	.string "ptr - p = %d \t *ptr - arr = %d \t **ptr = %d\n"

.section .text
.type main,@function
.globl	main

main:
	andl	$-16,%esp
	pushl	%ebp
	movl	%esp,%ebp

	#local vars = 20+20+4 =44
	#highest no of param = 4 size =16
	#total = 60 60/16 =3.75 ~ 4
	#with alignment = 4*16 = 64

	subl	$64,%esp

	movl	$10,-20(%ebp)	#arr[0]
	movl	$20,-16(%ebp)	#arr[1]
	movl	$30,-12(%ebp)	#arr[2]
	movl	$40,-8(%ebp)	#arr[3]
	movl	$50,-4(%ebp)	#arr[4]

	movl	$0,%eax
	movl	$5,%ecx

loop_lable:
	leal	-20(%ebp,%eax,4),%ebx	
	movl	%ebx,-40(%ebp,%eax,4)
	addl	$1,%eax
	loop    loop_lable

	leal	-40(%ebp),%ebx	#p
	movl	%ebx,-44(%ebp)	#ptr = &p

	leal	-20(%ebp),%ebx	#arr,&arr
	movl	(%ebx),%eax		#*arr

	movl 	$msg_main_print1,(%esp)
	movl	%ebx,4(%esp)	#arr
	movl	%eax,8(%esp)	#*arr
	movl	%ebx,12(%esp)	#&arr
	call 	printf

	leal	-40(%ebp),%ebx	#p
	movl	(%ebx),%eax		#*p
	movl	(%eax),%edx		#**p

	movl 	$msg_main_print2,(%esp)
	movl	%ebx,4(%esp)	#p
	movl	%eax,8(%esp)	#*p
	movl	%edx,12(%esp)	#**p
	call 	printf

	movl	-44(%ebp),%ebx	#ptr
	movl	(%ebx),%eax		#*ptr
	movl	(%eax),%edx		#**ptr

	movl 	$msg_main_print3,(%esp)
	movl	%ebx,4(%esp)	#ptr
	movl	%eax,8(%esp)	#*ptr
	movl	%edx,12(%esp)	#**ptr
	call 	printf

	#*ptr++
	movl	-44(%ebp),%ebx	#ptr

	movl	$1,%eax
	movl	$4,%edx
	mull	%edx	#eax = 4

	addl	%eax,%ebx	#ptr+1*size
	
	movl	$msg_main_print4,(%esp)

	#ptr-p
	movl	%ebx,-44(%ebp)	#ptr++

	leal	-40(%ebp),%eax	#p

	subl	%eax,%ebx

	xorl	%edx,%edx
	movl	%ebx,%eax	#Numrator
	movl	$4,%ecx		#denominator

	divl	%ecx		#eax =quotient

	movl	%eax,4(%esp)

	#*ptr-arr

	movl	-44(%ebp),%ebx
	movl	(%ebx),%eax		#*ptr

	leal	-20(%ebp),%ebx	#arr

	subl	%ebx,%eax	#*ptr-arr = Numrator

	movl	$4,%ecx

	xorl	%edx,%edx
	divl	%ecx

	movl	%eax,8(%esp)

	#**ptr
	movl	-44(%ebp),%eax	#ptr
	movl	(%eax),%eax		#*ptr
	movl	(%eax),%eax		#**ptr

	movl	%eax,12(%esp)

	call	printf

	#*++ptr
	movl	-44(%ebp),%ebx	#ptr

	movl	$1,%eax
	movl	$4,%edx
	mull	%edx	#eax = 4

	addl	%eax,%ebx	#ptr+1*size
	
	movl	$msg_main_print4,(%esp)

	#ptr-p
	movl	%ebx,-44(%ebp)	#ptr++

	leal	-40(%ebp),%eax	#p

	subl	%eax,%ebx

	xorl	%edx,%edx
	movl	%ebx,%eax	#Numrator
	movl	$4,%ecx		#denominator

	divl	%ecx		#eax =quotient

	movl	%eax,4(%esp)

	#*ptr-arr

	movl	-44(%ebp),%ebx
	movl	(%ebx),%eax		#*ptr

	leal	-20(%ebp),%ebx	#arr

	subl	%ebx,%eax	#*ptr-arr = Numrator

	movl	$4,%ecx

	xorl	%edx,%edx
	divl	%ecx

	movl	%eax,8(%esp)

	#**ptr
	movl	-44(%ebp),%eax	#ptr
	movl	(%eax),%eax		#*ptr
	movl	(%eax),%eax		#**ptr

	movl	%eax,12(%esp)

	call	printf

	#++*ptr
	movl	-44(%ebp),%ebx	#ptr
	movl	(%ebx),%ebx		#*ptr

	movl	$1,%eax
	movl	$4,%edx
	mull	%edx	#eax = 4

	addl	%eax,%ebx

	movl	-44(%ebp),%eax	#ptr
	movl	%ebx,(%eax)

	movl	$msg_main_print4,(%esp)

	#ptr-p
	movl	-44(%ebp),%ebx	#ptr

	leal	-40(%ebp),%eax	#p

	subl	%eax,%ebx

	xorl	%edx,%edx
	movl	%ebx,%eax	#Numrator
	movl	$4,%ecx		#denominator

	divl	%ecx		#eax =quotient

	movl	%eax,4(%esp)

	#*ptr-arr

	movl	-44(%ebp),%ebx
	movl	(%ebx),%eax		#*ptr

	leal	-20(%ebp),%ebx	#arr

	subl	%ebx,%eax	#*ptr-arr = Numrator

	movl	$4,%ecx

	xorl	%edx,%edx
	divl	%ecx

	movl	%eax,8(%esp)

	#**ptr
	movl	-44(%ebp),%eax	#ptr
	movl	(%eax),%eax		#*ptr
	movl	(%eax),%eax		#**ptr

	movl	%eax,12(%esp)

	call	printf

	movl	$0,(%esp)
	call	exit
