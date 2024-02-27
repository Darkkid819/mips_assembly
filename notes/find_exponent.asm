	.data
power: .asciiz "2^n = 128, n = "

	.text
main:
    li $s0, 0   # n
    li $s1, 1   # answer
    li $s2, 128 # Target value is 128

loop:
    beq $s1, $s2, end
    sll $s1, $s1, 1
    addi $s0, $s0, 1
    j loop

end:
    li $v0, 4
    la $a0, power
    syscall
    
    li $v0, 1
    move $a0, $s0
    syscall    

    li $v0, 10
    syscall
