	.text
	.globl reset
reset:
	li $s0, 0
	li $s1, 0
	li $s2, 0
	li $s3, 0
	li $s4, 0
	li $s5, 0
	li $s6, 0
	li $s7, 0
	
	li $v0, 0
	li $v1, 0
		
	jr $ra #ritorno al main