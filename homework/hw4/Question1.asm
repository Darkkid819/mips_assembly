	.data
bigEndianMsg: .asciiz "Big endian\n"
littleEndianMsg: .asciiz "Little endian\n"

	.text
main:
	li $t0, 0x1234ABCD
    	sw $t0, 0($sp)
    	lb $t1, 0($sp)

    	li $t2, 0x12
    	beq $t1, $t2, bigEndian

    	la $a0, littleEndianMsg
    	j printMsg

bigEndian:
    	la $a0, bigEndianMsg

printMsg:
    	li $v0, 4
    	syscall

    	li $v0, 10
    	syscall
