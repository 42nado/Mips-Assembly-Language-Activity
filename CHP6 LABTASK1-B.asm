# Title: CHP6 LABTASK 2
# Author: Daryll Anthony Fortunado
# Date:
# Description: MIPS code to perform the following integer multiplications.
# Input: 
# Output:Integer
################# Data segment #####################
.data
        
        hiReg:     .asciiz "\nHI Register : "
        loReg:     .asciiz "\nLO Register : "
################# Code segment #####################
.text
.globl main

main:                                        

        addi $t0, $zero, -98765                #Store 98765 to $t0
        addi $t1, $zero, -54321                #Store 54321 to $t1
        multu $t0, $t1                        #Multiply signed 98765 x 54321
                
            li $v0, 4                              #Service code for printing string
            la $a0, hiReg                        #Load address of 'hiReg' that will print the string
            syscall                                #Performs the requested service

            li $v0, 1                              #Service code for printing integer
            mfhi $a0                              #Move from high/store remainder
            syscall                                #Performs the requested service

            li $v0, 4                              #Service code for printing string
            la $a0, loReg                        #Load address of 'loReg' that will print the string
            syscall                                #Performs the requested service

            li $v0, 1                              #Service code for printing integer
            mflo $a0                              #Move from low/store quotient
            syscall                                #Performs the requested service
        
        li $v0, 10                              #Service code for exit program
        syscall                                #Performs the requested service
