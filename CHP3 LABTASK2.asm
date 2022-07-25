# Title: CHP3 LABTASK2
# Author: Daryll Anthony Fortunado
# Date: November 14, 2020
# Description:   Determine the content of registers
# Input: none
# Output: resulting register content after executing the program
################# Data segment #####################
.data

################# Code segment #####################
.globl	main
.text
main:			#main
	li 	$s1,0x12345678	# pseudo instruction to initialize register
	li 	$s2,0xffff9a00	# pseudo instruction to initialize register
	and 	$s3,$s1,$s2	# $s3 =	0x12341200
	or 	$s4,$s1,$s2	# $s4 =	0xffffde78
	xor 	$s5,$s1,$s2	# $s5 =	0xedcbcc78
	nor 	$s6,$s1,$s2	# $s6 =	0x00002187
	li	$v0, 10		# service code to exit program
	syscall			# Exit program
