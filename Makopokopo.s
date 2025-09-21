.data
prompt: .asciz "Enter quantity in litres: "
mako: .asciz "Makokopo: "
remain: .asciz " Remainder: \n"

.text
.globl _start
_start:
    # Print prompt
    la a0, prompt
    li a7, 4
    ecall

    # Read integer (litres)
    li a7, 5
    ecall
    mv t0, a0       # Store litres in t0

    # Compute makokopo = litres / 20, remainder = litres % 20
    li t1, 20
    div t2, t0, t1  # t2 = makokopo
    rem t3, t0, t1  # t3 = remainder

    # Print "Makokopo: "
    la a0, mako
    li a7, 4
    ecall

    # Print makokopo value
    mv a0, t2
    li a7, 1
    ecall

    # Print " Remainder: \n"
    la a0, remain
    li a7, 4
    ecall

    # Print remainder value
    mv a0, t3
    li a7, 1
    ecall

    # Exit
    li a7, 10
    ecall
