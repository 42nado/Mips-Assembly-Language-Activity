# Title: CHP3 LABTASK1
# Title: CHP3 LABTASK7
# Author: Daryll Anthony Fortunado
# Date: November 14, 2020
# Description: This program will ask the user to enter an unsigned number then swap the bits at odd position with those at even position and display the resulting number.
# Input: an unsigned number
# Output: swap bits at odd and even bit position and display the resulting number
######################################### DATA SEGMENT ##############################################
.data
	prompt: .asciiz "\nEnter an integer: "
	swapbits: .asciiz "\nThe number swapped at odd and even bit position is: "
######################################### CODE SEGMENT ##############################################
.text
	main:				# main program
		li $v0, 4			# service code for printing a string
		la $a0, prompt			# load address of prompt to $a0
		syscall				# perform the request service

	
		li $v0, 5			# service code for reading an integer
		syscall				# perform the request service
		move $t0, $v0			# move the input value of $v0 to $t0

	
		add $t1, $zero, $t0		# copy input and will to store the value to $t1
		add $t2, $zero, $t0		# copy input and will to store the value to $t1
		add $t3, $zero, 1		# Add 1 to the register and store to $t3
						# switching even and odd bits
		li $s1, 0xAAAAAAAA		# even bits
		li $s2, 0x55555555		# odd bits
		
		and $t1, $t1, $s1		
		and $t2, $t2, $s2
		srav $t1, $t1, $t3
		sllv $t2, $t2, $t3
		or $t1, $t1, $t2
		
		li $v0, 4			# service code for printing a string
		la $a0, swapbits		# load address of swapbits to $a0
		syscall				# perform the request service
	
		li $v0, 1			# service code for printing an integer
		move $a0, $t1			# move the valur of $t1 to $a0
		syscall				# perform the request service 
	
		li $v0, 10			# service code for exit program
		syscall				# perform the request service
