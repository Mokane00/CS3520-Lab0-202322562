.data
prompt: .asciz "Enter height n: "
newline: .asciz "\n"

.text
.globl _start
_start:
    # Print prompt
    la a0, prompt
    li a7, 4
    ecall

    # Read integer n
    li a7, 5
    ecall
    mv t0, a0       # n in t0

    li t1, 1        # Outer loop counter (row = 1 to n)

outer_loop:
    bgt t1, t0, exit  # If row > n, exit

    li t2, 1        # Inner loop counter (col = 1 to row)

inner_loop:
    bgt t2, t1, next_row  # If col > row, next row

    li a0, 42       # ASCII for '*'
    li a7, 11       # Print char
    ecall

    addi t2, t2, 1  # col++
    j inner_loop

next_row:
    la a0, newline
    li a7, 4        # Print newline
    ecall

    addi t1, t1, 1  # row++
    j outer_loop

exit:
    li a7, 10
    ecall