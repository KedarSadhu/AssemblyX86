.section .rodata
	msg_main_print_main_menu:
	.string "\n1.Insert\n2.Delete\n3.Search\n4.Count\n5.Reverse Display\n6.Exit\n"

	msg_main_print_enter_choice:
	.string "Enter your choice :\t"

	msg_main_scan_single_element:
	.string "%d"

	msg_main_print_insert_menu:
	.string "\n1.InsertFirst\n2.InsertLast\n3.InsertAtPosition\n4.Back\n"

	msg_main_print_enter_choice_again:
	.string "Enter your choice again:\t"

	msg_main_print_invalid_choice:
	.string "Enter valid choice\n"

	msg_main_print_enter_data:
	.string "Enter data to be inserted :\t"

	msg_main_print_enter_position:
	.string "Enter position :\t"

	msg_main_print_empty_linkedlist_delelte:
	.string "Linked List Empty, Deletion impossible.\n"

	msg_main_print_delete_menu:
	.string "\n1.DeleteFirst\n2.DeleteLast\n3.DeleteAtPosition\n4.Back\n"

	msg_main_print_empty_linkedlist:
	.string "Linked List Empty\n"

	msg_main_print_deleted_data:
	.string "Deleted data is %d\n"

	msg_main_print_empty_linkedlist_searching:
	.string "Linked List Empty, Searching impossible.\n"

	msg_main_print_search_menu:
	.string "\n1.SearchFirstOccurance\n2.SearchLastOccurance\n3.SearchAllOccurances\n4.Back\n"

	msg_main_print_enter_data_for_search:
	.string "Enter data to be search :\t"

	msg_main_print_data_not_found:
	.string "Data not found\n"

	msg_main_print_data_found:
	.string "Data found at %d position\n"

	msg_main_print_data_found_occurances:
	.string "Data found %d times\n"

	msg_main_print_count_node:
	.string "Total node present :%d\n"

	msg_main_print_bye:
	.string "Bye...\n"

	msg_print_memory_allocation_error_msg:
	.string "memory allocation FAILED\n"

	msg_print_invalid_position_error_msg:
	.string "Position is invalid\n"

	msg_display_print:
	.string "\nLinked list is :\n"

	msg_display_print_empty:
	.string "EMPTY\n"

	msg_display_print_node:
	.string "<-|%d|->"

	msg_display_print_newline:
	.string "\n"

	msg_deleteall_print_sucssess:
	.string "\nDeleted All Nodes Sussessfully\n"

	msg_reversedisplay_print:
	.string "\nReverse Linked list is :\n"
	
.section .text
.type main,@function
.globl main

main:
	andl	$-16,%esp
	pushl	%ebp
	movl	%esp,%ebp

	#no of local vars = 5 size = 20
	#highest no of parameter = 4 size = 16
	#total = 36 lies in 33 to 48
	#total with alignment = 48

	subl	$48,%esp

	movl	$0,-16(%ebp)	# *pFirst = NULL
	movl	$0,-20(%ebp)	# *pLast = NULL

#main while start
lable_main_loop_while1:
	movl	$msg_main_print_main_menu,(%esp)
	call	printf 

	movl	$msg_main_print_enter_choice,(%esp)
	call 	printf

	leal	-12(%ebp),%ebx	#&ichoice

	movl	$msg_main_scan_single_element,(%esp)
	movl	%ebx,4(%esp)
	call	scanf

	movl	-12(%ebp),%eax	#ichoice

	cmpl	$1,%eax
	je		lable_main_case1_insert_operation_loop

	cmpl	$2,%eax
	je		lable_main_case2_delete_operation_loop

	cmpl	$3,%eax
	je		lable_main_case3_search_operation_loop

	cmpl	$4,%eax
	je 		lable_main_case4_count_operation_loop

	cmpl	$5,%eax
	je		lable_main_case5_reverse_display_operation_loop

	cmpl	$6,%eax
	je		lable_main_case6_exit

	jmp		lable_main_case_default

	jmp		lable_main_loop_while1		#prints main menu again

#main while end

#case 1 : Insert operations
lable_main_case1_insert_operation_loop:
	movl	$msg_main_print_insert_menu,(%esp)
	call	printf

	movl	$msg_main_print_enter_choice_again,(%esp)
	call	printf

	leal 	-12(%ebp),%ebx	#&iChoice

	movl	$msg_main_scan_single_element,(%esp)
	movl	%ebx,4(%esp)
	call	scanf

	movl	-12(%ebp),%eax		#iChoice

	cmpl	$4,%eax				#user selected --> 4.Back
	je		lable_main_loop_while1	#prints main menu again

	cmpl	$0,%eax
	jle		lable_if_body
	cmpl	$3,%eax
	jng		lable_while1_body_continue

lable_if_body:
	movl	$msg_main_print_invalid_choice,(%esp)
	call	printf
	jmp		lable_main_case1_insert_operation_loop	#prints insert sub menu again

lable_while1_body_continue:
	movl	$msg_main_print_enter_data,(%esp)
	call	printf

	leal 	-4(%ebp),%ebx	#&iNo1

	movl	$msg_main_scan_single_element,(%esp)
	movl	%ebx,4(%esp)
	call	scanf
 
	movl	-12(%ebp),%eax	#ichoice

	cmpl	$1,%eax
	je 		lable_insert_first

	cmpl	$2,%eax
	je 		lable_insert_last

	cmpl	$3,%eax
	je 		lable_inset_at_position 

lable_insert_first:
	leal 	-16(%ebp),%eax		#&pFirst
	leal 	-20(%ebp),%ebx		#&pLast
	movl	-4(%ebp),%edx		#iNo

	movl	%eax,(%esp)
	movl	%ebx,4(%esp)
	movl	%edx,8(%esp)
	call 	InsertFirst

	jmp		lable_display_inserted_data		#break

