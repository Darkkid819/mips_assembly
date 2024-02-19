.data
promptString: .asciiz "Enter a string: "
promptNumber: .asciiz "\nEnter a number: "
enteredString: .asciiz "You entered the string: "
enteredNumber: .asciiz "\nYou entered the number: "
incrementMsg: .asciiz "\nIncremented number: "
buffer: .space 256       # Allocate space for string input

.text

main:
    # Prompt for string input
    li $v0, 4
    la $a0, promptString
    syscall

    # Read string
    li $v0, 8
    la $a0, buffer
    li $a1, 256
    syscall

    # Prompt for number input
    li $v0, 4
    la $a0, promptNumber
    syscall

    # Read number
    li $v0, 5
    syscall
    move $t0, $v0         # Store the entered number in $t0

    # Display entered string
    li $v0, 4
    la $a0, enteredString
    syscall
    li $v0, 4
    la $a0, buffer
    syscall

    # Display entered number
    li $v0, 4
    la $a0, enteredNumber
    syscall
    li $v0, 1
    move $a0, $t0
    syscall

    # Increment the number and display the result
    addi $t1, $t0, 1      # Increment the number by 1
    li $v0, 4
    la $a0, incrementMsg
    syscall
    li $v0, 1
    move $a0, $t1
    syscall

    # Exit program
    li $v0, 10
    syscall
