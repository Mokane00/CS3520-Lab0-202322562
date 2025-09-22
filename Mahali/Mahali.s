.data
prompt: .asciz "Enter number of cattle: "
msg1: .asciz "Not enough for bohali\n"
msg2: .asciz "Small herd\n"
msg3: .asciz "Wealthy cattle owner\n"

.text
.globl _start
_start:
    # Print prompt
    la a0, prompt
    li a7, 4
    ecall

    # Read integer (cattle)
    li a7, 5
    ecall
    mv t0, a0       # Store cattle in t0

    # Classify
    li t1, 10
    blt t0, t1, not_enough  # If < 10

    li t1, 50
    ble t0, t1, small_herd  # If <= 50

    # > 50: Wealthy
    la a0, msg3
    j print

not_enough:
    la a0, msg1
    j print

small_herd:
    la a0, msg2
    j print

print:
    li a7, 4
    ecall

    # Exit
    li a7, 10
    ecall
