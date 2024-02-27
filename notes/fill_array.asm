	.data
arr: .space 40
length: .word 10
newLine: .asciiz "\n"

	.text
main:
	la $a2, arr
	li $t1, 10
	
loop:	
	beq $t1, $0, display
	
	li $v0, 42
	li $a1, 101
	syscall
	
	sw $a0, 0($a2)
	addi $a2, $a2, 4
	addi $t1, $t1, -1
	j loop
	
display: 
	la $a2, arr
	li $t1, 10
	
loop2: 
	beq $t1, $0, end

	lw $a0, 0($a2)
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	addi $a2, $a2, 4
	addi $t1, $t1, -1
	j loop2

end:
	
	li $v0, 10
	syscall	
