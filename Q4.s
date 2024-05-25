.data 

arr : .space 400 
n: .word 0

.text 
    main:  
 li a7,5
 ecall 
 mv t0,a0
 
read_test_case :
        beqz t0, exit 
  li a1,1
  
  li a7,5
 ecall 

beq a1,a0,special_bubble2


    la t1,n
        sw a0, 0(t1) # store the size in memory
    la t3, arr
    lw t2, 0(t1) 
  
 
   
 loop: 

 
  li a7,5
 ecall 



sw a0,0(t3)
 
 addi t3,t3,4
 addi t2,t2,-1
 

 
 bgtz  t2,  loop  
     lw t2,n 
    
special_bubble:
 #beq a1,t2,special_bubble2
addi t2, t2, -1 
        blez t2, done # zamani k 1 addaad vared mishavad
        
      la a3, arr
inner_loop:

    lw t4, 0(a3)
    lw t5, 4(a3)

    bleu  t4, t5, no_swap
    sw t5, 0(a3)
    sw t4, 4(a3)
    
no_swap:
    addi a3, a3, 4
    blt a3, t3, inner_loop

   
    j special_bubble


done:
    # Sorting complete
    la t6,n
lw t2,0(t6)
 addi t2, t2, -1 #subtract 1 from the size
          srai  t2, t2, 1 # using shift righ
          
          la t3,arr
          slli t2, t2, 2 #multiplying the index by 4 (size of an int)
          addi t2, t2, 4 # after debugging it appears this code returns median index -1 so in here we go 4 addresspoints furthur 
          add t3, t3, t2 #adding the index to array pointer
          lw a0, 0(t3)

     li a7, 1
          ecall
          li a0, 32
          li a7, 11  
          ecall 
          addi t0,t0,-1
          
    j read_test_case
    
    special_bubble2:
li a7,5
ecall
         li a7, 1
          ecall
          li a0, 32
          li a7, 11  
          ecall
          addi t0,t0,-1
          
    j read_test_case
        exit:

    li a7, 10         
    ecall