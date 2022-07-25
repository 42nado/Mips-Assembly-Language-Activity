# Title: CHP5 LABTASK3						
# Author: Daryll Anthony Fortunado					
# Description: In problem 1, given that arr3 is a two-dimensional array of bytes with 20 rows and 5 columns, what are the addresses of arr3[7][2], arr3[11][4], and arr3[19][3]?
# Input: index of array (integer; i and j)
# Output: address of the array[i][j]
######################################## Data segment #########################################
.data   
	msg:	.asciiz "Give a index value to compute address \n"
	msg1:	.asciiz "[i]: "
	msg2:	.asciiz "[j]: "
	msg3:	.asciiz "The address of index is: "
######################################## Code segment #########################################
.text  
.globl main
	main: 					# main program
		li $v0, 4			# service code for print string
		la $a0,msg			# load address of msg to $a0
		syscall				# print string
		
		li $s0, 0x10010058		# $t0 = address of arr3 based on problem 1
		li $t4, 5			# initialize columns
		li $t3, 4			# initialize element size (4 bytes)
		
		li $v0, 4			# service code for print string
		la $a0,msg1			# load address of msg1 to $a0
		syscall				# print string
		
		li $v0, 5			# service code for read integer
		syscall				# read integer
		move $t0, $v0			# move input value from $v0 into $t0
		
		li $v0, 4			# service code for print string
		la $a0,msg2			# load address of msg2 to $a0
		syscall				# print string
	
		li $v0, 5			# service code for read integer
		syscall				# read integer
		move $t2, $v0			# move input value from $v0 into $t2	
	
		mul $t1, $t0, $t4		# $t1 = i x cols
		add $t1, $t1, $t2		# $t1 = i x cols + j
		mul $t1, $t1, $t3		# $t1 = (i x cols + j )* size
		add $t1, $t1, $s0		# $t1 = base address (i x cols + j )* size

		li $v0, 4			# service code for print string
		la $a0, msg3			# load address of s msg3 to $a0
		syscall				# print string
	
		li $v0, 34			# service code for print integer in hexadecimal
		move $a0, $t1			# move value of $t0 into $a0
		syscall				# print integer in hexadecimal
			
		li $v0, 10			# service code for exit program
		syscall				# exit program