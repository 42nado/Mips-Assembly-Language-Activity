# Title: CHP2 LAB TASK 5
# Author: Daryll Anthony Fortunado
# Date: October 31, 2020
# Description: MIPS program that inputs two integer values. The program should output equal if the two integers are equal. Otherwise, it should output not equal. Use the branch instruction to check for equality.
# Input: Two integer
# Output: Equal or Not Equal
.data
display1: .asciiz	"Enter first number:"
display2:  .asciiz	"Enter second number:"
str1:	.asciiz		"Equal"
str2:	.asciiz		"Not Equal"
################# Code segment #####################
.globl	main
.text
main:
	li	$v0, 4		#service code for print sting
	la	$a0, display1 	#Load address to display1 to $a0
	syscall			#Print string
	li	$v0, 5		#service code for read integer
	syscall			#Read integer input to $v0
	move	$t0, $v0	#save input value to $t0
	li	$v0, 4		#service code for print sting
	la	$a0, display2	#Load address to display1 to $a0
	syscall
	li	$v0, 5		#service code for read integer
	syscall			#Read integer input to $v0
	move	$t1, $v0	#save input value to $t1
	beq $t0, $t1, equal 	# check if equal or not
	bne $t0, $t1, notequal  # check if equal or not
	syscall
	li	$v0, 10		# Exit program
	syscall
equal:	
	li	$v0, 4		#service code for print sting
	la	$a0, str1 	#Load address to str1 to $a0
	syscall			#Print string
	li	$v0, 10		# Exit program
	syscall
notequal:	
	li	$v0, 4		#service code for print sting
	la	$a0, str2 	#Load address to str2 to $a0
	syscall	
	li	$v0, 10		# Exit program
	syscall

