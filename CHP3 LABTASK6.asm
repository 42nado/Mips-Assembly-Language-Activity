# Title: CHP3 LABTASK6
# Author: Daryll Anthony Fortunado
# Date: November 14, 2020
# Description: This program will ask the user to enter a signed number and display the result by multiplying by 24.5
# Input: Integer
# Output: Product of integer multiplied by 24.5
################# Data segment #####################
.data
	num: .asciiz "\nEnter a signed number: "
	float: .float 0.0
	float1: .float 24.5
	ans: .asciiz "\nThe result multiplied by 24.5 : "
################# Code segment #####################
.text
main:					# main program
	li $v0, 4			# service code for printing string
	la $a0, num			# load address the num to $a0
	syscall				# perform the request service
	
	lwc1 $f0, float			# $f0 will hold the user input with floating point
	lwc1 $f4, float1		# $f4 will hold the constant value, 24.5
	
	li $v0, 6			# service code for reading a float
	syscall				# perform the request service
	
	mul.s $f12, $f0, $f4		# get the product of $f0 and $f4 with single precision or 1 decimal point. ex user input = 5 || $f12 = 5 * 24.5 = $f12 122.5
	
	li $v0, 4			# service code for printing string
	la $a0, ans			# load address of result to $a0
	syscall				# perform the request service
	
	li $v0, 2			# service code for printing a float
	mov.s, $f12, $f12		# copy the value of $f12 to $f12 to print
	syscall				# perform the request service
	
	li $v0, 10			# service code for exit program
	syscall				# Exit program
	
	

