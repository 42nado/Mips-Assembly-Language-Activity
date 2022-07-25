#Title:  CH6-LAB TASK4		
#Author: Daryll Anthony Fortunado		
#Date: 
# Description:   Write MIPS code to perform the following integer divisions.
# Input: What is the value of the LO and HI registers?
# Ouput: integer
#################################### DATA SEGMENT#################



################### CODE SEGMENT ####################################
.text

main:	# convert string to integer
	li $t6, 0x00
	li $t7, 0x09
	li $v0, 0x00
	move $t0, $a0
	lb $t1, ($t0)

loop :
	blt $t1, $t6, Done	# char < a
	bgt $t1, $t7, Done	# char > 9
	subu $t1, $t1, $t6 	# convert char to int
	mul $v0, $v0, 10	# multiply by 10
	add $v0, $v0, $t1

	addiu $t0, $t0, 1	# point to next char
	lb $t1, ($t0)		# load $t1 next digit
	bne $t1, $0, loop	# repeat if not end of string
	jr $ra 			# return integer


Done :
	li $v0, -1		#exit program if string not a number
	jr $ra			# return -I in $v0
