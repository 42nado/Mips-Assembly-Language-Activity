#Title:  CH6-LAB TASK2-B		
#Author: Daryll Anthony Fortunado		
#Date: 
# Description:   Write MIPS code to perform the following integer divisions.
# Input: What is the value of the LO and HI registers?
# Ouput: integer
#################################### DATA SEGMENT #################################### 
.data
        .asciiz "98765 / 54321 " # str = 10 space characters
	 hiReg:     .asciiz "\nHI Register: "
        loReg:     .asciiz "\nLO Register: "
#################################### CODE SEGMENT ####################################
.text
main:

     addi  $t0, $zero 98765 
     addi  $t1, $zero 54321
     
     divu $ $t0, $t1       # divide the numbers stored in these registers.   
     li $v0, 4                              #Service code for printing string
     la $a0, loReg                        #Load address of 'loReg' that will print the string
     syscall                                #Performs the requested service
     li  $v0, 1
     mflo $a0,         # lo= quotient
     syscall           # print quotient
     
     li $v0, 4                              #Service code for printing string
     la $a0, hiReg                        #Load address of 'hiReg' that will print the string
     syscall                                #Performs the requested service

     li  $v0, 1
     mfhi $a0          # hi = quotient
     syscall           # print quotient
     
     li $v0,10         # end of the program 
     syscall
#######################Value of lo and hi registers##############################
 
# Hi (remainder): 4444
# Lo (quotient) : 1  

