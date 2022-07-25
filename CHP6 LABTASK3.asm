# Title:CHP6 LAB TASK 3
# Author: Daryll Anthony Fortunado
# Date: 
# Description: Write a MIPS program that computes the factorial of a number n input by the user, and display the result on the screen. Run your code and record the maximim 32-bit factorial value that can be computed without errors.
# Input: integer n
# Output: factorial of the integer n
#################### Data segment ######################
.data
str1:	.asciiz		"Input an integer: "
str2:	.asciiz		"Factorial "
char:	.asciiz		": "

#################### Code segment ######################
.text
.globl main
main:	
	li	$v0,	4	# service code for print string
	la	$a0,	str1	# load address of str1 to $a0
	syscall			# print string str1
	li	$v0,	5	# service code for read integer
	syscall			# read integer
	move	$t5,	$v0	# move value of $v0 to $t5
	move	$a0,	$v0	# move value of $v0 to $a0
	jal	fact		# jump and link to fac label
	move	$t0,	$v0	# move value of $v0 to $t0
	li	$v0,	4	# service code for print string
	la	$a0,	str2	# load address of str2 to $a0
	syscall			# print string str2
	li	$v0,	1	# service code for print integer
	la	$a0,	($t5)	# load value of $t5 to $a0
	syscall			# print integer
	li	$v0,	4	# service code for print integer
	la	$a0,	char	# load address of char to $a0
	syscall			# print string char
	li	$v0,	1	# service code for print integer
	move 	$a0,	$t0	# load value of $t0 to $a0
	syscall			# print integer
	li	$v0, 	10	# service code for end program
	syscall			# end program
fact:
	addi	$sp, $sp, -8	# add $sp to -8
	sw	$s0,	4($sp)	# store byte 4($sp) to $s0
	sw	$ra,	0($sp)	# store byte 0($sp) to $ra
	bne	$a0, 0, else	# check if $a0 is equal to 0, if true go to else label
	addi	$v0, $zero, 1	# add zero and 1 and store in $v0
	j	fact_return	# jump to fact return label
else:
	move	$s0, $a0	# move value of $a0 to $s0
	addi	$a0, $a0, -1	# add the value of $a0 to -1
	jal	fact		# jump and link to fac label
	multu	$s0, 	$v0	# multiply $s0 and $v0
	mflo	$v0		# move LO register to $v0
fact_return:
	lw	$s0,	4($sp)	# load sord of 4($sp) to $s0
	lw	$ra,	0($sp)	# load word of 0($sp) to $ra
	addi	$sp, $sp, 8	# add $sp to 8
	jr	$ra		# jump to register $ra
