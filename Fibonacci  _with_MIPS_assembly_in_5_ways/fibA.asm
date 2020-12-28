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
 	move $a0, $v0# enter the n
	jal fac #call function
	move $a0, $v0#get the return
	li $v0, 1 #print syscall 10
	syscall
	li $v0, 10 #exit syscall 10
	syscall
fac:
        slti $t0, $a0, 2 
	beq $t0, $zero, loophead #if n<2 go loophead
	move $v0, $a0 #else return n where n=1 or 0
	jr $ra
loophead :
	li $t0, 1 # i=1
	li $t1, 0 #j=0
	li $t2, 1 #j_=1
 loopbody :
	addi $t0, $t0, 1 #i=i+1
	move $t3, $t2     #k = j_
	add $t2, $t1, $t2 #j_= j + j_
	move $t1, $t3     #j = k
	move $v0, $t2 #prepare the return
	bne $t0, $a0, loopbody #i==n
	jr $ra #back to jal fac
