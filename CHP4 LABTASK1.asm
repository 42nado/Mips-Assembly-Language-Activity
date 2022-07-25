# Title: CHP4 LAB TASK 1
# Author: Daryll Anthony Fortunado
# Date: 
# Description:  asks the user to enter an integer and then displays the number of 1's in theb binary representation of that integer..
# Input: Integer value
# Output: binary representation Integer 
################# Data segment #####################
.data
   inMsg: .asciiz "Enter a number: "
   outMsg: .asciiz "The number of 1s = "
################# Code segment #####################
.globl	main
.text
main:  
   #print string
   la $a0, inMsg	#load address of inMsg to $a0
   li $v0, 4		#service code for printing string
   syscall		#print inMsg string
  
   #read int
   li $v0, 5		# service code for read integer
   syscall		#read integer and input into $v0
   move $t0, $v0	#save input value to $t0

   li $t1, 0 		#initialize counter
loop:
   beq $t0, 0, end_loop	# branch to End_loop 
   and $t2, $t0, 1	#add $t0 to $t1
   beq $t2, 0, next	# branch to next 
   add $t1, $t1, 1 	#increment count
next:
   srl $t0, $t0, 1	#moves the bits right (higher to lower)
   b loop		#branch to loop
  
end_loop:

   #display the results
   la $a0, outMsg	#load address of outMsg to $a0
   li $v0, 4		#service code for printing string
   syscall		#print outMsg string
  
   #print int
   move $a0, $t1	#save value to $t1
   li $v0, 1		#sevice code to print integer
   syscall		#print integer

   #exit
   li $v0, 10		#service code to exit
   syscall		#exit program



