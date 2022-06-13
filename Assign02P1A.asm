#Scott Hockaday, CS2318-003, Assignment 2 Part 1 Program A                            					
                    						
#Prompt the user to enter an integer, 						
#read the user's input, and display a labeled output 						
#about the user's input.	       					
#	       					
#Prompt the user to enter a string of up to 50 characters 						
#long, read the user's input, and display a labeled output 						
#about the user's input.            						
#            	       					
#String entered MUST be stored in separate storage space 						
#(i.e., not overwriting the storage space used by prompt 						
#and label strings) allocated just enough 						
#(no more, no less) to accommodate up to the maximum 						
#number of characters indicated.	       					
#	       					
#Prompt the user to enter a character,						
#read the user's input, and display a labeled output						
#about the user's input.						
#            	       	       				
#Note that it involves a character,						
#NOT a one-charater string. You will get no credits 						
#if you do it using a one-character string even though 						
#the same output is obtained.	       	       	                          			
						
                        .data						
spaces:                 .space 51 #holds a string of max 50 chars						
intPrmpt:               .asciiz "Please enter an integer: "						
intMsg:                 .asciiz "The integer you entered is : "						
strPrmpt:               .asciiz "Enter a string (less than 50 characters): "						
strMsg:                 .asciiz "The string you entered is : "						
charPrmpt:              .asciiz "Please enter a single character: "						
charMsg:                .asciiz "The character you entered is : "						
						
                        .text						
                        .globl main						
main:						
                        #prompt user for an integer						
                        li $v0, 4						
                        la $a0, intPrmpt						
                        syscall						
						
                        #read int input, save in $t0"						
                        li $v0, 5						
                        syscall						
                        move $t0, $v0						
						
                        #display int saved in $t0						
                        li $v0, 4						
                        la $a0, intMsg						
                        syscall						
						
                        li $v0, 1						
                        move $a0, $t0						
                        syscall						
						
                        #prints newline						
                        li $v0, 11						
                        li $a0, '\n'						
                        syscall						
						
                        li $v0, 11						
                        li $a0, '\n'						
                        syscall						
						
                        #prompt user for a string						
                        li $v0, 4						
                        la $a0, strPrmpt						
                        syscall						
						
                        #read string input, save in location spaces (50 characters)"						
                        li $v0, 8						
                        la $a0, spaces						
                        li $a1, 51 #max length of string (50 characters)"						
                        syscall						
						
                        #display the string input						
                        li $v0, 4						
                        la $a0, strMsg						
                        syscall						
						
                        li $v0, 4						
                        la $a0, spaces						
                        syscall						
						
                        li $v0, 11						
                        li $a0, '\n'						
                        syscall						
						
                        #prompt user for a single char						
                        li $v0, 4						
                        la $a0, charPrmpt						
                        syscall						
						
                        #read user char input and save to $t1						
                        li $v0, 12						
                        syscall						
                        move $t1, $v0						
						
                        li $v0, 11						
                        li $a0, '\n'						
                        syscall						
						
                        #display user char in $t1 with a charMsg						
                        li $v0, 4						
                        la $a0, charMsg						
                        syscall						
						
                        li $v0, 11						
                        move $a0, $t1						
                        syscall						
						
                        #exits the program						
                        li $v0, 10						
                        syscall						
