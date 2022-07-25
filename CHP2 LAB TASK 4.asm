# Title: CHP2 LAB TASK 4
# Author: Daryll Anthony Fortunado
# Date: October 31, 2020
# Description: Write a MIPS program that executes the statement: s = (a + b) – (c + 101), where a, b, and c are user provided integer inputs, and s is computed and printed as an output.
# Input: Three Integer
# Output: Integer value computed with s = (a + b) – (c + 101)
################# Data segment #####################
.data
display1: .asciiz	"Enter A:"
display2:  .asciiz	"Enter B:"
display3:  .asciiz	"Enter C:"
s_ans:	   .asciiz	"S :"
################# Code segment #####################
.globl	main
.text
main:
	li 	$t3, 101	#assign value to $t3
	li	$v0, 4		#service code for print sting
	la	$a0, display1 	#Load address to display1 to $a0
	syscall			#Print string
	li	$v0, 5		#service code for read integer
	syscall			#Read integer input to $v0
	move	$t0, $v0	#save input value to $t0
	li	$v0, 4		#service code for print sting
	la	$a0, display2	#Load address to display2 to $a0
	syscall
	li	$v0, 5		#service code for read integer
	syscall			#Read integer input to $v0
	move	$t1, $v0	#save input value to $t1
	li	$v0, 4		#service code for print sting
	la	$a0, display3 	#Load address to display3 to $a0
	syscall			#Print string
	li	$v0, 5		#service code for read integer
	syscall			#Read integer input to $v0
	move	$t2, $v0	#save input value to $t2
	addu 	$t0, $t0, $t1 	# accumulate the sum
	addu	$t2, $t2, $t3	# accumulate the sum
	sub	$t4, $t0, $t2	# accumulate the difference
	la      $a0, s_ans	# write sum message
        li      $v0,4		#service code for printing string
	syscall
	move    $a0, $t4	# output sum
        li      $v0, 1
        syscall
	li	$v0, 10		# Exit program
	syscall
