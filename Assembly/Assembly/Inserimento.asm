	.data
sel1:	.asciiz "\nInserisca il primo operando:\n"
sel2:	.asciiz "\nInserisca il secondo operando:\n"	
op1:	.asciiz "\nSelezioni l'operazione e prema invio:\nDigiti 1 per somma \nDigiti 2 per differenza \nDigiti 3 per divisione \nDigiti 4 per moltiplicazione \nDigiti 5 per uscire dalla parte di calcolo \n"

	.text
	.globl Inserimento
Inserimento:	
	ripeti:
	
	li $v0, 4
	la $a0, op1
	syscall
	
	li $v0, 5
	syscall #selezione operazione
	
	add $s2, $v0, $zero #codice operazione
	move $t0, $s2
	
	beq $s2, 5, esci   #nel caso non si intenda eseguire nessuna operazione
	bgt $s2, 5, ripeti #codice  errato
	blt $s2, 1, ripeti #codice errato
	
	li $v0, 4
	la $a0, sel1
	syscall
	
	li $v0, 5
	syscall
	add $s0, $v0, $zero #primo operando
	
	li $v0, 4
	la $a0, sel2
	syscall
	
	li $v0, 5
	syscall
	
	add $s1, $v0, $zero #secondo operando
	
	
	add $v0, $s0, $zero #salvataggio primo operando
	add $v1, $s1, $zero #salvataggio secondo operando

	
	esci:
	
	jr  $ra