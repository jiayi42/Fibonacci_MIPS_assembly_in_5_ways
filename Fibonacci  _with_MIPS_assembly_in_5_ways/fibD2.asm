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
	
 	move $s0, $v0 # enter the n
 	beq $s0, $zero, func1_one#if n ==0 go func1_one
        slti $s1, $s0, 4
	



	la $a0,  Q1# Q1 be the f i r s t input matrix
	la $a1, Q1# Q1 be the second input matrix
	jal mmul #$v0=Q2=Q1xQ1
	move $s4, $v0 # $s4=Q2
	bne $s1, $zero, func2_one#if 0< n <=3 go func2_one
	beq $s1, $zero, loophead#else go loophead3

mmul : #this part is the same as ##### mmul implemented for you ##### 
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
	
	jr $ra
func1_one:
	li $a0, 0
	li $v0, 1 #print syscall 1
	syscall
	li $v0, 10 #exit syscall 10
	syscall
func2_one:
	move $t0,  $v0
	li $t1, 3
	sub $t1, $t1, $s0
	mul $t1, $t1, 4
	add $t1, $t0, $t1
	lw $a0, 0($t1)
	# move $a0, $t2
	
	li $v0, 1 #print syscall 1
	syscall
	li $v0, 10 #exit syscall 10
	syscall
 loophead :
  	li $s2, 3 #for n==3 casez
  	move $s1, $s0 #record i
  	move $s5, $s4 #record  this time(Qi-1)

 loopbody :
 	move $a0, $s5 #record  this time(Qi-1)
	la $a1, Q1#  Q1 be the second input matrix again
	jal mmul #  $v0 = Q3 = (Qi-1)xQ1
	move $s5, $v0#  (Qi)=(Qi-1)
	subi $s1, $s1, 1 #i=i-1

	bne $s1, $s2, loopbody #i!=n
	#if i==n is ok just print answer
	lw $a0, 0($v0)
	li $v0, 1 #print syscall 1
	syscall
	li $v0, 10 #exit syscall 10
	syscall