lable_insert_last:
	leal 	-16(%ebp),%eax	#&pFirst
	leal 	-20(%ebp),%ebx  #&pLast

	movl 	-4(%ebp),%edx	#iNo

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	movl 	%edx,8(%esp)
	call 	InsertLast 

	jmp 	lable_display_inserted_data		#break

lable_inset_at_position:
	movl 	$msg_main_print_enter_position,(%esp)
	call 	printf

	leal 	-8(%ebp),%ebx	#&iPos
	
	movl 	$msg_main_scan_single_element,(%esp)
	movl    %ebx,4(%esp)
	call 	scanf

	leal 	-16(%ebp),%ebx 	#&pFirst
	leal  	-20(%ebp),%ecx 	#&pLast
	movl 	-4(%ebp),%eax	#iNo
	movl 	-8(%ebp),%edx 	#iPos
	
	movl 	%ebx,(%esp)
	movl 	%ecx,4(%esp)
	movl 	%eax,8(%esp)
	movl 	%edx,12(%esp)
	call 	InsertAtPosition 

lable_display_inserted_data:
	movl 	-16(%ebp),%eax	#pFirst
	movl 	-20(%ebp),%ebx 	#pLast

	movl 	%eax,(%esp)	
	movl 	%ebx,4(%esp)
	call 	Display

	jmp		lable_main_case1_insert_operation_loop	#prints Insert sub menus again

#case2 Delete operations
lable_main_case2_delete_operation_loop:
	movl 	-16(%ebp),%ebx	#pFirst

	#movl 	$100,%ebx #testing 
 
	cmpl	$0,%ebx
	jne		lable_delete_operation_loop

	movl 	$msg_main_print_empty_linkedlist_delelte,(%esp)
	call 	printf

	jmp		lable_main_loop_while1		#prints main menu again

lable_delete_operation_loop:
	movl 	$msg_main_print_delete_menu,(%esp)
	call 	printf

	movl 	$msg_main_print_enter_choice_again,(%esp)
	call 	printf

	leal 	-12(%ebp),%ebx	#&iChoice

	movl 	$msg_main_scan_single_element,(%esp)
	movl 	%ebx,4(%esp)
	call 	scanf

	movl 	-12(%ebp),%eax	#iChoice

	cmpl 	$4,%eax		#user selected --> 4.Back
	je 		lable_main_loop_while1	#prints main menu again

	cmpl	$1,%eax
	je 		lable_delete_first

	cmpl	$2,%eax
	je 		lable_delete_last

	cmpl	$3,%eax
	je 		lable_delete_at_position

lable_delete_first:
	leal 	-16(%ebp),%eax	#&pFirst
	leal 	-20(%ebp),%ebx  #&pLast

	movl 	%eax,(%esp)	
	movl 	%ebx,4(%esp)
	call 	DeleteFirst

	movl 	%eax,-4(%ebp)	#iNo = DeleteFirst()

	jmp 	lable_delete_while1_body_continue	#break

lable_delete_last:
	leal 	-16(%ebp),%eax	#&pFirst
	leal 	-20(%ebp),%ebx  #&pLast

	movl 	%eax,(%esp)	
	movl 	%ebx,4(%esp)
	call 	DeleteLast

	movl 	%eax,-4(%ebp)	#iNo = DeleteLast()

	jmp 	lable_delete_while1_body_continue	#break

lable_delete_at_position:
	movl 	$msg_main_print_enter_position,(%esp)
	call 	printf

	leal 	-8(%ebp),%ebx	#&ipos

	movl 	$msg_main_scan_single_element,(%esp)
	movl 	%ebx,4(%esp)
	call 	scanf

	leal 	-16(%ebp),%eax	#&pFirst
	leal 	-20(%ebp),%ebx  #&pLast
	movl 	-8(%ebp),%edx	#ipos

	movl 	%eax,(%esp)	
	movl 	%ebx,4(%esp)
	movl 	%edx,8(%esp)
	call 	DeleteAtPosition

	movl 	%eax,-4(%ebp)	#iNo = DeleteAtPosition()

	jmp 	lable_delete_while1_body_continue	#break

	#Default
	movl 	$msg_main_print_invalid_choice,(%esp)
	call 	printf

	movl 	$4,-12(%ebp)	#iChoice = 4

#while1 body continues
lable_delete_while1_body_continue:
	movl 	-4(%ebp),%eax	#iNo

	cmpl	$-1,%eax
	jne		lable_elseif_cond
	
	movl 	$msg_main_print_empty_linkedlist,(%esp)
	call 	printf 
	jmp		lable_delete_operation_loop 	#prints delete sub menu again

lable_elseif_cond:
	movl 	-12(%ebp),%edx		#ichoice	
	cmpl	$4,%edx	
	je 		lable_delete_operation_loop 	#prints delete sub menu again
	cmpl	$-2,%eax		#iNo
	je 		lable_delete_operation_loop 	#prints delete sub menu again


	movl 	$msg_main_print_deleted_data,(%esp)
	movl 	%eax,4(%esp)	#iNo
	call 	printf

	movl 	-16(%ebp),%eax 	#pFirst
	movl 	-20(%ebp),%ebx  #pLast

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	call 	Display

	jmp 	lable_delete_operation_loop 	#prints delete sub menu again

#case3 Search
lable_main_case3_search_operation_loop:
	movl 	-16(%ebp),%ebx 	#pFirst

	#movl 	$100,%ebx #testing 
	cmpl	$0,%ebx
	jne 	lable_search_opration_loop 

	movl 	$msg_main_print_empty_linkedlist_searching,(%esp)
	call 	printf

	jmp 	lable_main_loop_while1 		#prints main menu

