# Title: CHP5 LAB TASK 1
# Author: Daryll Anthony Fortunado
# Date: 
# Description:  compute the addresses of arr2, arr3, str1, and str2, given that the address of arr1 is 0x10010000. Show your steps for a full mark.Select “Show Labels Window (symbol table)” from the Settings menu in MARS to check the values of your computed addresses.
# Input: 
# Output:  
################# Data segment #####################
.data
arr1: .word 5:20
arr2: .half 7, -2, 8, -6
arr3: .space 100
str1: .asciiz "This is a message"
str2: .asciiz "Another important string"
################# Code segment #####################

# ANSWER

# Address of arr2 = 0x10010050

# Address of arr3 = 0x10010058

# Address of str1 = 0x100100BC

# Address of str2 = 0x100100CE
