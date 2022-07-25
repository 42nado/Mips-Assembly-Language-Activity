# Title: CHP5 LABTASK5
# Author: Daryll Anthony Fortunado
# Date: 
# Description:  compute the addresses of arr2, arr3, str1, and str2, given that the address of arr1 is 0x10010000. Show your steps for a full mark.Select “Show Labels Window (symbol table)” from the Settings menu in MARS to check the values of your computed addresses.
# Input: 
# Output:  
############################## Data segment ########################################
.data
	ask: .asciiz "Enter number of rows and columns(n): "
	out: .asciiz "Output: \n"
############################## Code segment ########################################
.text
.globl main
main: 	
	la $a0, ask		#load address of ask into $a0
	li $v0, 4		#service code for print string
	syscall			#print ask
	
	li $v0, 5		# service code for read int
	syscall			# read n for nxn
	move $t0,$v0		# $t0 = n
	#allocating array into heap
	mul $t1,$t0,$t0		# $t1 = nxn
	sll $t1,$t1,4		# $t1 = nxnx4 because .word is 4 bytes; $t1 = bytes to allocate 
	move $a0,$t1		# $a0 = number of bytes to allocate, which is nxnx4 bytes
	li $v0,9		# service code for allocating bytes to the heap
	syscall			# allocate the bytes to the heap
	move $s1,$v0		# $s1 = address of the array
	
	la $a0, out		#load address of out into $a0
	li $v0, 4		#service code for print string
	syscall			#print out
	
	li $t2, 0		# $t2 = i = 0
	forloopi:		# for(i=0;i<n;i++)
	beq $t2,$t0,exitloopi	# if(i == n) exitloopi
	li $t3, 0		# $t3 = j = 0
	
	forloopj:		# for (j=0;j<n;j++)
	beq $t3,$t0,exitloopj	# if(i==n) jump to exitloopj
	addu $t4,$t2,$t3	# $t4 = i + j
	sw $t4, 0($s1)		# arr[i][j] = i + j
	
	blez $t2, next		# if (i <= 0) then skip the next instructions
	lw $s2,0($s1)		# $s2 = arr[i][j]
	sll $t5,$t0,2		# $t5 = nx4. the distance between arr[i][j] and arr[i-1][j] is columns x 4 
	subu $s1,$s1,$t5 	# $s1 = &arr[i-1][j]
	lw $s3,0($s1)		# $s3 = arr[i-1][j]
	addu $s2,$s2,$s3	# #s2 = arr[i][j] = arr[i][j] + arr[i-1][j]
	addu $s1,$s1,$t5   	# back $s1 to arr[i][j]
	sw $s2, 0($s1)		# arr[i][j] = $s2
	next:			# if (i<=0) the upper instructions will be skipped and jump into here
	
	blez $t3, skip		# if (j<=0) then skip the next instructions and jump to skip
	lw $s2, 0($s1)		# $s2 = arr[i][j]
	subu $s1,$s1,4		# $s1 = arr[i][j-1] because the distance of it to arr[i][j] is 4
	lw $s3, 0($s1)		# $s3 = arr[i][j-1]
	addu $s2,$s2,$s3	# $s2 = arr[i][j] +  arr[i][j-1]
	addu $s1,$s1,4		# back $s1 to arr[i][j]
	sw $s2, 0($s1)		# arr[i][j] = $s2
	skip:			# if (j<=0) it will jump into here
	
	lw $s2, 0($s1)		# $s2 = arr[i][j]
	move $a0,$s2		# $a0 = arr[i][j]
	li $v0,1		# service code for print int
	syscall			# print arr[i][j]
	la $a0, ' '		# $a0 = space character
	li $v0, 11		# service code for print char
	syscall			# print space
	addi $t3,$t3,1		# j++
	addu $s1,$s1,4		# $s1 = next &arr[i][j]
	j forloopj		# loop again to forloop j
	exitloopj:		#exit loop of j forloop
	
	la $a0, '\n'		# $a0 = new line
	li $v0, 11		# service code for print char
	syscall			# print new line
	addi $t2,$t2,1		# i++
	j forloopi		# loop again for loop i
	exitloopi:		# exit the loop of for loop i
	
	li $v0, 10		#exit program
	syscall
