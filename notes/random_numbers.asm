	.data
decimal: .asciiz "random number in decimal: "
hex: .asciiz "\nrandom number in hex: "
binary: .asciiz "\nrandom number in binary: "
	
	.text
main:
	# generate number from [-100,100]
	li $a1, 201
	li $v0, 42
	syscall
	
	addi $a0, $a0, -100
	move $s0, $a0

	# decimal
	li $v0, 4
	la $a0, decimal
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	# hex
	li $v0, 4
	la $a0, hex
	syscall
	
	move $a0, $s0
	li $v0, 34
	syscall
	
	# binary
	li $v0, 4
	la $a0, binary
	syscall
	
	move $a0, $s0
	li $v0, 35
	syscall
	
	li $v0, 10
	syscall