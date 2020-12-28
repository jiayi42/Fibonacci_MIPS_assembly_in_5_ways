.data
#msg_str: 	.asciiz "Enter some number: би
.text
.globl main
main :
	#la $a0, msg_str
	#li $v0, 4
	#syscall 
	li $v0, 5  #read syscall 5
	syscall
 	move $a0, $v0 # enter the n
	jal fac 
	move $a0, $v0
	li $v0, 1 #print syscall 10
	syscall
	li $v0, 10 #exit syscall 10
	syscall
	
fac:
        move $s3, $a0
	bne $s3, $zero, loophead # if n!=0 go loophead 
	move $v0, $a0 #if n==0 just return 0
	jr $ra
	
loophead :
	li $t0, 1	 #  $t0= i=1
	li $t1, 1	 # $t1= f=1
	li $t2, 1 	 # $t2= f_=1
	li $t3, 2
	move $t4,$a0
	move $t7,$a0 	 # n=$t7

	div $t3, $t4, 2# $t3= n/2
	addi $t3, $t3, 1
	#li $t4, 0 	 #  $t4=f2
	#li $t5, 0	 # $t5=f2_
	#li $t6, 0	 # $t6=f_2
 loopbody :
 	slt $s0, $t0,$t3	
 	bne $s0, $zero, eee
 	add $t6, $t2, $t1	#f_2=f_+f;
	add $t1, $t2, $zero		#f=f_;
	add $t2, $t6, $zero		#f_=f_2;
	addi $t0, $t0, 1 #i=i+1
	kkk:
	#li $a0, 66
	#li $v0, 1 #print syscall 10
	#syscall	
 	slt $s3,$t0, $t7
	bne $s3, $zero, loopbody #i==n
	move $v0, $t1	       #return f;
	jr $ra
	
eee:	#if(i<=(n/2))
	mul $s1, $t1, $t1	#f*f;
	mul $t5, $t2, $t2	#f_*f_;
	add $t5, $s1, $t5	#f2_=f*f+f_*f_;

	add $s1, $t2, $t2	#2*f_;
	sub $s1, $s1, $t1	#2*f_-f;
	mul $t4, $t1, $s1	#f2=f*(2*f_-f);
	
	move $t1, $t4		#f=f2;
	move $t2, $t5		#f_=f2_;

	add $t0, $t0, $t0	#i=i*2
	j kkk
	#jr $ra
