# N = (4017200%8)+9 = 9	
	.data
	ID: .asciiz "\n@04017200\n"
	.text
main:
	li $v0, 4
	la $a0, ID
	syscall

	li $v0, 10
	syscall

	