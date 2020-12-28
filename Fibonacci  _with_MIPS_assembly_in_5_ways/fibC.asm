.data
#msg_str: 	.asciiz "Enter some number: би
.text
.globl main
main :
	#la $a0, msg_str
	#li $v0, 4
	#syscall 
	li $v0, 5 #read syscall 5
	syscall
 	move $a0, $v0  # enter the n
 	li $a1, 0 #initialize b=0
	li $a2, 1 #initialize a+b=1
	jal fac 
	move $a0, $v0#get the return

	li $v0, 1 #print syscall 1
	syscall
	li $v0, 10 #exit syscall 10
	syscall
fac:
	addi $sp,$sp,-4 #recursive need to protect the local varible
	sw $ra,0($sp) #protect ra since the different level recursive call
	
	#this part handles n==0 
	li $t1, 0
	beq $a0, $t1, func1_one
	


	addi $a0, $a0, -1 #=n-1
	move $t1,$a1 # record a 
	move $a1, $a2 #a=b
	add $a2, $t1, $a2 #b=a+b
	
	jal fac

	j func2 #call recover infact this will not be call since it should be terminate at n==0 or 1
	
func1_one:#this part handles n==0
	move $v0, $a1
	jr $ra

#recover this level of recursive local varible
func2:
	lw $ra,0($sp)
	addi $sp,$sp,4
	jr $ra
