.data
message:    .asciiz "Demo Program for Data Segment Variables\n"
intVar:     .word 12345                # 32-bit integer
arrayVar:   .word 10, 20, 30, 40       # Array of 32-bit integers
byteVar:    .byte 127                  # 8-bit integer
halfVar:    .half 1234                 # 16-bit integer
buffer:     .space 20                  # Allocate 20 bytes of space
stringVar:  .asciiz "Hello, MIPS!"     # Null-terminated string

.text

main:
    # Print the message string
    li $v0, 4
    la $a0, message
    syscall

    # Load and print the integerVar value
    li $v0, 1
    lw $a0, intVar
    syscall

    # Load and print the first element of arrayVar
    la $t0, arrayVar
    lw $a0, 0($t0)
    li $v0, 1
    syscall

    # Modify and store a new value in byteVar
    li $t1, 0xFF
    sb $t1, byteVar

    # Modify and store a new value in halfVar
    li $t2, 0xFFFF
    sh $t2, halfVar

    # Print stringVar
    li $v0, 4
    la $a0, stringVar
    syscall

    # Exit program
    li $v0, 10
    syscall
