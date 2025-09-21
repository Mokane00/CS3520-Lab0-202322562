.data
prompt: .asciz "Enter a positive integer: "
error: .asciz "Error: Please enter a non-negative integer.\n"
result: .asciz "The factorial is: "

.text
.globl _start
_start:
    # Print prompt
    la a0, prompt
    li a7, 4
    ecall

    # Read integer input
    li a7, 5
    ecall
    mv t0, a0       # Store input n in t0

    # If n < 0, print error and exit
    blt t0, zero, print_error

    # Initialize factorial = 1
    li t1, 1        # Factorial result
    li t2, 1        # Counter i = 1

loop:
    bgt t2, t0, done  # If i > n, exit loop
    mul t1, t1, t2    # Factorial *= i
    addi t2, t2, 1    # i++
    j loop

done:
    # Print result label
    la a0, result
    li a7, 4
    ecall

    # Print factorial result
    mv a0, t1
    li a7, 1
    ecall

    j exit

print_error:
    la a0, error
    li a7, 4
    ecall

exit:
    li a7, 10
    ecall