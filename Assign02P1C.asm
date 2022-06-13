# Scott Hockaday, CS 2318-003, Assignment 2 Part 1 Program c


# Allocate a global array (i.e., space in the data segment) enough for
# storing 4 integers and initialize the array (from 1st to 4th element)
# with 8, 1, 3 and 2 at the same time (i.e., DON'T first allocate
# uninitialized space for array and later write code to put the values
# into array).
# Display a labeled output about the array's initial contents
#(from 1st to 4th element).

# IMPORTANT (for the purpose of this exercise):

# You are to load the values of the array elements from
# memory and use those values to generate the labeled output.
# (You are not to simply display a hard-coded, preset string.)
# Re-order the values in the array so that the contents of the array in
# memory (from 1st to 4th element) becomes 2, 3, 1 and 8, using the following
# operations in the order listed (to not defeat the goals of this exercise,
# you must NOT change the specified operations and order, even if doing
# so will accomplish the same effect more efficiently):

# Swap the contents in memory of the 1st and 4th elements of the array.
# Swap the contents in memory of the 2nd and 3rd elements of the array.

# IMPORTANT (for the purpose of this exercise):

# When performing each of the two swap operations above, you can re-use
# (where expedient) the array's base address in register (loaded when
# performing the display of the array's initial contents) but you MUST re-load
# the values of the associated array elements fresh from memory
# (i.e., assuming no knowledge that certain values might have already existed
# in some registers due to prior operations).
# Display a labeled output about the array's contents (from 4th to 1st element)
# after the 2 swapping operations above.
# NOTE: It is from 4th to 1st element and not from 1st to 4th element.

# IMPORTANT (for the purpose of this exercise):

# When displaying the after-swap labeled output, you can re-use the array's base 
# address in register (loaded when performing prior operations) but you MUST re-load 
# the values of the array elements fresh from memory (i.e., assuming no knowledge that 
# certain values might have already existed in some registers due to prior operations).

# CAUTION:
# Too many past students regretted having points taken off for not labeling output.

			.data
intArray: 		.word 8, 1, 3, 2
msgOutput:		.asciiz "The initial array elements from 1st-4th: "
msgOutput2:		.asciiz "The array elements after swap (4th-1st): "
			
			.text
			.globl main
main:

			# registering/loading array values
			la $t0, intArray	#$t0 has address of intArray
			lw $t1, 0($t0)		#$t1 has intArray[0] 
			lw $t2, 4($t0)		#$t2 has intArray[1]
			lw $t3, 8($t0)		#$t3 has intArray[2]
			lw $t4, 12($t0)		#$t4 has intArray[3]
			
			# display the array elements w/ message (1st-4th element)
			li $v0, 4
			la $a0, msgOutput
			syscall
			
			li $v0, 1
			move $a0, $t1
			syscall
			
			li $v0, 1
			move $a0, $t2
			syscall
			
			li $v0, 1
			move $a0, $t3
			syscall
			
			li $v0, 1
			move $a0, $t4
			syscall
			
			# print newline(s)
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			# begin swapping of intArray[0] and intArray[3] in memory
			la $t0, intArray	# $t0 has address of intArr
			lw $t1, 0($t0)		# $t1 has intArray[0] (8)
			lw $t4, 12($t0)		# $t4 has intArray[3] (2)
			
			sw $t4, 0($t0)		# put int in $t4 to intArray[0] in memory
			sw $t1, 12($t0)		# put int in $t1 to intArray[3] in memory
			
			# begin swapping of intArray[1] and intArray[2] in memory
			lw $t2, 4($t0)		# $t2 has intArray[1] (1)
			lw $t3, 8($t0)		# $t3 has intArray[2] (3)
			
			sw $t3, 4($t0)		# put int in $t3 to intArray[1] in memory
			sw $t2, 8($t0)		# put int in $t2 to intArray[2] in memory
			
			# end swapping, print new array w/ other string message (4th-1st element)
			li $v0, 4
			la $a0, msgOutput2
			syscall
			
			li $v0, 1
			lw $a0, 0($t0)
			syscall
			
			li $v0, 1
			lw $a0, 4($t0)
			syscall
			
			li $v0, 1
			lw $a0, 8($t0)
			syscall
			
			li $v0, 1
			lw $a0, 12($t0)
			syscall
			
			# graceful exit
			li $v0, 10
			syscall
