.text
main:
    
    li a7, 5 # get number of tests from user
    ecall
    mv t4, a0
    
get_test:
    
    li a7, 5
    ecall
    mv t0, a0

    
    li a7, 5
    ecall
    mv t1, a0
    
    
    li t2, 0 # result
   
    # check the first input or second input not zero
    beqz t1, print_result
    beqz t0, print_result


multiply_loop:
    
    add t2, t2, t0 # add first value to result
    addi t1, t1, -1 # subtract one number from the second value

    
    bnez t1, multiply_loop

print_result:
    
    mv a0, t2
    li a7, 1
    ecall
    
    
    li a0, 32 # ASCII code for print space
    li a7, 11
    ecall
    
    addi t4, t4, -1 # subtracting a number from the number of test cases
    bnez t4, get_test # if the number of tests was more than zero

finish:
    li a7, 10
    ecall
