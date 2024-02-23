	.data
msg1: .asciiz "Computer Architecture and Organization\n"
msg2: .asciiz "SCCC – Computer Science Program\n"

	.text

main:
	li $v0, 4
    	la $a0, msg1
    	syscall 

    	li $v0, 4
    	la $a0, msg2
    	syscall

    	li $v0, 10
    	syscall