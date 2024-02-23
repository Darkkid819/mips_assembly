	.data
prompt1: .asciiz "Enter first integer: "
prompt2: .asciiz "Enter second integer: "
sumMessage: .asciiz "The sum is: "
multiplyMessage: .asciiz "\nThe first number multiplied by 5 is: "
divideQuotient: .asciiz "\nThe quotient of the second number divided by 5 is: "
divideRemainder: .asciiz "\nThe remainder of the second number divided by 5 is: "
num1: .word 0
num2: .word 0
sum: .word 0
product: .word 0
quotient: .word 0
remainder: .word 0

	.text
main:
	# Prompt and read first integer
    	li $v0, 4
    	la $a0, prompt1
    	syscall
    	li $v0, 5
    	syscall
    	sw $v0, num1

    	# Prompt and read second integer
    	li $v0, 4
    	la $a0, prompt2
    	syscall
    	li $v0, 5
    	syscall
    	sw $v0, num2

    	# Calculate sum
    	lw $t0, num1
    	lw $t1, num2
    	add $t2, $t0, $t1
    	sw $t2, sum

    	# Display sum
    	li $v0, 4
    	la $a0, sumMessage
    	syscall
    	li $v0, 1
    	lw $a0, sum
    	syscall

    	# Multiply first number by 5 (Method 1: using multiply)
    	li $t3, 5
    	mult $t0, $t3
    	mflo $t4
    	sw $t4, product

    	# Display multiplication result
    	li $v0, 4
    	la $a0, multiplyMessage
    	syscall
    	li $v0, 1
    	lw $a0, product
    	syscall

    	# Multiply first number by 5 (Method 2: using left logical)
    	sll $t4, $t0, 2
    	add $t4, $t4, $t0

    	# Display multiplication result 
    	li $v0, 4
    	la $a0, multiplyMessage  
    	syscall 
    
    	li $v0, 1  
    	move $a0, $t4  
    	syscall     

    	# Divide second number by 5
    	li $t5, 5
    	div $t1, $t5
    	mflo $t6            # Quotient
    	mfhi $t7            # Remainder
    	sw $t6, quotient
    	sw $t7, remainder

    	# Display quotient
    	li $v0, 4
    	la $a0, divideQuotient
    	syscall
    	li $v0, 1
    	lw $a0, quotient
    	syscall

    	# Display remainder
    	li $v0, 4
    	la $a0, divideRemainder
    	syscall
    	li $v0, 1
    	lw $a0, remainder
    	syscall

    	# Exit program
    	li $v0, 10
    	syscall
