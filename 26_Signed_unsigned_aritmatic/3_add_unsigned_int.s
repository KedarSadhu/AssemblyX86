.section .rodata
	msg_bit_set:
	.string "Flag is set\n"

	msg_bit_not_set:
	.string "Flag is not set\n"

.section .text
.globl main
.type main,@function

main:
	andl 	$-16,%esp
	pushl	%ebp
	movl	%esp,%ebp
	subl	$16,%esp

	movl	$2147483648,%eax
	movl	$2147483649,%edx

	addl 	%edx,%eax

	jc		lable_flag_set
	movl	$msg_bit_not_set,(%esp)
	call	printf
	jmp		lable_exit

lable_flag_set:
	movl	$msg_bit_set,(%esp)
	call	printf

lable_exit:	
	movl	$0,(%esp)
	call 	exit
