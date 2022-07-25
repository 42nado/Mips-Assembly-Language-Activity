# Title: CHP2 LAB TASK 1
# Author: Daryll Anthony Fortunado
# Date: October 31, 2020
# Description:  Ask the user to enter an integer value, and then print the result of doubling that number.
# Input: Integer value
# Output: Doubled integer
################# Data segment #####################
.data
str1:	.asciiz		"Enter interger value :"
str2:	.asciiz		"Doubled value :"
################# Code segment #####################
.globl	main
.text
main:			# main program entry
	li	$t0, 2		#assign value to $t0
	li	$v0, 4		#service code for printing string
	la	$a0, str1	#load address of str1 to $a0
	syscall			#print str1 string
	li	$v0, 5		# service code for read integer
	syscall			#read integer and input into $v0
	move	$t1, $v0	#save input value to $t1
	add	$t3, $t1, $t1	#add $t1 to $t1
	li	$v0, 4		#service code for printing string
	la	$a0, str2	#load address of str1 to $a0
	syscall			#print str2 string
	li	$v0, 1		#sevice code to print integer
	move	$a0, $t3	#copy the doubled value
	syscall			#print integer
	li	$v0, 10		#service code to exit
	syscall			#exit program
	
