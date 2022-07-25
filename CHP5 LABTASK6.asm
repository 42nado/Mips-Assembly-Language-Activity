.data
   fileName1:   .space 100
   fileName2:   .space 100
   prompt1:   .asciiz "Enter the input file name: ex. input : C:\Users\Daryll\Desktop\Mips\file.txt      :"
   prompt2:   .asciiz "Enter the output file name: "
   msg:   .asciiz "Copying input text file into output file completed successfully"
   errorMsg:  .asciiz "The input file cannot be opened"
   buffer:    .space 40966
.text
   main:
       #
       li $v0, 4
       la $a0, prompt1
       syscall
      
       #(the file name must be full path or path from which Mars jar file is located)
       li $v0, 8
       la $a0, fileName1
       li $a1, 50
       syscall
       
       li $v0, 4
       la $a0, prompt2
       syscall
      
       #(the file name must be full path or path from which Mars jar file is located)
       li $v0, 8
       la $a0, fileName2
       li $a1, 50
       syscall
       
       # converting string into null terminated string
       #replacing last character of fileName with 0 instead of \n
       
        la      $s0, fileName1  # $s0 contains base address of str
        add     $s2, $0, $0     # $s2 = 0
        addi    $s3, $0, '\n'   # $s3 = '\n'
loop1:
        lb      $s1, 0($s0)     # load character into $s0
        beq     $s1, $s3, removeNewLine1        # Break if byte is newline
        addi    $s2, $s2, 1     # increment counter
        addi    $s0, $s0, 1     # increment str address
        j       loop1
removeNewLine1:
        sb      $0, 0($s0)      #replace newline with 0 in fileName1
        
        la      $s0, fileName2  # $s0 contains base address of str
        add     $s2, $0, $0     # $s2 = 0
        addi    $s3, $0, '\n'   # $s3 = '\n'
loop2:
        lb      $s1, 0($s0)     # load character into $s0
        beq     $s1, $s3, removeNewLine2        # Break if byte is newline
        addi    $s2, $s2, 1     # increment counter
        addi    $s0, $s0, 1     # increment str address
        j       loop2
removeNewLine2:
        sb      $0, 0($s0)  #replace newline with 0 in fileName2
        
        #now that input file name is converted to null-terminated string the remaining code is same
        
      
        # Open file for reading
        li   $v0, 13          # system call for open file
        la   $a0, fileName1      # address of null-terminated string containing filename
        li   $a1, 0           # flags
        li   $a2, 0           # mode
        syscall               # open a file 
        move $s0, $v0         # save the file descriptor
        #check if the input file can be opened or not if not print error message and exit
        bltz $s0,exit1
 
        # reading from file just opened
        li   $v0, 14        # system call for reading from file
        move $a0, $s0       # file descriptor 
        la   $a1, buffer    # address of input buffer
        li   $a2,  40966       # maximum number of characters to read
        syscall             # read from file
        
        move $a0,$s0  #close file
        li $v0,16
        syscall
        # open File     
        li   $v0, 13          # system call for open file
        la   $a0, fileName2      # address of null-terminated string containing filename
        li   $a1, 1          # flags = to create and write to file
        li   $a2, 0           # mode
        syscall               # open a file 
        move $s1, $v0         # save the file descriptor
        
        # write date into file just opened
        li   $v0, 15        # system call for writing into file
        move $a0, $s1       # file descriptor 
        la   $a1, buffer    # address of output buffer
        li   $a2,  40966       # maximum number of characters to write
        syscall             # write into file
        
        li $v0, 4   #write succes message
        la $a0, msg
        syscall
        
        move $a0,$s1  #close file
        li $v0,16
        syscall
        
        li $v0, 10      # Finish the Program
        syscall
exit1:  li $v0, 4
        la $a0, errorMsg
        syscall
       
        li $v0, 10      # Finish the Program
        syscall
