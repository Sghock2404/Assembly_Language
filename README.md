# Assembly_Language

These simple programs have been developed in MARS in MIPS

Assignment 2 Part 1A:
Prompt the user to enter an integer, 
read the user's input, and display a labeled output 
about the user's input. 
 
Prompt the user to enter a string of up to 50 characters 
long, read the user's input, and display a labeled output 
about the user's input. 
 
String entered MUST be stored in separate storage space 
(i.e., not overwriting the storage space used by prompt 
and label strings) allocated just enough 
(no more, no less) to accommodate up to the maximum 
number of characters indicated. 
 
Prompt the user to enter a character,
read the user's input, and display a labeled output
about the user's input.
 
Note that it involves a character,
NOT a one-charater string. You will get no credits 
if you do it using a one-character string even though 
the same output is obtained.

Assignment 2 Part 1B:
Replace each "hole" indicated with "********" with an
an instruction so that the program will work just like 
the sample runs shown at the bottom.

The last 3 instructions (replacing the last 3 "holes")
MUST involve bitwise operations.
Your completed program will be tested for AT LEAST the 
test cases shown (so be sure to at least test them).

Assignment 2 Part 1C:
Allocate a global array (i.e., space in the data segment) enough for
storing 4 integers and initialize the array (from 1st to 4th element)
with 8, 1, 3 and 2 at the same time (i.e., DON'T first allocate
uninitialized space for array and later write code to put the values
into array).

Display a labeled output about the array's initial contents
(from 1st to 4th element).

IMPORTANT (for the purpose of this exercise):
You are to load the values of the array elements from
memory and use those values to generate the labeled output.
(You are not to simply display a hard-coded, preset string.)
Re-order the values in the array so that the contents of the array in
memory (from 1st to 4th element) becomes 2, 3, 1 and 8, using the following
operations in the order listed (to not defeat the goals of this exercise,
you must NOT change the specified operations and order, even if doing
so will accomplish the same effect more efficiently):

Swap the contents in memory of the 1st and 4th elements of the array.
Swap the contents in memory of the 2nd and 3rd elements of the array.

IMPORTANT (for the purpose of this exercise):
When performing each of the two swap operations above, you can re-use
(where expedient) the array's base address in register (loaded when
performing the display of the array's initial contents) but you MUST re-load
the values of the associated array elements fresh from memory
(i.e., assuming no knowledge that certain values might have already existed
in some registers due to prior operations).

Display a labeled output about the array's contents (from 4th to 1st element)
after the 2 swapping operations above.
NOTE: It is from 4th to 1st element and not from 1st to 4th element.

IMPORTANT (for the purpose of this exercise):
When displaying the after-swap labeled output, you can re-use the array's base 
address in register (loaded when performing prior operations) but you MUST re-load 
the values of the array elements fresh from memory (i.e., assuming no knowledge that 
certain values might have already existed in some registers due to prior operations).

Assignment 2 Part 1D:
Prompt the user to enter the integer scores for Exam 1, Exam 2 and Final Exam,
read the scores, compute the weighted average score
(using the following formula), and display a labeled output about the
weighted average score.

You MUST perform (in the appropriate order, of course) ALL the additions,
multiplications and divisions shown in the given formula.
(You should NOT resort to simplifying the formula in some way, perhaps
to make the computation more efficient.)
You MUST use bit-shifting to effect multiplications and divisions
involving powers of 2.
Note that 2, 128 and 1024 correspond to some powers of 2
(but not 307 amd 637).
You are NOT to replace 307 and 637 (that are not powers of 2) with their
"sum-of-powers-of-2" equivalents.

Assume it is the intent to simply discard the fractional portion when a
division is performed. When evaluating the first and second terms on the
right hand side (i.e., the Exam 1 and Exam 2 contributions, respectively),
however, you MUST perform (in each case) the division after (NOT before) the
multiplication (otherwise, accuracy may be unnecessarily lost).
For any multiplication and division operation that cannot be effected with
simple (one-time) bit-shifting, you MUST use another "true" instruction
(NOT a pseudoinstruction) instead.
Formula:
AvgScore = ((128/637) * exam1) + ((307/1024) * exam2) + (finalScore / 2)
