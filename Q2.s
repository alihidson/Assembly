.text
main:
    # get number of tests from user
    li a7, 5
    ecall
    mv a1, a0
    
get_test:
    li a7, 5
    ecall
    mv a2, a0

    li a7, 5
    ecall
    mv a3, a0

    li a7, 5
    ecall
    mv a4, a0
    
    # Check if it can be a triangle
    sub t0, a3, a4
    blt a2, t0, not_triangle
    beq a2, t0, not_triangle
    sub t0, a4, a3
    blt a2, t0, not_triangle
    beq a2, t0, not_triangle


    sub t0, a2, a4
    blt a3, t0, not_triangle
    beq a3, t0, not_triangle
    sub t0, a4, a2
    blt a3, t0, not_triangle
    beq a3, t0, not_triangle


    sub t0, a2, a3
    blt a4, t0, not_triangle
    beq a4, t0, not_triangle
    sub t0, a3, a2
    blt a4, t0, not_triangle
    beq a4, t0, not_triangle


    li a0, 1
    j result
        

not_triangle:
    
    li a0, 0
    
result:
    
    li a7, 1
    ecall
    
    
    li a0, 32           # ASCII code for print space
    li a7, 11
    ecall
    
    
    addi a1, a1, -1 # Subtracting a number from the number of test cases
    bnez a1, get_test # if the number of tests was more than zero

finish: 
# exit of program
    li a7, 10
    ecall
    