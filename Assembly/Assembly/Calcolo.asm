	.data
error:	.asciiz "\nMi dispiace, ma non puó inserire 0 come divisore\n"

	.text
	.globl Calcolo
Calcolo:
	add $s0, $a0, $zero #primo operando
	add $s1, $a1, $zero #secondo operando
	add $s2, $a2, $zero #tipo di operazione
	
	beq $s2, 1, somma
	beq $s2, 2, diff
	beq $s2, 3, divi
	beq $s2, 4, molt
	beq $s2, 5, esci
	
	somma:
	add $s3, $s0, $s1
	
	j esci
	diff:
	sub $s3, $s0, $s1
	
	j esci
	divi:
	beq $s1, 0, exit_with_error #secondo operando = 0
	div $s0, $s1
	
	mfhi $s4 #resto
	mflo $s3 #quoziente
	move $v1, $s4
	
	j esci	
	molt:
	mul $s3, $s0, $s1
	
	j esci	

	exit_with_error:
	li $v0, 4
	la $a0, error 
	syscall #codice mal inserito dall'utente
	li $t0, 0 #per  far  capire  che l'operazione non é stata eseguita
	esci:
	move $v0, $s3
	
	jr $ra