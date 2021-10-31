	.data
last:	.asciiz "\nIl risultato della "
res:	.asciiz "\nIl resto é:\n"
som:	.asciiz "somma é:\n"
dif:	.asciiz "differenza é:\n"
divi:	.asciiz "divisione é:\n"
mol:	.asciiz "moltiplicazione  é:\n"
opz:	.asciiz "\nBenvenuto nel gestore cronologia\nDigiti 1 per sapere quanti elementi sono registrati\nDigiti 2 per la lista di tutti gli elementi\nDigiti 3 per cancellare l'ultimo elemento inserito\nDigiti 4 per Cancellare tutta la cronologia\nDigiti 5  per tornare al calcolo\nDigiti 6 per uscire\nUna volta digitato prema invio\n"
num:	.asciiz "\nGli elementi presenti nello stack sono :\n"
sp:	.asciiz "\n"

	.text
	.globl Richieste
Richieste:	
	
	beq $t0, 5, skip
	lw $s0, 0($sp) #carico ultimo risultato
	
	li $v0, 4
	la $a0, last
	syscall #stampa risultato
	
	beq $t0, 1, somma
	beq $t0, 2, diff
	beq $t0, 3, divis
	beq $t0, 4, molt
	skip: #se non sono state eseguite operazioni passa direttamente al menú 
	
	retry:
	
	li $v0, 4
	la $a0, opz
	syscall
	
	li $v0, 5
	syscall #selezione opzioni
	move $s2, $v0

	beq $s2, 1, numero
	beq $s2, 2, lista
	beq $s2, 3, delete
	beq $s2, 4, delete_all
	beq $s2, 5, esci
	beq $s2, 6, esci
	
	bgt $s2, 6, retry
	blt $s2, 1, retry #inserimento sbagliato
	
	j skip
	numero:
		li $v0, 4
		la $a0, num
		syscall
		li $v0, 1
		move $a0, $t1
		syscall
	j esci
	lista:
	beq $t1, 0, esci
	move $s4, $t1
		ciclo: #ciclo di stampa cronologia
		addi $s4, $s4, -1
		mul $s3, $s4, 4
		add $s5, $sp, $s3
		lw $s6, 0($s5) #spilling pop senza eliminazione
		li $v0, 4
		la $a0, sp
		syscall
		li $v0, 1
		move $a0, $s6
		syscall
		bnez $s4, ciclo
		
	j esci
	delete:
		add $sp, $sp, 4
		addi $t1, $t1, -1 #eliminazione ultimo risultato
	j esci
	delete_all:
	beq $t1, 0, esci
	j postit
		cicla:
		addi $t1, $t1, -1
		postit:
		add  $sp, $sp, 4
		bnez $t1, cicla
	j esci
	somma:
	li $v0, 4
	la $a0, som
	syscall
	li $v0, 1
	move $a0, $s0
	syscall #stampa risultato
	
	j skip
	diff:
	li $v0, 4
	la $a0, dif
	syscall
	li $v0, 1
	move $a0, $s0
	syscall #stampa risultato
	
	j skip
	divis:
	li $v0, 4
	la $a0, divi
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	lw $s1, 4($sp) #carico resto
	li $v0, 4
	la $a0, res
	syscall
	li $v0, 1
	move $a0, $s1
	syscall #stampa risultato
	
	j skip
	molt:
	li $v0, 4
	la $a0, mol
	syscall
	li $v0, 1
	move $a0, $s0
	syscall #stampa risultato
	
	j skip
	
	esci:
	move $v0, $s2
	jr $ra