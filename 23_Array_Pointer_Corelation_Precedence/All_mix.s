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

	movl	$10,-44(%ebp)	#arr[0]
	movl	$20,-40(%ebp)	#arr[1]
	movl	$30,-36(%ebp)	#arr[2]
	movl	$40,-32(%ebp)	#arr[3]
	movl	$50,-28(%ebp)	#arr[4]

	leal	-44(%ebp),%ebx
	movl	%ebx,-24(%ebp)	#p[0]

	movl	$1,%eax
	movl	$4,%edx
	mull	%edx	#eax = 4

	addl	%ebx,%eax	#arr+1*size

	movl	%eax,-20(%ebp)	#p[1]

	movl	$2,%eax
	movl	$4,%edx
	mull	%edx	#eax = 8

	addl	%ebx,%eax	#arr+2*size

	movl	%eax,-16(%ebp)	#p[2]

	movl	$3,%eax
	movl	$4,%edx
	mull	%edx	#eax = 12

	addl	%ebx,%eax	#arr+3*size

	movl	%eax,-12(%ebp)	#p[3]

	movl	$4,%eax
	movl	$4,%edx
	mull	%edx	#eax = 16

	addl	%ebx,%eax	#arr+4*size

	movl	%eax,-8(%ebp)	#p[4]

	leal	-24(%ebp),%ebx
	movl	%ebx,-4(%ebp)	#ptr = &p


	leal	-44(%ebp),%ebx	#arr,&arr
	movl	(%ebx),%eax		#*arr

	movl 	$msg_main_print1,(%esp)
	movl	%ebx,4(%esp)	#arr
	movl	%eax,8(%esp)	#*arr
	movl	%ebx,12(%esp)	#&arr
	call 	printf

	leal	-24(%ebp),%ebx	#p
	movl	(%ebx),%eax		#*p
	movl	(%eax),%edx		#**p

	movl 	$msg_main_print2,(%esp)
	movl	%ebx,4(%esp)	#p
	movl	%eax,8(%esp)	#*p
	movl	%edx,12(%esp)	#**p
	call 	printf

	movl	-4(%ebp),%ebx	#ptr
	movl	(%ebx),%eax		#*ptr
	movl	(%eax),%edx		#**ptr

	movl 	$msg_main_print3,(%esp)
	movl	%ebx,4(%esp)	#ptr
	movl	%eax,8(%esp)	#*ptr
	movl	%edx,12(%esp)	#**ptr
	call 	printf

	#*ptr++
	movl	-4(%ebp),%ebx	#ptr

	movl	$1,%eax
	movl	$4,%edx
	mull	%edx	#eax = 4

	addl	%eax,%ebx	#ptr+1*size
	
	movl	$msg_main_print4,(%esp)

	#ptr-p
	movl	%ebx,-4(%ebp)	#ptr++

	leal	-24(%ebp),%eax	#p

	subl	%eax,%ebx

	xorl	%edx,%edx
	movl	%ebx,%eax	#Numrator
	movl	$4,%ecx		#denominator

	divl	%ecx		#eax =quotient

	movl	%eax,4(%esp)

	#*ptr-arr

	movl	-4(%ebp),%ebx
	movl	(%ebx),%eax		#*ptr

	leal	-44(%ebp),%ebx	#arr

	subl	%ebx,%eax	#*ptr-arr = Numrator

	movl	$4,%ecx

	xorl	%edx,%edx
	divl	%ecx

	movl	%eax,8(%esp)

	#**ptr
	movl	-4(%ebp),%eax	#ptr
	movl	(%eax),%eax		#*ptr
	movl	(%eax),%eax		#**ptr

	movl	%eax,12(%esp)

	call	printf

	#*++ptr
	movl	-4(%ebp),%ebx	#ptr

	movl	$1,%eax
	movl	$4,%edx
	mull	%edx	#eax = 4

	addl	%eax,%ebx	#ptr+1*size
	
	movl	$msg_main_print4,(%esp)

	#ptr-p
	movl	%ebx,-4(%ebp)	#ptr++

	leal	-24(%ebp),%eax	#p

	subl	%eax,%ebx

	xorl	%edx,%edx
	movl	%ebx,%eax	#Numrator
	movl	$4,%ecx		#denominator

	divl	%ecx		#eax =quotient

	movl	%eax,4(%esp)

	#*ptr-arr

	movl	-4(%ebp),%ebx
	movl	(%ebx),%eax		#*ptr

	leal	-44(%ebp),%ebx	#arr

	subl	%ebx,%eax	#*ptr-arr = Numrator

	movl	$4,%ecx

	xorl	%edx,%edx
	divl	%ecx

	movl	%eax,8(%esp)

	#**ptr
	movl	-4(%ebp),%eax	#ptr
	movl	(%eax),%eax		#*ptr
	movl	(%eax),%eax		#**ptr

	movl	%eax,12(%esp)

	call	printf

	#++*ptr
	movl	-4(%ebp),%ebx	#ptr
	movl	(%ebx),%ebx		#*ptr

	movl	$1,%eax
	movl	$4,%edx
	mull	%edx	#eax = 4

	addl	%eax,%ebx

	movl	-4(%ebp),%eax	#ptr
	movl	%ebx,(%eax)

	movl	$msg_main_print4,(%esp)

	#ptr-p
	movl	-4(%ebp),%ebx	#ptr

	leal	-24(%ebp),%eax	#p

	subl	%eax,%ebx

	xorl	%edx,%edx
	movl	%ebx,%eax	#Numrator
	movl	$4,%ecx		#denominator

	divl	%ecx		#eax =quotient

	movl	%eax,4(%esp)

	#*ptr-arr

	movl	-4(%ebp),%ebx
	movl	(%ebx),%eax		#*ptr

	leal	-44(%ebp),%ebx	#arr

	subl	%ebx,%eax	#*ptr-arr = Numrator

	movl	$4,%ecx

	xorl	%edx,%edx
	divl	%ecx

	movl	%eax,8(%esp)

	#**ptr
	movl	-4(%ebp),%eax	#ptr
	movl	(%eax),%eax		#*ptr
	movl	(%eax),%eax		#**ptr

	movl	%eax,12(%esp)

	call	printf

	movl	$0,(%esp)
	call	exit


