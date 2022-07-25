# Title: CHP5 LABTASK4
# Author: Daryll Anthony Fortunado
# Date: 
# Description:  compute the addresses of arr2, arr3, str1, and str2, given that the address of arr1 is 0x10010000. Show your steps for a full mark.Select “Show Labels Window (symbol table)” from the Settings menu in MARS to check the values of your computed addresses.
# Input: 
# Output:  
################# Data segment #####################
  .data
arr: .space 40 #10 element integer array
user_prompt: .asciiz " Enter 10 number to be stored in the array. "
sum_prompt:   .asciiz "The sum of the array is :"
################# Code segment #####################
.text
.globl main
main:
	li $t0, 0 		#count variable
   	la $t1, arr
   	li $t2, 0   		#sum

readLoop:
	beq $t0, 10, print_sum #branch if equal to 40, 10 items
  
	li $v0, 4    		#Print string
	la $a0, user_prompt   	#load prompt
	syscall
  
	li $v0, 5           	#read int
	syscall
	sw $v0, 0($t1)       	#store input in array
   	add $t2, $t2, $v0   	#sum is calculated here  
  
	addi $t0, $t0, 1 	#add 1 to count
   	addi $t1, $t1, 4   	#add 4 to point to the next element
	b readLoop
  
print_sum:
	li $v0, 4    		#Print string
	la $a0, sum_prompt   	#load prompt
	syscall
  
   	li $v0, 1           	#print sum
   	move $a0, $t2
   	syscall
  
   	#program exit
   	li $v0, 10
   	syscall
