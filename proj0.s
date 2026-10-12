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
		lb $t2, 0($a0)
		
		li $t3, 0
		shiftloop:
			beq $t3, 8, shiftexit
			add $t4 ,$a0, $t3 #address of character to be shifted each time in ID
			lb $t5, 1($t4) #character after the address of the character to shift
			sb $t5, 0($t4)
			addi $t3,1
			j shiftloop 
			
		
		shiftexit:
			addi $t0, $t0, 1
			j loop
	exit:
		li $v0, 10
		syscall

	