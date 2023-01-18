.section .rodata
	main_msg_print1:
	.string "Enter two numbers : "

	main_msg_scan:
	.string "%d%d"

	main_msg_print2:
	.string "\nAddition is : %d\n"

	main_msg_print3:
	.string "\nSubtraction is : %d\n"

	main_msg_print4:
	.string "\nMultiplication is : %d\n"

	main_msg_print5:
	.string "\nDivision is : %d\n"

.section .text
.globl main
.type main,@function

main :
	pushl %ebp
	movl %esp,%ebp

	subl $12,%esp

	pushl $main_msg_print1
	call printf
	addl $4,%esp

	leal -4(%ebp),%eax
	leal -8(%ebp),%edx

	pushl %edx
	pushl %eax
	pushl $main_msg_scan
	call scanf
	addl $12,%esp

	movl -4(%ebp),%eax
	movl -8(%ebp),%edx

	pushl %edx
	pushl %eax
	call myadd
	addl $8,%esp
	movl %eax,-12(%ebp)

	pushl %eax
	pushl $main_msg_print2
	call printf
	addl $8,%esp

	movl -4(%ebp),%eax
	movl -8(%ebp),%edx

	pushl %edx
	pushl %eax
	call mysub
	addl $8,%esp
	movl %eax,-12(%ebp)

	pushl %eax
	pushl $main_msg_print3
	call printf
	addl $8,%esp

	movl -4(%ebp),%eax
	movl -8(%ebp),%edx

	pushl %edx
	pushl %eax
	call mymult
	addl $8,%esp
	movl %eax,-12(%ebp)

	pushl %eax
	pushl $main_msg_print4
	call printf
	addl $8,%esp

	movl -4(%ebp),%eax
	movl -8(%ebp),%edx

	pushl %edx
	pushl %eax
	call mydiv
	addl $8,%esp
	movl %eax,-12(%ebp)

	pushl %eax
	pushl $main_msg_print5
	call printf
	addl $8,%esp

	pushl $0
	call exit

.globl myadd
.type myadd,@function

myadd:
	pushl %ebp
	movl %esp,%ebp

	movl 8(%ebp),%eax
	movl 12(%ebp),%edx

	addl %edx,%eax

	movl %ebp,%esp
	popl %ebp

	ret


.globl mysub
.type mysub,@function

mysub:
	pushl %ebp
	movl %esp,%ebp

	movl 8(%ebp),%edx
	movl 12(%ebp),%eax

	subl %eax,%edx

	movl %ebp,%esp
	popl %ebp

	ret

.globl mymult
.type mymult,@function

mymult:
	pushl %ebp
	movl %esp,%ebp

	movl 8(%ebp),%eax
	movl 12(%ebp),%edx

	mul %edx

	movl %ebp,%esp
	popl %ebp

	ret

.globl mydiv
.type mydiv,@function

mydiv:
	pushl %ebp
	movl %esp,%ebp

	movl 8(%ebp),%eax
	movl 12(%ebp),%edx

	divl 4(%edi)

	movl %ebp,%esp
	popl %ebp

	ret



