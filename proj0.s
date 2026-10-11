# N = (4017200%8)+9 = 9	
	.data
	ID: .asciiz "\n@04017200\n"
	.text
main:
	li $t0, 0
	li $t1, 9
	loop:
		beq $t0, $t1, exit
		li $v0, 4
		la $a0, ID
		syscall
		addi $t0, $t0, 1
		j loop
	exit:
		li $v0, 10
		syscall

	