.data
	prompt: .asciiz "Enter the position of N-th element: "

.text
	#Print the prompt
	li $v0,4
	la $a0,prompt
	syscall
	
	#To get the input N
	li $v0,5
	syscall
	add $a0,$v0,$zero
	
	#call the recursive function
	jal Fibonacci
	li $a0,0
	j exit
	
	Fibonacci:
		#Stack Pointer
		subu $sp,$sp,12
		#2 nop
		nop
		nop
		sw $ra,0($sp)
		sw $s0,4($sp)
		sw $s1,8($sp)
		
		add $s0,$a0,$zero
		
		#Base Case when N<=0
		ble $a0,0,baseCase0
		nop
		nop
		nop
		#Base Case when N>0 & N<=2
		ble $a0,2,baseCase1
		nop
		nop
		nop
		#Base Case when N>=47
		bge $a0,47,baseCase2
		nop
		nop
		nop
	
		#Decreasing N to N-1
		addi $a0,$s0,-1	
		jal Fibonacci #First recursive call of f(N-1)
		add $s1,$v0,$zero
		
		#Decreasing N to N-2
		addi $a0,$s0,-2
		jal Fibonacci #Second recursive call of f(N-2)
		add $v0,$s1,$v0
		
		exitFibonacci:
			lw $ra,0($sp)
			lw $s0,4($sp)
			lw $s1,8($sp)
			addi $sp,$sp,12
			jr $ra
	
		baseCase0:
			li $v0,0
			j exitFibonacci
	
		baseCase1:
			li $v0,1
			j exitFibonacci
		
		baseCase2:
			li $v0,0
			j exitFibonacci
			
exit: 	
	
