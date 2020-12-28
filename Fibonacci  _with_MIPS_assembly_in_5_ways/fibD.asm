.data
Q1:  .word 1, 1, 1, 0
#msg_str: 	.asciiz "Enter some number: би
.text
.globl main
main :
	#la $a0, msg_str
	#li $v0, 4
	#syscall 
	li $v0, 5 #read syscall 5
	syscall
	
 	
 	beq $v0, $zero, func1_one#if n ==0 go func1_one
 	move $a0, $v0
        jal find
        lw $a0, 4($v0)
	li $v0, 1 #print syscall 1
	syscall
	li $v0, 10 #exit syscall 10
	syscall


mmul : #this part is the same as ##### mmul implemented for you ##### 
	addi $sp,$sp,-40 #recursive need to protect the local varible
	sw $t8,36($sp) #protect t8 since the different level recursive call
	sw $t7,32($sp) #protect t7 since the different level recursive call
	sw $t6,28($sp) #protect t6 since the different level recursive call
	sw $t5,24($sp) #protect t5 since the different level recursive call
	sw $t4,20($sp) #protect t4 since the different level recursive call
	sw $t3,16($sp) #protect t3 since the different level recursive call
	sw $t2,12($sp) #protect t2 since the different level recursive call
	sw $t1,8($sp) #protect t1 since the different level recursive call
	sw $t0,4($sp) #protect t0 since the different level recursive call
	sw $ra,0($sp) #protect ra since the different level recursive call
	move $t0, $a0
	move $t1, $a1
	li $a0, 16#r e q u e s tf o r16by tel o c a t i o nt oh o l dr e s u l tm atri x
	li $v0, 9#m a l l o csystemc a l l syscall
	syscall	
	
	lw $t2, 0($t0)
	lw $t3, 4($t0)
	lw $t4, 0($t1)
	lw $t5, 8($t1)
	mul $t7, $t2, $t4
	mul $t8, $t3, $t5
	add $t7, $t7, $t8
	sw $t7, 0($v0)
	
	lw $t4, 4($t1)
	lw $t5, 12($t1)
	mul $t7, $t2, $t4
	mul $t8, $t3, $t5
	add $t7, $t7, $t8
	sw $t7, 4($v0)
	
	lw $t2, 8($t0)
	lw $t3, 12($t0)
	mul $t7, $t2, $t4
	mul $t8, $t3, $t5
	add $t7, $t7, $t8
	sw $t7, 12($v0)
	
	lw $t4, 0($t1)
	lw $t5, 8($t1)
	mul $t7, $t2, $t4
	mul $t8, $t3, $t5
	add $t7, $t7, $t8
	sw $t7, 8($v0)
	
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp) 
	lw $t2,12($sp)
	lw $t3,16($sp)
	lw $t4,20($sp) 
	lw $t5,24($sp)
	lw $t6,28($sp)
	lw $t7,32($sp) 
	lw $t8,36($sp)
	addi $sp,$sp,40
	jr $ra
find: #this part is the same as ##### mmul implemented for you ##### 
	addi $sp,$sp,-32 #recursive need to protect the local varible
	sw $t6,28($sp) #protect t6 since the different level recursive call
	sw $t5,24($sp) #protect t5 since the different level recursive call
	sw $t4,20($sp) #protect t4 since the different level recursive call
	sw $t3,16($sp) #protect t3 since the different level recursive call
	sw $t2,12($sp) #protect t2 since the different level recursive call
	sw $t1,8($sp) #protect t1 since the different level recursive call
	sw $t0,4($sp) #protect t0 since the different level recursive call
	sw $ra,0($sp) #protect ra since the different level recursive call
	move $t0, $a0# $t0 = n
	li $a0, 16#r e q u e s tf o r16by tel o c a t i o nt oh o l dr e s u l tm atri x
	li $v0, 9#m a l l o csystemc a l l syscall
	syscall	
	li $t1, 1
	beq $t0, $t1, qone
 	div $t1, $t0, 2# $t1 = n/2
	mul $t2, $t1, 2 # $t2 = n/2*2
	sub $t3, $t0, $t2 # $t3 = n%2
	beq $t3, $zero, f2
	
	move  $a0, $t1 # $t1 = n/2
	jal find	#find(n/2)
	move $t4, $v0# $t4= r_2
	
	addi $t5, $t1, 1# $t5 = n/2+1
	move  $a0, $t5
	jal find #find(n/2+1)
	move $t5, $v0# $t5= r_2_
	
	move  $a0, $t4
	move  $a1, $t5
	jal mmul #mmul(r_2,r_2_)

	


	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp) 
	lw $t2,12($sp)
	lw $t3,16($sp)
	lw $t4,20($sp) 
	lw $t5,24($sp)
	lw $t6,28($sp)
	addi $sp,$sp,32
	jr $ra
	
func1_one:
	li $a0, 0
	li $v0, 1 #print syscall 1
	syscall
	li $v0, 10 #exit syscall 10
	syscall

qone:
	la $v0, Q1
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp) 
	lw $t2,12($sp)
	lw $t3,16($sp)
	lw $t4,20($sp) 
	lw $t5,24($sp)
	lw $t6,28($sp)
	addi $sp,$sp,32
	jr $ra
	
f2:
	move  $a0, $t1 # $t1 = n/2
	jal find
	move $t6, $v0# $t4= r
	
	move  $a0, $t6
	move  $a1, $t6
	jal mmul #mmul(r,r)
	 
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp) 
	lw $t2,12($sp)
	lw $t3,16($sp)
	lw $t4,20($sp) 
	lw $t5,24($sp)
	lw $t6,28($sp)
	addi $sp,$sp,32
	jr $ra
