	.data
hi:	.asciiz "Benvenuto User \n"
out: 	.asciiz "\nAlla prossima"	
	
	.text
	.globl main
main:
	li $v0, 4
	la $a0, hi
	syscall #messaggio di benvenuto
	
	li $t1, 0 #inizializzazione counter di elementi in stack
	loop:
	
	jal Inserimento
	beq $t0, 5, nulla
	add $a0, $v0, $zero #primo operando
	add $a1, $v1, $zero #secondo operando
	add $a2, $t0, $zero #codice operazione
	
	jal reset
	
	jal Calcolo
	
	beq $t0, 0, nulla  #nessuna registrazione
	beq $t0, 3, resto  #caso divisione
	j next
	resto:
	add $sp, $sp, -4
	sw $v1, 0($sp) #resto divisione
	addi  $t1, $t1, 1
	
	next:
	add $sp, $sp, -4
	sw $v0, 0($sp) #risultato operazione
	addi  $t1, $t1, 1
	
	nulla:
	
	jal reset
	
	jal Richieste
	beq $v0, 6, esci #esci dal programma
	
	jal reset
	
	j loop #cicla
			
	esci:
	
	li $v0, 4
	la $a0, out
	syscall  #arrivederci
	
	li $v0, 10
	syscall	 #chiusura software
