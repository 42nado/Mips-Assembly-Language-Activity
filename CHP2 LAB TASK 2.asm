# Title: CHP2 LAB TASK 2
# Author: Daryll Anthony Fortunado
# Date: October 31, 2020
# Description: "\nRepeat [y/n]? " instruction to repeat the main function if the user input is character 'y'.
# Input: One character (y/n)
# Output: repeat main function if the user input is character 'y' else end
.data
str1:	.asciiz		"\nRepeat[y/n]?"
################# Data segment #####################
.globl	main
.text
################# Code segment #####################
main:
	li	$t0, 'y'	#assign value to $t0
	li	$v0, 4		#service code for printing string
	la	$a0, str1	#load string address
	syscall
	li	$v0, 12		#read integer
	syscall 		#call the kernel write the char
	move	$t1, $v0
	beq 	$t0, $t1, repeat 	# check if equal or not
	li	$v0, 10		#service code to exit
	syscall			#exit program
repeat:		#branch intruction to repeat main
	b main			# branch to label main