lable_search_opration_loop:
	movl 	$msg_main_print_search_menu,(%esp)
	call 	printf

	movl 	$msg_main_print_enter_choice_again,(%esp)
	call 	printf 

	leal 	-12(%ebp),%ebx 	#&iChoice

	movl 	$msg_main_scan_single_element,(%esp)
	movl 	%ebx,4(%esp)
	call 	scanf

	movl 	-12(%ebp),%eax 	#ichoice

	cmpl 	$4,%eax		#user selected --> 4.Back 
	je 		lable_main_loop_while1 	#prints main menu

	cmpl	$0,%eax
	jle		lable_search_if_body
	cmpl	$3,%eax
	jng		lable_search_while1_body_continue

lable_search_if_body:
	movl	$msg_main_print_invalid_choice,(%esp)
	call	printf
	jmp		lable_search_opration_loop	#prints search sub menu again

lable_search_while1_body_continue:
	movl 	-16(%ebp),%eax	#pFirst
	movl 	-20(%ebp),%ebx	#pLast

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	call 	Display

	movl 	$msg_main_print_enter_data_for_search,(%esp)
	call 	printf

	leal 	-4(%ebp),%ebx	#ino

	movl 	$msg_main_scan_single_element,(%esp)
	movl 	%ebx,4(%esp)
	call 	scanf

	movl 	-12(%ebp),%eax 	#ichoice

	cmpl 	$1,%eax
	je 		lable_search_first_occurance

	cmpl 	$2,%eax
	je 		lable_search_last_occurance

	cmpl 	$3,%eax
	je 		lable_search_all_occurance
	
	jmp 	lable_search_opration_loop 		#prints Search sub menu

lable_search_first_occurance:
	movl 	-16(%ebp),%eax	#pFirst
	movl 	-20(%ebp),%ebx	#pLast
	movl 	-4(%ebp),%edx	#iNo

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	movl 	%edx,8(%esp)
	call 	SearchFirstOccurance

	#movl 	$-1,%eax 	#test
	movl 	%eax,-4(%ebp)	#iNo = SearchFirstOccurance()

	cmpl 	$-1,%eax
	jne		lable_search_elseif_cond	
	
	movl 	$msg_main_print_empty_linkedlist,(%esp)
	call 	printf

	jmp 	lable_search_opration_loop 		#prints Search sub menu

lable_search_elseif_cond:
	cmpl	$-2,%eax
	jne		lable_search_else 

	movl 	$msg_main_print_data_not_found,(%esp)
	call 	printf
	jmp 	lable_search_opration_loop 		#prints Search sub menu

lable_search_else:
	movl 	$msg_main_print_data_found,(%esp)
	movl 	%eax,4(%esp)
	call 	printf

	jmp 	lable_search_opration_loop 		#prints Search sub menu

lable_search_last_occurance:
	movl 	-16(%ebp),%eax	#pFirst
	movl 	-20(%ebp),%ebx	#pLast
	movl 	-4(%ebp),%edx	#iNo

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	movl 	%edx,8(%esp)
	call 	SearchLastOccurance

	movl 	%eax,-4(%ebp)	#iNo = SearchLastOccurance()

	cmpl 	$-1,%eax
	jne		lable_searchlast_elseif_cond	
	
	movl 	$msg_main_print_empty_linkedlist,(%esp)
	call 	printf

	jmp 	lable_search_opration_loop 		#prints Search sub menu

lable_searchlast_elseif_cond:
	cmpl	$-2,%eax
	jne		lable_searchlast_else 

	movl 	$msg_main_print_data_not_found,(%esp)
	call 	printf
	jmp 	lable_search_opration_loop 		#prints Search sub menu

lable_searchlast_else:
	movl 	$msg_main_print_data_found,(%esp)
	movl 	%eax,4(%esp)
	call 	printf

	jmp 	lable_search_opration_loop 		#prints Search sub menu

lable_search_all_occurance:
	movl 	-16(%ebp),%eax	#pFirst
	movl 	-20(%ebp),%ebx	#pLast
	movl 	-4(%ebp),%edx	#iNo

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	movl 	%edx,8(%esp)
	call 	SearchAllOccurance

	movl 	%eax,-4(%ebp)	#iNo = SearchAllOccurance()

	movl 	$msg_main_print_data_found_occurances,(%esp)
	movl  	%eax,4(%esp)
	call 	printf

	jmp 	lable_search_opration_loop 		#prints Search sub menu

lable_main_case4_count_operation_loop:
	movl 	-16(%ebp),%eax	#pFirst
	movl 	-20(%ebp),%ebx	#pLast

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	call 	Display

	movl 	-16(%ebp),%eax
	movl 	-20(%ebp),%ebx

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	call 	CountNode

	movl 	%eax,-4(%ebp)	#iNo = CountNode()

	movl 	$msg_main_print_count_node,(%esp)
	movl 	%eax,4(%esp)		#return value of CountNode()
	call 	printf

	jmp		lable_main_loop_while1		#prints main menu again



lable_main_case5_reverse_display_operation_loop:
	movl 	-16(%ebp),%eax 	#pFirst
	movl 	-20(%ebp),%ebx 	#pLast

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	call 	Display

	movl 	-16(%ebp),%eax 	#pFirst
	movl 	-20(%ebp),%ebx 	#pLast

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	call 	ReverseDisplay

	jmp 	lable_main_loop_while1 		#prints main menu again

lable_main_case6_exit:
	movl 	-16(%ebp),%eax 	#pFirst
	movl 	-20(%ebp),%ebx 	#pLast

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	call 	Display

	movl 	-16(%ebp),%ebx	#pFirst

	cmpl	$0,%ebx				
	je 		lable_case6_if_body	#pFirst == NULL

	leal 	-16(%ebp),%eax 	#&pFirst
	leal 	-20(%ebp),%ebx 	#&pLast

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	call 	DeleteAllNodes

