	.data
result: .asciiz "The sum is: "
	.text
main:
	# set n and sum
	li $s0, 0 # sum
	li $s1, 5 # n
	li $t0, 0 # iterator
	
loop:
	addi $t0, $t0, 1
	add $s0, $s0, $t0
	beq $t0, $s1, end
	j loop
end:
	
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 10
	syscall