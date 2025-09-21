.data
prompt: .asciz "Enter a number 1-7: "
error: .asciz "Error: Invalid input.\n"
day1: .asciz "Sontaha\n"     # Sunday
day2: .asciz "Mantaha\n"     # Monday
day3: .asciz "Labobeli\n"    # Tuesday
day4: .asciz "Laboraro\n"    # Wednesday
day5: .asciz "Labone\n"      # Thursday
day6: .asciz "Labohlano\n"   # Friday
day7: .asciz "Moqebelo\n"    # Saturday

.text
.globl _start
_start:
    # Print prompt
    la a0, prompt
    li a7, 4
    ecall

    # Read integer (1-7)
    li a7, 5
    ecall
    mv t0, a0       # Day number in t0

    # Check range 1-7
    li t1, 1
    blt t0, t1, print_error
    li t1, 7
    bgt t0, t1, print_error

    # Jump table (subtract 1 for offset)
    addi t0, t0, -1
    slli t0, t0, 2   # Multiply by 4 (word size)
    la t1, jump_table
    add t1, t1, t0   # Address = base + offset
    lw t1, 0(t1)     # Load jump address
    jr t1            # Jump to label

print_day1:
    la a0, day1
    j print
print_day2:
    la a0, day2
    j print
print_day3:
    la a0, day3
    j print
print_day4:
    la a0, day4
    j print
print_day5:
    la a0, day5
    j print
print_day6:
    la a0, day6
    j print
print_day7:
    la a0, day7
    j print

print:
    li a7, 4
    ecall
    j exit

print_error:
    la a0, error
    li a7, 4
    ecall

exit:
    li a7, 10
    ecall

.data
jump_table:
.word print_day1, print_day2, print_day3, print_day4, print_day5, print_day6, print_day7
