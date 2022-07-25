# Title: CHP4 LAB TASK 2
# Author: Daryll Anthony Fortunado
# Date: 
# Description:  asks the user to enter two integers: n1 and n2 and prints the sum of all numbers from n1 to n2. For example, if the user enters n1=3 and n2=7, then the program should display the sum as 25.
# Input: two Integer value
# Output:  sum of integer Integer 
################# Data segment #####################
.data
	firstInt: .asciiz "Enter first integer: "
	secondInt: .asciiz "Enter second integer: "
	result: .asciiz "The sum is: "
	endLine: .asciiz "\n"
################# Code segment #####################
.globl	main
.text
main:
	#prompt for n1
	la $a0, firstInt	#load address of firstInt to $a0
	li $v0, 4		#service code for printing string
	syscall			#print firstInt string
	li $v0, 5		# service code for read integer
	syscall			#read integer and input into $v0
	#copy n1 to t0
	move $t0, $v0		#save input value to $t0
	#prompt for n2
	la $a0, secondInt	#load address of secondInt to $a0
	li $v0, 4		#service code for printing string
	syscall			#print secondInt string
	li $v0, 5		# service code for read integer
	syscall			#read integer and input into $v0
	#copy n2 to t1
	move $t1, $v0		#save input value to $t1
	#start with sum=0 and i=n1
	li $t2, 0 		#$t2 is sum
	move $t3, $t0 		#$t3 is i
	loop:
	#update the sum
	add $t2, $t2, $t3 	#add t3 to t2
	addi $t3, $t3, 1 	#increase t3
	ble $t3, $t1, loop 	#loop if t3 has not exceeded t1
	#print the sum
	la $a0, result		#load address of result to $a0
	li $v0, 4		#service code for printing string
	syscall			#print result string
	move $a0, $t2		#save  add value to $t2
	li $v0, 1		#sevice code to print integer	
	syscall			#print integer
	#print a newline
	la $a0, endLine		#load address of endLine to $a0
	li $v0, 4		#service code for printing string
	syscall			#print firstInt string
	#end the program
	li $v0, 10		#service code to exit
	syscall			#exit program

