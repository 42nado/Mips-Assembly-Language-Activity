# Title: CHP2 LAB TASK 3
# Author: Daryll Anthony Fortunado
# Date: October 31, 2020
# Description: MIPS program that asks the user to input his name and then prints "Hello ", followed by the name entered by the user.
# Input: String (name of user)
# Output: Hello followed by the String (name) entered by the user
################# Data segment #####################
.data
	hello: .asciiz "Hello "
	str: .space  20	# array of 20 bytes
################# Code segment #####################
.text
.globl main
main:		# main program entry
	
	la	$a0, str	# $a0 = address of str
	li	$a1, 20		# $a1 = max string length
	li	$v0, 8		# read string
	syscall 		#call the kernel write the sting
	li	$v0, 4		#service code for printing string
	la 	$a0, hello 	#load string address
	syscall
	li	$v0, 4		# speify sytem write service
	la 	$a0, str	# Print string str
	syscall
	li	$v0, 10		# Exit program
	syscall