lable_case6_if_body:
	movl 	$msg_main_print_bye,(%esp)
	call 	printf 

	movl 	$0,(%esp)
	call 	exit


lable_main_case_default:
	movl 	$msg_main_print_invalid_choice,(%esp)
	call 	printf 

	jmp		lable_main_loop_while1	#prints main menu again


.type InsertFirst,@function
.globl InsertFirst
InsertFirst:
	pushl	%ebp
	movl 	%esp,%ebp

	#no of local variable = 1 size = 4
	#highest no of parameter = 2 size = 8
	#total = 12
	#with alignment = 16 
	subl	$16,%esp

	movl 	$0,-4(%ebp)	#pNewNode

	movl 	$12,(%esp)	#sizeof(struct List)
	call 	malloc 

	movl 	%eax,-4(%ebp)	#pNewNode = malloc()

	cmpl	$0,%eax
	je 		lable_err_memory_allocation
	
	movl   16(%ebp),%edx
	movl 	%edx,4(%eax)	#pNewnode->iData = iNo

	movl 	8(%ebp),%ebx	#&pFirst
	movl 	(%ebx),%edx		#*ppHead --> pFirst madhli value 
	#%edx=0

    movl 	12(%ebp),%ecx	#&pLast

    cmpl	$0,%edx			#*ppHead == NULL
    jne		lable_insert_first_def_nonempty_list
   	movl 	%eax,(%ebx)		#*phead = pNewNode
   	movl 	%eax,(%ecx)		#*pptail = pNewNode
   	movl 	(%ecx),%edx		#(*ppTail)
	movl 	(%ebx),%eax		#*phead
	movl    %eax,8(%edx) 	#(*ppTail)->pNext = *ppHead;
	movl 	%edx,(%eax)		#(*ppHead)->pPrev = *ppTail;
	jmp 	lable_insert_first_ret
	
lable_insert_first_def_nonempty_list:
	movl 	(%ebx),%edx		#(*pHead)
	movl 	%edx,8(%eax)	#pNewNode->pNext = *ppHead;
	movl 	%eax,(%edx)		#(*ppHead)->pPrev = pNewNode;
	movl 	%eax,(%ebx)		#*ppHead = pNewNode;
	movl 	(%ecx),%edx		#(*ppTail)
	movl 	(%ebx),%eax		#*phead
	movl 	%eax,8(%edx)	#(*ppTail)->pNext = *ppHead;
	movl 	%edx,(%eax)		#(*ppHead)->pPrev = *ppTail;

lable_insert_first_ret:
	movl 	%ebp,%esp
	popl 	%ebp
	ret

.type InsertLast,@function
.globl InsertLast	
InsertLast:
	pushl	%ebp
	movl 	%esp,%ebp

	subl	$16,%esp

	movl 	$0,-4(%ebp)	#pNewNode

	movl 	$12,(%esp)
	call 	malloc

	movl 	%eax,-4(%ebp)	#pNewNode=malloc()

	cmpl	$0,%eax
	je 		lable_err_memory_allocation

	movl 	16(%ebp),%edx		#iNo
	movl 	%edx,4(%eax)		#pnewnode->idata =iNo	

	movl 	8(%ebp),%ebx		#&pFirst
	movl 	(%ebx),%edx			#*ppHead

	movl 	12(%ebp),%ecx		#&pLast

	cmpl 	$0,%edx
	jne 	lable_insert_last_nonempty_list
	movl 	%eax,(%ebx)		#*ppHead =newnode
	movl 	%eax,(%ecx)		#*pptail =newnode
	movl 	(%ecx),%edx		#*ppTail
	movl 	(%ebx),%eax		#*pphead
	movl 	%eax,8(%edx)	#(*ppTail)->next = *ppHead
	movl 	%edx,(%eax)		#(*ppHead)->pPrev = *ppTail;

	jmp 	lable_inset_last_ret

lable_insert_last_nonempty_list:
	movl 	(%ecx),%edx		#*ppTail
	movl 	%eax,8(%edx)	#(*ppTail)->next = pNewNode
	movl 	%edx,(%eax)		#pNewNode->pprev =*ppTail
	movl 	%eax,(%ecx)		#*ppTail = pNewnode
	movl 	(%ecx),%edx		#*ppTail
	movl 	(%ebx),%eax		#*pphead
	movl 	%eax,8(%edx)	#(*ppTail)->next = *ppHead
	movl 	%edx,(%eax)		#(*ppHead)->pPrev = *ppTail;
	

lable_inset_last_ret:
	movl 	%ebp,%esp
	popl	%ebp
	ret

.type InsertAtPosition,@function
.globl InsertAtPosition
InsertAtPosition:
	pushl	%ebp
	movl 	%esp,%ebp

	#no of local vars = 3 size = 12
	#no of highest param = 3, size = 12
	#total = 24 range = 17 to 32
	#alignment
	subl	$32,%esp
	
	movl 	$0,-4(%ebp)		#pnewnode = NULL
	movl 	$0,-8(%ebp)		#ptemp = NULL

	movl 	8(%ebp),%eax	#&pFirst
	movl 	(%eax),%ebx		#*ppHead

	movl 	12(%ebp),%edx	#&pLast
	movl 	(%edx),%eax		#*ppTail

	movl 	%ebx,(%esp)
	movl 	%eax,4(%esp)
	call 	CountNode

	movl 	%eax,-12(%ebp)	#iCount = CountNode

	movl 	20(%ebp),%edx	#iPos

	cmpl	$0,%edx
	jle		lable_if_body_invalid_pos
	addl	$1,%eax		#iCount+1
	cmpl	%eax,%edx	#iPos > iCount + 1
	jng		lable_chk_first_pos

