.section .rodata
	main_msg_print1:
	.string  "Enter Two Numbers : "
	
	main_msg_scan: 
	.string "%d%d"

	main_msg_print2: 
	.string "Answer is : %d\n" 

	test_msg:
	.string "\nno1 : %d\tno2 : %d\n"

.section .text
.globl main
.type main, @function

main:
	pushl %ebp
	movl  %esp,%ebp

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
	call addition
	addl $8,%esp
	movl %eax,-12(%ebp)

	movl -12(%ebp),%eax
	pushl %eax
	pushl $main_msg_print2
	call printf
	addl $8,%esp

	pushl $0
	call exit

.globl addition
.type addition,@function

addition:
	pushl %ebp
	movl %esp,%ebp

	subl $4 ,%esp

	movl 8(%ebp),%eax
	movl 12(%ebp),%edx

	addl %edx,%eax

	movl %eax,-4(%ebp)

	movl -4(%ebp),%eax

	movl %ebp,%esp
	popl %ebp
	ret
