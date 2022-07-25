# Title: CHP3 LABTASK1
# Author: Daryll Anthony Fortunado
# Date: November 14, 2020
# Description:  ask the user to enter two integers A and B and then display the result of computing the expression: A + 2B - 5.
# Input: Two Integer
# Output: Integer value result of computing the expression: A + 2B - 5.
################# Data segment #####################
.data
display1: .asciiz "\nPlease Enter A : "
display2: .asciiz "\nPlease Enter B : "
ans:	   .asciiz	"Result :"
################# Code segment #####################
.globl main
.text
main:
	li 	$v0, 4		#service code for print sting
	la 	$a0, display1	#it will print prompt
	syscall
	li 	$v0,5		#service code for read integer
	syscall 		#ask user input
	move 	$t1, $v0 	#save a to $t1

	li 	$v0, 4		#service code for print sting
	la 	$a0, display2 	#Load address to display2 to $a0
	syscall			#it will print display2
	li 	$v0, 5		#service code for read integer
	syscall 		#ask user input
	move 	$t2, $v0 	#save a to t1

	mul 	$t2, $t2, 2 	#get 2B
	add 	$t4, $t1, $t2	#get A+2B
	sub 	$t6, $t5, 5 	#get A+2B-5
	la      $a0, ans	# write sum message
        li      $v0,4		#service code for printing string
	syscall
	move    $a0, $t6	# output sum
	li 	$v0, 1
	syscall 		#print
	li	$v0, 10		# Exit program
	syscall