lable_if_body_invalid_pos:
	movl 	$msg_print_invalid_position_error_msg,(%esp)
	call 	printf
	jmp 	lable_insert_at_pos_ret

lable_chk_first_pos:
	cmpl	$1,%edx		#ipos == 1
	jne		lable_chk_last_pos

	movl 	8(%ebp),%eax	#ppHead
	movl 	12(%ebp),%ebx	#ppTail
	movl 	16(%ebp),%edx	#iNo

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	movl 	%edx,8(%esp)
	call 	InsertFirst

	jmp		lable_insert_at_pos_ret

lable_chk_last_pos:
	cmpl	%edx,%eax
	jne		lable_insert_at_pos_middle

	movl 	8(%ebp),%eax	#ppHead
	movl 	12(%ebp),%ebx	#ppTail
	movl 	16(%ebp),%edx	#iNo

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	movl 	%edx,8(%esp)
	call 	InsertLast

	jmp		lable_insert_at_pos_ret

lable_insert_at_pos_middle:
	movl 	8(%ebp),%ebx	#&pFirst
	movl 	(%ebx),%ebx		#*pphead
	movl 	%ebx,-8(%ebp)	#ptemp = *pphead
	movl 	$1,-12(%ebp)	#iCount = 1

	movl 	20(%ebp),%edx	#iPos
	subl 	$1,%edx			#iPos-1
	jmp		lable_while_till_pos_cond 	 

lable_while_till_pos_st:
	addl 	$1,-12(%ebp)
	movl 	-8(%ebp),%ebx	#ptemp
	movl 	8(%ebx),%ebx	#ptemp->next
	movl 	%ebx,-8(%ebp)

lable_while_till_pos_cond:
	movl 	-12(%ebp),%eax	#iCount
	cmpl	%edx,%eax		#icount<iPos-1
	jl 		lable_while_till_pos_st

	movl 	$12,(%esp)
	call 	malloc

	movl 	%eax,-4(%ebp)
	cmpl	$0,%eax
	je 		lable_err_memory_allocation

	movl 	16(%ebp),%edx		#iNo
	movl 	%edx,4(%eax)		#pnewnode->idata =iNo	

	movl 	-8(%ebp),%ebx	#ptemp
	movl 	8(%ebx),%ebx	#ptemp->next
	movl 	%ebx,8(%eax)	#pnewnode->pnext = ptemp->next
	movl 	%eax,(%ebx)		#pTemp->pNext->pPrev = pNewNode;
	movl 	-8(%ebp),%ebx	#ptemp
	movl 	%eax,8(%ebx)	#pTemp->pNext = pNewNode;
	movl 	%ebx,(%eax)		#pNewNode->pPrev = pTemp;


lable_insert_at_pos_ret:
	movl 	%ebp,%esp
	popl 	%ebp
	ret

.type DeleteFirst,@function
.globl 	DeleteFirst
DeleteFirst:
	pushl 	%ebp
	movl 	%esp,%ebp

	subl 	$16,%esp

	movl 	8(%ebp),%ebx	#&pFirst
	movl 	(%ebx),%eax		#(*ppHead)

	cmpl 	$0,%eax
	jne		lable_delete_first_body
	movl 	$-1,%eax
	jmp 	lable_delete_first_ret

lable_delete_first_body:
	movl 	4(%eax),%edx	#(*ppHead)->iData
	movl 	%edx,-4(%ebp)	#iDelData

#only single node present
	movl 	12(%ebp),%eax	#&plast
	movl 	(%eax),%edx		#(*ppTail)
	movl 	(%ebx),%ecx		#(*ppHead)	
	
	cmpl	%edx,%ecx
	jne		lable_delete_first_multiple_node_list
	
	movl 	$0,8(%ebx)		#(*ppHead)->pNext = NULL;
	movl 	$0,(%ebx)		#(*ppHead)->pPrev = NULL;

	movl 	(%ebx),%edx		#(*ppHead)

	movl 	%edx,(%esp)
	call 	free

	movl 	8(%ebp),%ebx	#&pFirst
	movl 	$0,(%ebx)
	movl 	12(%ebp),%ebx	#&plast
	movl 	$0,(%ebx)

	movl 	-4(%ebp),%eax
	
	jmp 	lable_delete_first_ret

lable_delete_first_multiple_node_list:
	movl 	8(%ebp),%ebx	#&pFirst
	movl 	(%ebx),%eax		#(*ppHead)
	movl 	8(%eax),%edx	#(*ppHead)->next
	movl 	%edx,(%ebx)		#(*ppHead) = (*ppHead)->next

	movl 	12(%ebp),%ebx	#&plast
	movl 	(%ebx),%eax		#(*ppTail)
	movl 	8(%eax),%edx	#(*ppTail)->next
	movl 	$0,8(%edx)		#(*ppTail)->pNext->pNext = NULL;
	movl 	$0,(%edx)		#(*ppTail)->pNext->pPrev = NULL;

	movl 	%edx,(%esp)
	call 	free
		
	movl 	8(%ebp),%ebx	#&pFirst
	movl 	(%ebx),%eax		#(*ppHead)
	movl 	12(%ebp),%edx	#&plast
	movl 	(%edx),%ecx		#(*ppTail)
	

	movl 	%eax,8(%ecx)	#(*ppTail)->pNext = *ppHead;
	movl 	%ecx,(%eax)		#(*ppHead)->pPrev = *ppTail;

	movl 	-4(%ebp),%eax

lable_delete_first_ret:
	movl 	%ebp,%esp
	popl 	%ebp
	ret 

