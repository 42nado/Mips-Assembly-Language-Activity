# Title: CHP3 LABTASK4
# Author: Daryll Anthony Fortunado
# Date: November 14, 2020			
# Description: This program will ask the user to enter a letter and convert Lowercase to Uppercase and Uppercase to Lowercase
# Input: character
# Output:  lowercase char to uppercase char Or uppercase char to lowercase char
######################################### DATA SEGMENT ##############################################
.data
	prompt: .asciiz "\nConvert Lowercase letter to Uppercase letter and Uppercase to lowercase"
	char: .asciiz "\nEnter a letter: "
	lower: .asciiz "\nUppercase to lowercase: "
	upper: .asciiz "\nLowercase to uppercase: "
	again: .asciiz "\nCharacter is not alphabetic "
######################################### CODE SEGMENT ##############################################
.text
	main:				# main program
		li $v0, 4		# service code for printing string
		la $a0, prompt		# load address of prompt to $a0
		syscall			# perform the request service
	
		li $v0, 4		# service code for printing string
		la $a0, char		# load address of char to $a0
		syscall			# perform to request service
	
		li $v0, 12		# service code for reading character
		syscall			# perform the request service
		move $s0, $v0		# copy input into $s0
	
		bge $s0, 'a' toupper	# if $s0 is greater than equal lowercase 'a', goto label toUP  
		bge $s0, 'A' tolower	# if $s0 is greater than uppercase 'A', goto label toLOW
		bge $s0, '0' main	# if $s0 is greater than or equal to '0' go to main
	
	tolower:				# toLOW program
		addi $s0, $s0, 0x20	# add imidiate the $s0 and 0x20. ex. user input: 'A' = 0x41 + 0x20 = 0x61. And the ASCII code in hexa of 'a' is 0x61
	
		li $v0, 4		# service code for printing string
		la $a0, lower		# load address of lower to $a0
		syscall			# perform the request service
	
		li $v0, 11		# service code for printing character
		move $a0, $s0		# copy the value of $s0 to $a0
		syscall			# perform the request service
	
		li $v0, 10		# service code to exit program
		syscall			# perform the request service
	
	toupper:				# toUP program
		subi  $s0, $s0, 0x20	# subtract imidiate the $s0 and 0x20. ex. user input: 'a' = 0x61 - 0x20 = 0x41. And the ASCII code in hexa of 'A' is 0x41.
	
		li $v0, 4		# service code for printing string
		la $a0, upper		# load imidiate upper to $a0
		syscall			# perform the request service
	
		li $v0, 11		# service code for printing charater
		move $a0, $s0		# copy input value of $s0 to $a0
		syscall			# perform the request service
	
		li $v0, 10		# service code for exit program
		syscall			# perform the request service
