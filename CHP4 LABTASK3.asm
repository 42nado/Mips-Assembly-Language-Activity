# Title: CHP4 LAB TASK 3
# Author: Daryll Anthony Fortunado
# Date: 
# Description:  Write a program that asks the user to enter an integer and then display the hexadecimalbrepresentation of that integer.
# Input: one Integer value
# Output:  hexadecimal representation of that integer
################# Data segment #####################
.data
   inMsg: .asciiz "Enter a number: "
   outMsg: .asciiz "The number in hexadecimal is "
################# Code segment #####################

.text
  
   #print string
   la $a0, inMsg	#load address of inMsg to $a0
   li $v0, 4		#service code for printing string
   syscall		#print inMsg string
  
   #read int
   li $v0, 5		# service code for read integer
   syscall		#read integer and input into $v0
   move $t0, $v0	#save input value to $t0

  
   la $a0, outMsg	#load address of outMsg to $a0
   li $v0, 4		#service code for printing string
   syscall		#print outMsg string
  
   #print int in hexadecimal using syscall 34
   move $a0, $t0	#save value to $t0
   li $v0, 34		#integer to hexadecimal
   syscall		#print integer in hexadecimal

   #exit
   li $v0, 10		#service code to exit
   syscall		#exit program
