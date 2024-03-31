.text
main:
    li a7, 5              # get number of test from user
    ecall
    mv a1, a0

get_test:
    li a7, 5
    ecall
    mv a2, a0

    li a7, 5
    ecall
    mv a3, a0

loop:
    blt a2, a3, result  
    sub a2, a2, a3            
    j loop

result:
    mv a0, a2
    li a7, 1
    ecall

    li a0, 32 # ASCII code for print space
    li a7, 11
    ecall

    addi a1, a1, -1
    bnez a1, get_test

finish:
    li a7, 10
    ecall