.type DeleteLast,@function
.globl DeleteLast
DeleteLast:
	pushl	%ebp
	movl 	%esp,%ebp

	subl 	$16,%esp
	
	movl 	8(%ebp),%ebx	#&pFirst
	movl 	(%ebx),%eax		#(*ppHead)

	cmpl 	$0,%eax
	jne		lable_delete_last_body
	movl 	$-1,%eax
	jmp 	lable_delete_last_ret	#return -1

lable_delete_last_body:
	movl 	12(%ebp),%edx	#&pLast
	movl 	(%edx),%eax		#(*ppTail)

	movl 	4(%eax),%edx	#(*ppTail)->iData
	movl 	%edx,-4(%ebp)	#iDelData

#only single node present
	movl 	12(%ebp),%eax	#&plast
	movl 	(%eax),%edx		#(*ppTail)
	movl 	(%ebx),%ecx		#(*ppHead)	
	
	cmpl	%edx,%ecx
	jne		lable_delete_last_multiple_node_list
	
	movl 	$0,8(%ebx)		#(*ppHead)->pNext = NULL;
	movl 	$0,(%ebx)		#(*ppHead)->pPrev = NULL;

	movl 	(%ebx),%edx		#(*ppHead)

	movl 	%edx,(%esp)
	call 	free

	movl 	8(%ebp),%ebx	#&pFirst
	movl 	$0,(%ebx)
	movl 	12(%ebp),%ebx	#&plast
	movl 	$0,(%ebx)

	movl 	-4(%ebp),%eax
	
	jmp 	lable_delete_last_ret

lable_delete_last_multiple_node_list:
	movl 	12(%ebp),%ebx	#&pLast
	movl 	(%ebx),%eax		#(*ppTail)
	movl 	(%eax),%edx		#(*ppTail)->pPrev
	movl 	%edx,(%ebx)		#(*ppTail) = (*ppTail)->next

	movl 	8(%ebp),%ebx	#&pFirst
	movl 	(%ebx),%eax		#(*ppHead)
	movl 	(%eax),%edx		#(*ppHead)->pPrev
	movl 	$0,8(%edx)		#(*ppHead)->pPrev->pNext = NULL;
	movl 	$0,(%edx)		#(*ppHead)->pPrev->pPrev = NULL;

	movl 	%edx,(%esp)
	call 	free
		
	movl 	8(%ebp),%ebx	#&pFirst
	movl 	(%ebx),%eax		#(*ppHead)
	movl 	12(%ebp),%edx	#&plast
	movl 	(%edx),%ecx		#(*ppTail)
	

	movl 	%eax,8(%ecx)	#(*ppTail)->pNext = *ppHead;
	movl 	%ecx,(%eax)		#(*ppHead)->pPrev = *ppTail;

	movl 	-4(%ebp),%eax

lable_delete_last_ret:
	movl 	%ebp,%esp
	popl 	%ebp

	ret

.type DeleteAtPosition,@function
.globl DeleteAtPosition
DeleteAtPosition:
	pushl 	%ebp
	movl 	%esp,%ebp

	#no of local vars = 2 size = 8
	#no of highest param = 2, size = 8
	#total = 16 range = 0 to 16
	#alignment
	subl 	$16,%esp
	
	movl 	$0,-4(%ebp)		#ptemp = NULL
	
	movl 	8(%ebp),%eax	#&pFirst
	movl 	(%eax),%ebx		#*ppHead

	movl 	12(%ebp),%edx	#&pLast
	movl 	(%edx),%eax		#*ppTail

	movl 	%ebx,(%esp)
	movl 	%eax,4(%esp)
	call 	CountNode

	movl 	%eax,-8(%ebp)	#iCount = CountNode

	movl 	16(%ebp),%edx	#iPos

	cmpl	$0,%edx
	jle		lable_if_body_invalid_pos_del
	cmpl	%eax,%edx	#iPos > iCount
	jng		lable_chk_first_pos_del

lable_if_body_invalid_pos_del:
	movl 	$msg_print_invalid_position_error_msg,(%esp)
	call 	printf
	movl 	$-2,%eax
	jmp 	lable_del_at_pos_ret

lable_chk_first_pos_del:
	cmpl	$1,%edx		#ipos == 1
	jne		lable_chk_last_pos_del

	movl 	8(%ebp),%eax	#ppHead
	movl 	12(%ebp),%ebx	#ppTail

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	call 	DeleteFirst

	jmp		lable_del_at_pos_ret

lable_chk_last_pos_del:
	cmpl	%edx,%eax
	jne		lable_delete_at_pos_middle

	movl 	8(%ebp),%eax	#ppHead
	movl 	12(%ebp),%ebx	#ppTail

	movl 	%eax,(%esp)
	movl 	%ebx,4(%esp)
	call 	DeleteLast

	jmp		lable_del_at_pos_ret

#node in between
lable_delete_at_pos_middle:
	movl 	8(%ebp),%ebx	#&pFirst
	movl 	(%ebx),%ebx		#*pphead
	movl 	%ebx,-4(%ebp)	#ptemp = *pphead
	movl 	$1,-8(%ebp)		#iCount = 1
	
	jmp		lable_while_till_pos_cond_del

lable_while_till_pos_st_del:
	addl 	$1,-8(%ebp)
	movl 	-4(%ebp),%ebx	#ptemp
	movl 	8(%ebx),%ebx	#ptemp->next
	movl 	%ebx,-4(%ebp)

