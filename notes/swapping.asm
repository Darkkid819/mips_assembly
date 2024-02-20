.data
num1:	.word	0x1234ABCD

	.text

main:
	
	
	# load 0x1234ABCD into register
	lui $t0, 0x1234
	ori $t1, $t0, 0xABCD
	
	# swap upper 16 bit and lower 16 bits
	sll $t2, $t1, 16
	srl $t3, $t1, 16
	or $t4, $t2, $t3
	
	# swap middle and outside bytes
	andi $s1, $t1, 0xFF000000
	andi $s2, $t1, 0x00FF0000
	andi $s3, $t1, 0x0000FF00
	andi $s4, $t1, 0x000000FF
	srl $s1, $s1, 24
	srl $s2, $s2, 8
	sll $s3, $s3, 8
	sll $s4, $s4, 24
	add $s5, $s1, $s2
	add $s6, $s3, $s4
	add $s0, $s5, $s6

    li $v0, 10
	syscall
	
