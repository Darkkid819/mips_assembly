	.data
prompt1: .asciiz "Enter the first number: "
prompt2: .asciiz "Enter the second number: "
question1: .asciiz "What is "
question2: .asciiz " - "
question3: .asciiz "?\n"
correctMsg: .asciiz "Correct!\n"
incorrectMsg: .asciiz "Incorrect!\n"

	.text
main:
	# A
	
	li $v0, 4
	la $a0, prompt1
	syscall

	li $v0, 5
	syscall
    	move $t0, $v0

    	li $v0, 4
    	la $a0, prompt2
    	syscall

    	li $v0, 5
    	syscall
    	move $t1, $v0
    
        # B

    	bge $t0, $t1, compare

    	move $t2, $t0
    	move $t0, $t1
    	move $t1, $t2

compare:
    	li $v0, 4
    	la $a0, question1
    	syscall

    	move $a0, $t0
    	li $v0, 1
    	syscall

    	li $v0, 4
    	la $a0, question2
    	syscall

    	move $a0, $t1
    	li $v0, 1
    	syscall

    	li $v0, 4
    	la $a0, question3
    	syscall

    	sub $t3, $t0, $t1
    
    	# C

    	li $v0, 5
    	syscall
    	move $t4, $v0
    
	# D

    	beq $t3, $t4, correctAnswer
    	j incorrectAnswer

correctAnswer:
    	li $v0, 4
    	la $a0, correctMsg
    	syscall
    	j end

incorrectAnswer:
    	li $v0, 4
    	la $a0, incorrectMsg
    	syscall

end:
    	# Exit the program
    	li $v0, 10
    	syscall