lable_while_till_pos_cond_del:
	movl 	16(%ebp),%edx	#iPos
	movl 	-8(%ebp),%eax	#iCount
	cmpl	%edx,%eax		#icount<iPos
	jl 		lable_while_till_pos_st_del

	movl 	-4(%ebp),%edx	#ptemp
	movl 	(%edx),%eax		#ptemp->pprev
	movl 	8(%edx),%ecx	#pTemp->pnext
	movl 	%ecx,8(%eax)	#pTemp->pPrev->pNext = pTemp->pNext;
	movl 	%eax,(%ecx)		#pTemp->pNext->pPrev = pTemp->pPrev
	movl 	$0,8(%edx)
	movl 	$0,(%edx)

	movl 	4(%edx),%eax	#iCount = pTemp->iData;
	movl 	%eax,-8(%ebp)

	movl 	%edx,(%esp)
	call 	free

	movl 	-8(%ebp),%eax	

lable_del_at_pos_ret:
	movl 	%ebp,%esp
	popl 	%ebp
	ret

.type SearchFirstOccurance,@function
.globl SearchFirstOccurance
SearchFirstOccurance:
	pushl 	%ebp
	movl 	%esp,%ebp

	subl 	$16,%esp

	movl 	8(%ebp),%ebx
	cmpl	$0,%ebx
	jne		lable_search_first_body
	movl 	$-1,%eax
	jmp		lable_search_first_ret

lable_search_first_body:
	movl 	$1,-4(%ebp)

lable_do_while_search_first_st:
	movl 	8(%ebp),%ebx	#phead
	movl 	4(%ebx),%eax	#pHead->iNo
	movl 	16(%ebp),%edx	#iKey
	cmpl 	%edx,%eax
	je 		lable_search_first_if_cond	#break
	addl 	$1,-4(%ebp)
	movl 	8(%ebx),%ebx	#phead->next
	movl 	%ebx,8(%ebp)	#phead = phead->next

lable_do_while_search_first_cond:
	movl 	12(%ebp),%edx	#ptail
	movl 	8(%edx),%edx	#ptail->pnext
	cmpl 	%edx,%ebx		#pHead != pTail->pNext
	jne 	lable_do_while_search_first_st	
	
lable_search_first_if_cond:	
	movl 	8(%ebp),%eax	#phead
	movl 	12(%ebp),%edx	#ptail
	movl 	8(%edx),%edx	#ptail->pnext
	
	cmpl 	%edx,%eax		

	jne 	lable_search_first_body_continue	
	movl 	-4(%ebp),%eax
	cmpl	$1,%eax
	je 		lable_search_first_body_continue	

lable_search_first_if_body:

	movl 	$-2,%eax
	jmp 	lable_search_first_ret


lable_search_first_body_continue:
	movl 	-4(%ebp),%eax

lable_search_first_ret:

	movl 	%ebp,%esp
	popl 	%ebp
	ret

.type SearchLastOccurance,@function
.globl 	SearchLastOccurance
SearchLastOccurance:
	pushl 	%ebp
	movl 	%esp,%ebp

	subl 	$16,%esp

	movl 	8(%ebp),%ebx
	cmpl	$0,%ebx
	jne		lable_search_last_body
	movl 	$-1,%eax
	jmp		lable_search_last_ret

lable_search_last_body:
	movl 	$1,-4(%ebp)
	movl 	$0,-8(%ebp)

lable_do_while_search_last_st:
	movl 	8(%ebp),%ebx	#phead
	movl 	4(%ebx),%eax	#pHead->iNo
	movl 	16(%ebp),%edx	#iKey
	cmpl 	%edx,%eax
	jne 	lable_search_last_dowhile_body_continue	
	movl 	-4(%ebp),%eax	#iPos
	movl 	%eax,-8(%ebp)	#iLast

lable_search_last_dowhile_body_continue:
	addl 	$1,-4(%ebp)
	movl 	8(%ebx),%ebx	#phead->next
	movl 	%ebx,8(%ebp)	#phead = phead->next

lable_do_while_search_last_cond:
	movl 	8(%ebp),%ebx	#phead
	movl 	12(%ebp),%edx	#ptail
	movl 	8(%edx),%edx	#ptail->pnext
	cmpl 	%edx,%ebx		#pHead != pTail->pNext
	jne 	lable_do_while_search_last_st	

	movl 	-8(%ebp),%eax
	cmpl	$0,%eax
	je		lable_search_last_if_body
	jmp		lable_search_last_ret	


lable_search_last_if_body:
	movl 	$-2,%eax


lable_search_last_ret:
	movl 	%ebp,%esp
	popl 	%ebp
	ret

.type SearchAllOccurance,@function
.globl SearchAllOccurance
SearchAllOccurance:
	pushl 	%ebp
	movl 	%esp,%ebp

	subl 	$16,%esp

	movl 	$0,-4(%ebp)
	movl 	8(%ebp),%ebx
	cmpl	$0,%ebx
	jne		lable_do_while_search_all_st
	jmp		lable_searchall_ret

lable_do_while_search_all_st:
	movl 	8(%ebp),%ebx	#phead
	movl 	4(%ebx),%eax	#pHead->iNo
	movl 	16(%ebp),%edx	#iKey
	cmpl 	%edx,%eax
	jne 	lable_search_all_dowhile_body_continue	
	addl 	$1,-4(%ebp)		#icount++

lable_search_all_dowhile_body_continue:
	movl 	8(%ebx),%ebx	#phead->next
	movl 	%ebx,8(%ebp)	#phead = phead->next

lable_do_while_search_all_cond:
	movl 	8(%ebp),%ebx	#phead
	movl 	12(%ebp),%edx	#ptail
	movl 	8(%edx),%edx	#ptail->pnext
	cmpl 	%edx,%ebx		#pHead != pTail->pNext
	jne 	lable_do_while_search_all_st	


lable_searchall_ret:
	movl 	-4(%ebp),%eax
	movl 	%ebp,%esp
	popl 	%ebp
	ret

