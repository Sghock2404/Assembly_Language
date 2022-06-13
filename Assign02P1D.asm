# Scott Hockaday, CS 2318-003, Assignment 2 Part 1 Program D

# Prompt the user to enter the integer scores for Exam 1, Exam 2 and Final Exam,
# read the scores, compute the weighted average score
# (using the following formula), and display a labeled output about the
# weighted average score.

# You MUST perform (in the appropriate order, of course) ALL the additions,
# multiplications and divisions shown in the given formula.
# (You should NOT resort to simplifying the formula in some way, perhaps
# to make the computation more efficient.)

# You MUST use bit-shifting to effect multiplications and divisions
# involving powers of 2.
# Note that 2, 128 and 1024 correspond to some powers of 2
# (but not 307 amd 637).
# You are NOT to replace 307 and 637 (that are not powers of 2) with their
# "sum-of-powers-of-2" equivalents.
# Assume it is the intent to simply discard the fractional portion when a
# division is performed. When evaluating the first and second terms on the
# right hand side (i.e., the Exam 1 and Exam 2 contributions, respectively),
# however, you MUST perform (in each case) the division after (NOT before) the
# multiplication (otherwise, accuracy may be unnecessarily lost).

# For any multiplication and division operation that cannot be effected with
# simple (one-time) bit-shifting, you MUST use another "true" instruction
# (NOT a pseudoinstruction) instead.

# Formula:
# AvgScore = ((128/637) * exam1) + ((307/1024) * exam2) + (finalScore / 2)

			.data
examPrompt1:		.asciiz "Enter an integer score for Exam 1: "
examPrompt2:		.asciiz "Enter an integer score for Exam 2: "
finalPrompt:		.asciiz "Enter an integer score for Final Exam: "
avgScrMsg:		.asciiz "The weighted average is:  "
			
			.text
			.globl main
main:

			# prompt for exam 1
            		la $a0, examPrompt1
			li $v0, 4
			syscall
		
			# read in exam 1
			li $v0, 5		
			syscall
		
			sll $t0, $v0, 7		# multiply by 128
			li $t1, 637		
			div $t0, $t1		# divide by 637
			mflo $t0
		
			# prompt for exam 2
			la $a0, examPrompt2
			li $v0, 4
			syscall
		
			# read in exam 2
			li $v0, 5		
			syscall
		
			li $t1, 307		
			mult $t1, $v0		# multiply by 307
			mflo $t1
			srl $t1, $t1, 10	# divide by 1024
					
			# Prompt for final grade
			la $a0, finalPrompt
			li $v0, 4
			syscall
		
			# Read in final exam
			li $v0, 5
			syscall
		
			# divide by 2
			srl $v0, $v0, 1
				
			# sum three weighted averages
			add $v0, $v0, $t0
			add $t1, $v0, $t1
		
			# display average with output string
			la $a0, avgScrMsg
			li $v0, 4
			syscall
		
			move $a0, $t1
		
			li $v0, 1
			syscall
		
			# graceful exit		
			li $v0, 10
			syscall