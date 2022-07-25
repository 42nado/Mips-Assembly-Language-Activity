# Title: CHP6 LABTASK6
# Author: Daryll Anthony Fortunado
# Date: 			
# Description: MIPS code to perform the following integer divisions. What is the value of the LO and HI registers
# Input: character
# Output:  lowercase char to uppercase char Or uppercase char to lowercase char
######################################### DATA SEGMENT ##############################################
# Given positive integers a and b, output a/b and a&b.
.data
	str1: .asciiz "Enter a: "
	str2: .asciiz "Enter b: "
	str3: .asciiz "a/b = "
	str4: .asciiz "a%b = "
	strS: .asciiz "a*b ="
	newline: .asciiz "\n"
.text
main: 
	li $v0, 4 	# system call code for print_string
	la $a0, str1 	# address of stri
	syscall 	# print strig
	#get the first number from user, put it into $s0
	li $v0, 5 	# system call code for read_int
	syscall 	# read an integer into $v@ from console
	add $s0, $v0, $zero # copy $v@ into $s@ (a)
	#read print_string for str2
	li $v0, 4 	# system call code for print_string
	la $a0, str2 	# address of stri
	syscall 	# print stri
	# get second number from user, put it into $t1
	li $v0, 5 	#load syscall for read_int
	syscall 	#make the syscall
	move $s1, $v0 	#move the number read into $s1(b)
	#DO THE CALCULATIONS... 
	div $s0, $s1 	#dividing $s0 by $s1
	mflo $t0 	#storing value of lo{quotient) in
	#register $t0
	mfhi $t1	 #storing value of hi({remainder) in
	#register $t1
	
	mflo $t0 	#storing value of lo(quotient) in
	#register $t@

	mfhi $t1 	#storing value of hi({remainder) in
		#register $t1

	mult $s0, $s1
	mflo $t2

	li $v0,1
	move $a0, $t2
	syscall

	li $v0,4
	la $a0, strS
	syscall
	#read print_string for str3
	li $v0, 4 	# system call code for print_string
	la $a0, str3 	# address of stri
	syscall # print stri
	#print a/b
	li $v0, 1 #load syscall print_int into $v@
	move $a0, $t0 #move the number to print into $t2
	syscall
	# read print string for str4
	li $v0, 4
	la $a0, str4
	syscall
	# print remainder
	li $v0, 1
	move $a0, $t1
	syscall
	#end of program
	li $v0, 10 #system call code for exit
	syscall