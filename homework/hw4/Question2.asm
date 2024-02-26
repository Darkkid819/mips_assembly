	.data
number: .word 0x1234ABCD
decimalMessage: .asciiz "0x1234ABCD in decimal is: "
unsignedMessage: .asciiz "\n0x1234ABCD in unsigned decimal is: "
binaryMessage: .asciiz "\n0x1234ABCD in binary is: "
hexadecimalMessage: .asciiz "\n0x1234ABCD in hexadecimal is: "
swappedMessage: .asciiz "\n0x1234ABCD swapped is: "
evenOddMessage: .asciiz "\n0x1234ABCD is: "
evenMessage: .asciiz "even"
oddMessage: .asciiz "odd"

	.text
main:

	# A

	# Load method 1
	lui $s0, 0x1234
	ori $s0, $s0, 0xABCD
	
	# Load method 2
	li $s0, 0x1234ABCD

	# Load method 3
	la $a0, number
	lw $s0, 0($a0)
	
	# B
	
	# Print in decimal
	li $v0, 4
	la $a0, decimalMessage
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall

	# Print in unsigned decimal
	li $v0, 4
	la $a0, unsignedMessage
	syscall
	
	li $v0, 36
	move $a0, $s0
	syscall

	# Print in binary
	li $v0, 4
	la $a0, binaryMessage
	syscall
	
	li $v0, 35
	move $a0, $s0
	syscall

	# Print in hexadecimal
	li $v0, 4
	la $a0, hexadecimalMessage
	syscall
	
	li $v0, 34
	move $a0, $s0
	syscall
	
	# C
	
	# copy $s0
	move $t0, $s0
	
	# Swap method 1
	sll $t1, $s0, 16
	srl $t2, $s0, 16
	or $s0, $t1, $t2
	
	li $v0, 4
	la $a0, swappedMessage
	syscall
	
	li $v0, 34
	move $a0, $s0
	syscall
	
	# copy $t0 back to $s0
	move $s0, $t0

	# Swap method 2
	andi $t1, $s0, 0xFFFF0000
	sra $t1, $t1, 16
	andi $t2, $s0, 0x0000FFFF
	sll $t2, $t2, 16
	or $s0, $t1, $t2
	
	li $v0, 4
	la $a0, swappedMessage
	syscall
	
	li $v0, 34
	move $a0, $s0
	syscall
	
	# copy $t0 back to $s0
	move $s0, $t0
	
	# D
	
	# Even/Odd method 1
	li $v0, 4
	la $a0, evenOddMessage
	syscall
	
	andi $t1, $s0, 0x1
	beq $t1, $zero, even
	la $a0, oddMessage
	j odd
even:	la $a0, evenMessage
odd:	syscall

	# Even/Odd method 2
	la $a0, evenOddMessage
	syscall
	
	srl $t1, $s0, 1
	sll $t1, $t1, 1
	bne $t1, $s0, odd2
	la $a0, evenMessage
	j even2
odd2:   la $a0, oddMessage
even2:  syscall

	# Even/Odd method 3
	la $a0, evenOddMessage
	syscall
	
	andi $t1, $s0, 0x1
	beqz $t1, even3
	la $a0, oddMessage
	j odd3
even3:  la $a0, evenMessage
odd3:   syscall

	# Exit program
	li $v0, 10
	syscall
