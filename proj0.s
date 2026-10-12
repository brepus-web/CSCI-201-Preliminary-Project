# N = (4017200%8)+9 = 9	
	.data
	ID: .asciiz "@04017200"
	
	.text
main:
	li $t0, 0
	li $t1, 9
	outerloop:
		beq $t0, $t1, exit
		li $t2, 0
		innerloop:
			beq $t2, $t1, printnext
			add $t3, $t0, $t2 #calculates new offset each time
			li $t4 ,9
			div $t3,$t4
			mfhi $t5 #wraps around to print the 0th index character
			
		printnext:
			addi $t0, $t0, 1
			j outerloop
	exit:
		li $v0, 10
		syscall

	