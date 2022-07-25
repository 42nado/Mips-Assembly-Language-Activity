# Title: CHP3 LABTASK3
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
main:				# main program
		li $s1, 0x87654321			# pseudo instruction to initialize register
	
		sll $s2,$s1, 16 			# $s2 = 0x43210000
		srl $s3,$s1, 8 				# $s3 = 0x00876543
		sra $s4,$s1, 12 			# $s4 = 0xfff87654
	
		li $v0, 10				# service code to exit program
		syscall					# Exit program