.type Display,@function
.globl Display
Display:
	pushl 	%ebp
	movl 	%esp,%ebp

	subl	$16,%esp

	movl 	$msg_display_print,(%esp)
	call 	printf

	movl 	8(%ebp),%ebx	#phead

	cmpl 	$0,%ebx
	jne 	lable_do_while_st
	movl 	$msg_display_print_empty,(%esp)
	call 	printf
	jmp 	lable_display_ret

lable_do_while_st:
	movl 	4(%ebx),%edx	#head->iNo
	movl 	$msg_display_print_node,(%esp)
	movl 	%edx,4(%esp)
	call 	printf

	movl 	8(%ebp),%ebx 	#pHead
	movl 	8(%ebx),%ebx	#pHead->next
	movl 	%ebx,8(%ebp)

lable_do_while_cond:
	movl 	8(%ebp),%eax
	movl 	12(%ebp),%edx
	movl 	8(%edx),%edx
	cmpl 	%edx,%eax
	jne 	lable_do_while_st

	movl 	$msg_display_print_newline,(%esp)
	call 	printf

lable_display_ret:
	movl 	%ebp,%esp 
	popl 	%ebp
	ret 

.type CountNode,@function
.globl CountNode
CountNode:
	pushl 	%ebp
	movl 	%esp,%ebp

	subl 	$16,%esp

	movl 	$0,-4(%ebp)	#iCount =0

	movl 	8(%ebp),%ebx
	cmpl	$0,%ebx
	jne		lable_countnode_do_while_st
	movl 	$0,%eax
	jmp		lable_countnode_ret

lable_countnode_do_while_st:
	addl 	$1,-4(%ebp)		#iCount++
	movl 	8(%ebp),%ebx 	#pHead
	movl 	8(%ebx),%ebx	#pHead->next
	movl 	%ebx,8(%ebp)

lable_countnode_do_while_cond:
	movl 	8(%ebp),%eax
	movl 	12(%ebp),%edx
	movl 	8(%edx),%edx
	cmpl 	%edx,%eax
	jne 	lable_countnode_do_while_st

	movl 	-4(%ebp),%eax

lable_countnode_ret:
	movl 	%ebp,%esp
	popl	%ebp
	ret 

.type ReverseDisplay,@function
.globl ReverseDisplay
ReverseDisplay:
	pushl	%ebp
	movl 	%esp,%ebp

	subl	$16,%esp

	movl 	$msg_reversedisplay_print,(%esp)
	call    printf

	movl 	12(%ebp),%ebx	#pTail
	cmpl	$0,%ebx
	jne 	lable_reversedisplay_dowhile_st		
	movl 	$msg_display_print_empty,(%esp)
	call 	printf 
	jmp 	lable_reverse_display_ret

lable_reversedisplay_dowhile_st:
	movl 	4(%ebx),%edx	#ptail->iNo
	movl 	$msg_display_print_node,(%esp)
	movl 	%edx,4(%esp)
	call 	printf

	movl 	12(%ebp),%ebx 	#pTail
	movl 	(%ebx),%ebx		#pTail->pPrev
	movl 	%ebx,12(%ebp)	#Ptail = pTail->pPrev 

lable_reversedisplay_dowhile_cond:
	movl 	12(%ebp),%eax	#pTail
	movl 	8(%ebp),%edx	#pHead
	movl 	(%edx),%edx		#pHead->pPrev
	cmpl 	%edx,%eax
	jne 	lable_reversedisplay_dowhile_st

	movl 	$msg_display_print_newline,(%esp)
	call 	printf

lable_reverse_display_ret:
	movl 	%ebp,%esp
	popl 	%ebp
	ret

.type DeleteAllNodes,@function
.globl DeleteAllNodes
DeleteAllNodes:
	pushl 	%ebp
	movl 	%esp,%ebp

	subl	$16,%esp

	movl 	8(%ebp),%ebx	#&pFirst
	movl 	(%ebx),%eax		#(*ppHead)

	cmpl 	$0,%eax
	jne 	lable_delete_all_while_cond

	jmp 	lable_deleteall_ret

lable_delete_all_while_st:
	movl 	$0,(%eax)		#(*ppHead)->pPrev = NULL;
	movl 	8(%eax),%eax	#(*ppHead)->pNext;
	movl 	%eax,(%ebx)		#*ppHead = (*ppHead)->pNext;
	movl 	8(%ecx),%ecx	#(*ppTail)->pNext
	movl 	$0,8(%ecx)		#(*ppTail)->pNext->pNext = NULL;
	
	movl 	%ecx,(%esp)
	call 	free

	movl 	12(%ebp),%edx	#&pLast
	movl 	(%edx),%ecx		#(*ppLast)
	movl 	8(%ebp),%ebx	#&pFirst
		
	movl 	(%ebx),%eax		#*ppHead
	movl 	%eax,8(%ecx)		

lable_delete_all_while_cond:
	movl 	12(%ebp),%edx	#&pLast
	movl 	(%edx),%ecx		#(*ppLast)
	movl 	8(%ebp),%ebx	#&pFirst
	movl 	(%ebx),%eax		#(*ppHead)

	cmpl	%ecx,%eax
	jne 	lable_delete_all_while_st

	movl 	$0,8(%eax)
	movl 	$0,(%eax)

	movl 	%eax,(%esp)
	call 	free

	movl 	12(%ebp),%edx	#&pLast
	movl 	8(%ebp),%ebx	#&pFirst
	movl 	$0,(%ebx)
	movl 	$0,(%edx)

	movl 	$msg_deleteall_print_sucssess,(%esp)
	call 	printf	

lable_deleteall_ret:
	movl 	%ebp,%esp
	popl 	%ebp
	ret


lable_err_memory_allocation:
	movl 	$msg_print_memory_allocation_error_msg,(%esp)
	call 	printf

	movl 	%ebp,%esp
	popl 	%ebp
	ret


