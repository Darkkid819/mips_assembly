	.data
prompt1: .asciiz "Please enter two numbers:\n"
prompt2: .asciiz "The numbers are the same"
prompt3: .asciiz "The numbers are not the same"

	.text
main:
	# enter 2 numbers put them in $s0, $s1
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	# compare $s0 and $s1, display message: the numbers are the same or not the same
	beq $s0, $s1, eq
	la $a0, prompt3
	j neq
eq:     la $a0, prompt2
neq:    li $v0, 4
	syscall
	
	# display if s0  is less than s1
	
	
	li $v0, 10
	syscall
