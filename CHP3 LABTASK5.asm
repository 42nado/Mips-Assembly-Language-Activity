# Title: CHP3 LABTASK5
# Author: Daryll Anthony Fortunado
# Date: November 14, 2020
# Description: This program will ask the user to enter an integer then ask him to enter a bit position (between 0 and 31) and display the value of that bit.
# Input: Integer
# Output: Display the value of that bit.
######################################### DATA SEGMENT ##############################################
.data
	prompt:  .asciiz "\nEnter an integer: "         
	bit:  .asciiz "\nEnter a bit position (between 0 and 31): "  
	result:  .asciiz "\nBit position : "     
######################################### CODE SEGMENT ##############################################
.text
	main:					# main program
		li $v0, 4          		# service code for print string
		la $a0, prompt          	# load address of prompt to $a0
		syscall           		# perform the service request
		
		li $v0, 5         		# service code for reading an integers   
		syscall           		# perform the request service  
		move $t0, $v0      		# move the value of $v0 to $t0
		
		li $v0, 4          		# service code for printing a string
		la $a0, bit			# load address of bit into $a0
		syscall           		# perform the request service
		
		li $v0, 5         		# service code for reading an integers   
		syscall           		# perform the request service 
		move $t1, $v0      		# move the value of $v0 to $t1
		
		srlv $t2, $t0, $t1		# the user input by prompt will convert into binary by srlv, and will cut right to left by the user input bitpos and display the remaining binary numbers.
		andi $t3, $t2, 1		# the andi will solve like a truth table
		
		li $v0, 4          		# service code for printing a string
		la $a0, result          	# load address of result into $a0
		syscall           		# perform the request service
		
		li $v0, 1			# service code for printing an integers
		move $a0, $t3 			# move the value of $t3 to $a0
		syscall 			# perform the request service
		
		li $v0, 10         		# service code to exit program
		syscall            		# # Exit program
