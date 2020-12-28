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
 	move $a0, $v0 # enter the n
	jal fac #call function
	move $a0, $v0#get the return
	li $v0, 1 #print syscall 1
	syscall
	li $v0, 10 #exit syscall 10
	syscall
fac:
	addi $sp,$sp,-16 #recursive need to protect the local varible
	sw $t2,12($sp) #protect t2 since the different level recursive call
	sw $t1,8($sp) #protect t1 since the different level recursive call
	sw $t0,4($sp) #protect t0 since the different level recursive call
	sw $ra,0($sp) #protect ra since the different level recursive call
	
	
        slti $t0, $a0, 2
	bne $t0, $zero, func1_one #if n<=2 go  func1_one
	#move $s0, $a0

	
	move $t1,  $a0
	addi $a0, $a0, -1
	jal fac #recursive call fac n-1)
	
	move  $t2, $v0 # record  fac n-1) return
	addi $a0, $t1, -2
	jal fac #recursive call fac (n-2)
	#move  $t2, $v0
	
	add $v0, $t2, $v0	# fac (n-1)+ fac (n-2)
	j func1 # here is go to recover this level of recursive local varible
func1_one:
	move $v0, $a0 #just return n
func1: #recover this level of recursive local varible
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp) 
	lw $t2,12($sp)
	addi $sp,$sp,16
	jr $ra
