# Title: CHP4 LAB TASK 4
# Author: Daryll Anthony Fortunado
# Date: 
# Description:  asks the user to enter a positive integer number n and then prints the nth number in the Fibonacci sequence.
# Input: positive Integer value
# Output:  integer (nh number of fibonacci)
################# Data segment #####################
.data
	input: .asciiz "Enter a positive integer number: "
	output: .asciiz "th positive number in Fibonacci series is: "
	error_msg: .asciiz "Entered number is not a positive number...!!!"

.text
.globl main

main:

	li $v0,4 	# 4 is print string syscall
	la $a0,input 	# Load the address of the string to be printed
	syscall 	# Print the string
	li $v0,5 	# 5 is the read integer syscall
	syscall 	# Read the integer
	move $t0,$v0 	# $t0 = postive integer n
	bltz $t0,error 	# If input is lessthan zero print error msg and exit program
	bnez $t0,go 	# If input is zero print fibonacci number as zero
	li $v0,1 	# 1 is the print integer syscall
	move $a0,$t0 	# Load the integer to be printed
	syscall 	# Print the integer
	li $v0,4 	# 4 is print string syscall
	la $a0,output 	# Load the address of the string to be printed
	syscall 	# Print the string
	li $v0,1 	# 1 is the print integer syscall
	li $a0,0 	# Load the integer to be printed
	syscall 	# Print the integer
	j end 		# Jump to the label end

go: 
	li $t1,2 	# Initialize Loop variable, i
	li $t2,0 	# $t2 = Fib0
	li $t3,1 	# $t3 = Fib1

for: 	
	bge $t1,$t0,next # if i>=n, exit the loop
	move $t4,$t2 	# temp = Fib0
	move $t2,$t3 	# Fib0 = Fib1
	add $t3,$t4,$t2 # Fib1 = temp + Fib1
	addi $t1,$t1,1 	# Inrement loop variable
	b for 		# Repeat the loop

next: 
	li $v0,1 	# 1 is the print integer syscall
	move $a0,$t0 	# Load the integer to be printed
	syscall 	# Print the integer
	li $v0,4 	# 4 is print string syscall
	la $a0,output 	# Load the address of the string to be printed
	syscall 	# Print the string
	li $v0,1 	# 1 is the print integer syscall
	move $a0,$t3 	# Load the integer to be printed
	syscall 	# Print the integer

end: 
	li $v0,10 	# 10 is exit program syscall
	syscall 	# Exit the program

error: 
	li $v0,4 	# 4 is the print string syscall
	la $a0,error_msg # Load the address of the string to be printed
	syscall 	# Print the string
	j end 		# Jump to the label end
