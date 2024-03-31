.text
main:
    
    li a7, 5 # get number of tests from user
    ecall
    mv t1, a0
 
get_test:   
    
    li a7, 5
    ecall
    mv t2, a0

    li a7, 5
    ecall
    mv t3, a0

    # if one of the numbers is one
    li t4, 1
    beq t2, t4, print_one
    beq t3, t4, print_one

calculate:
    bne t2, t3, check_a_b # if a != b
    j result # if a == b

check_a_b:
    blt t2, t3, subtract_b_from_a  # if a < b then b - a
    sub t2, t2, t3 # else a - b (if a > b)
    j calculate

subtract_b_from_a:
    sub t3, t3, t2   # b - a
    j calculate
    
result:
    mv a0, t2 # print result
    li a7, 1
    ecall
    j check_tests

print_one:
    li a0, 1
    li a7, 1
    ecall

check_tests:
    li a0, 32 # ASCII code for print space
    li a7, 11
    ecall

    addi t1, t1, -1 # subtracting a number from the number of test cases
    bnez t1, get_test # if the number of tests was more than zero

finish:
    li a7, 10
    ecall