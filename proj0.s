# N = (4017200%8)+9 = 9	
	.data
	ID: .asciiz "@04017200"
	
	.text
main:
	li $t0, 0
	li $t1, 9
	li $t6, -1
	li $t7, 8
	forwardouterloop:
		beq $t0, $t1, backwardouterloop #to print N times
		li $t2, 0
		forwardinnerloop:
			beq $t2, $t1, printnext1 #to loop through ID whose length is also 9
			add $t3, $t0, $t2 #using $t0 to left shift printing of ID each time

			#Logic to wrap around and add each string to the end
			div $t3, $t1 #using MOD 9 to wraparound when index reaches 9
			mfhi $t5 #Remainder : Points to each index serially and wraps around after reaching index 9
			la $a1, ID
			add $t4, $a1, $t5
			lb $a0, 0($t4)
			li $v0, 11
			syscall
			addi $t2, $t2, 1
			j forwardinnerloop
			
		printnext1:
			li $v0, 11 
			li $a0, 10 #ASCII 10 is used to print a newline
			syscall
			addi $t0, $t0, 1
			j forwardouterloop

	backwardouterloop: #starting index : (9-1)%8 = 8
		beq $t7, $t6, exit
		li $t8, 8
		backwardinnerloop:
			beq $t8, $t6, printnext2
			add $t9, $t7, $t8
			div $t9, $t1
			mfhi $t0
			
			
					
			
			
		
	exit:
		li $v0, 10
		syscall

	