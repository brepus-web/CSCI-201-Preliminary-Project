# N = (4017200%8)+9 = 9	
	.data
	ID: .asciiz "@04017200"
	
	.text
main:
	li $t0, 0
	li $t1, 9
	outerloop:
		beq $t0, $t1, exit #to print N times
		li $t2, 0
		innerloop:
			beq $t2, $t1, printnext #to loop through ID whose length is also 9
			add $t3, $t0, $t2 #using $t0 to left shift printing of ID each time
			la $a1, ID
			add $t4, $a1, $t3
			lb $a0, 0($t4)
			li $v0, 11
			syscall
			addi $t2, $t2, 1
			j innerloop
			
		printnext:
			li $v0, 11
			li $a0, 10
			syscall
			addi $t0, $t0, 1
			j outerloop
	exit:
		li $v0, 10
		syscall

	