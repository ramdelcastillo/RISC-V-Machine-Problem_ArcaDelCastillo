.macro GET_DEC (%x)
	li a7, 5
	ecall
	mv %x, a0	
.end_macro
.macro GET_DEC2
	li a7, 5
	ecall
.end_macro
.macro GET_FLOAT 
	li a7, 6
	ecall
.end_macro
.macro PRINT_DEC (%x)
	li a7, 1
	mv a0, %x
	ecall
.end_macro
.macro NEWLINE
	li a7, 11
	li a0, 10
	ecall
.end_macro
.macro PRINT_STRING (%x)
	li a7, 4
	la a0, %x
	ecall
.end_macro
.macro PRINT_FLOAT2 (%x)
	fmv. %x, fa0
	li a7, 2
	ecall
.end_macro
.macro PRINT_FLOAT (%x)
	flw fa0, (%x)
	li a7, 2
	ecall
.end_macro
.macro GET_VALUE (%row, %column, %value_result)
	li t0, 19
	mul t1, %row, t0
	add t1, t1, %column
	li t0, 4
	mul t1, t1, t0
	la t2, table 
	add t2, t2, t1 

	flw %value_result, 0(t2)
.end_macro 
.macro STORE (%target, %float, %temp)
	la %temp, %target
	fsw %float, (%temp)
.end_macro 

.macro STOREOFFSET (%target, %float, %temp, %offset)
	la %temp, %target
	add %temp, %temp, %offset
	fsw %float, (%temp)
	la %temp, %target
.end_macro 

.data
grass_poison: .word 1, 2, 3, 43, 44, 45, 69, 70, 71
fire_none: .word 4, 5, 37, 38, 58, 59, 77, 78
fire_flying: .word 6
water_none: .word 7, 8, 9, 54, 55, 60, 61, 86, 90, 98, 99
bug_none: .word 10, 11
bug_flying: .word 12
bug_poison: .word 13, 14, 15, 48, 49
normal_flying: .word 16, 17, 18, 21, 22, 83, 84, 85
normal_none: .word 19, 20, 35, 36, 39, 40, 52, 53
poison_none: .word 23, 24, 29, 30, 32, 33, 88, 89
electric_none: .word 25, 26, 81, 82, 100
ground_none: .word 27, 28, 50, 51
poison_ground: .word 31, 34
poison_flying: .word 41, 42
bug_grass: .word 46, 47
fighting_none: .word 56, 57, 66, 67, 68
water_fighting: .word 62
psychic_none: .word 63, 64, 65, 96, 97
water_poison: .word 72, 73
rock_ground: .word 74, 75, 76, 95
water_psychic: .word 79, 80
water_ice: .word 87, 91
ghost_poison: .word 92, 93, 94
not_found: .word 0, -1, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150
	      #0         1       2        3      4     5   6    7     8    9    10    11      12      13     14   15    16    17   18
table: .float # Normal Fighting Flying Poison Ground Rock Bug Ghost Steel Fire Water Grass Electric Psychic Ice Dragon Dark Fairy None
	      1.0, 	1.0, 	1.0, 	1.0, 	1.0, 0.5, 1.0, 0.0, 0.5, 1.0, 1.0, 1.0,    1.0,      1.0, 1.0, 1.0, 1.0,    1.0, 0.0, # Normal	 0  
	      2.0, 	1.0, 	0.5, 	0.5, 	1.0, 2.0, 0.5, 0.0, 2.0, 1.0, 1.0, 1.0,    1.0,      0.5, 2.0, 1.0, 2.0,    0.5, 0.0, # Fighting 1
	      1.0, 	2.0, 	1.0, 	1.0, 	1.0, 0.5, 2.0, 1.0, 0.5, 1.0, 1.0, 2.0,    0.5,      1.0, 1.0, 1.0, 1.0,    1.0, 0.0, # Flying   2
	      1.0, 	1.0, 	1.0, 	0.5, 	0.5, 0.5, 1.0, 0.5, 0.0, 1.0, 1.0, 2.0,    1.0,      1.0, 1.0, 1.0, 1.0,    2.0, 0.0, # Poison   3
	      1.0, 	1.0, 	0.0, 	2.0, 	1.0, 2.0, 0.5, 1.0, 2.0, 2.0, 1.0, 0.5,    2.0,      1.0, 1.0, 1.0, 1.0,    1.0, 0.0, # Ground   4
	      1.0, 	0.5, 	2.0, 	1.0, 	0.5, 1.0, 2.0, 1.0, 0.5, 2.0, 1.0, 1.0,    1.0,      1.0, 2.0, 1.0, 1.0,    1.0, 0.0, # Rock     5
	      1.0, 	0.5, 	0.5, 	0.5, 	1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0, 2.0,    1.0,      2.0, 1.0, 1.0, 2.0,    0.5, 0.0, # Bug      6
	      0.0, 	1.0, 	1.0, 	1.0, 	1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0,    1.0,      2.0, 1.0, 1.0, 0.5,    1.0, 0.0, # Ghost	 7
	      1.0, 	1.0, 	1.0, 	1.0, 	1.0, 2.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0,    0.5,      1.0, 2.0, 1.0, 1.0,    2.0, 0.0, # Steel    8
	      1.0, 	1.0, 	1.0, 	1.0, 	1.0, 0.5, 2.0, 1.0, 2.0, 0.5, 0.5, 2.0,    1.0,      1.0, 2.0, 0.5, 1.0,    1.0, 0.0, # Fire     9
	      1.0, 	1.0, 	1.0, 	1.0, 	2.0, 2.0, 1.0, 1.0, 1.0, 2.0, 0.5, 0.5,    1.0,      1.0, 1.0, 0.5, 1.0,    1.0, 0.0, # Water    10
	      1.0, 	1.0, 	0.5, 	0.5, 	2.0, 2.0, 0.5, 1.0, 0.5, 0.5, 2.0, 0.5,    1.0,      1.0, 1.0, 0.5, 1.0,    1.0, 0.0, # Grass    11
	      1.0, 	1.0, 	2.0, 	1.0, 	0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 0.5,    0.5,      1.0, 1.0, 0.5, 1.0,    1.0, 0.0, # Electric 12
	      1.0, 	2.0, 	1.0,	2.0, 	1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0,    1.0,      0.5, 1.0, 1.0, 0.0,    1.0, 0.0, # Psychic  13
	      1.0, 	1.0, 	2.0,	1.0, 	2.0, 1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 2.0,    1.0,      1.0, 0.5, 2.0, 1.0,    1.0, 0.0, # Ice      14
	      1.0, 	1.0, 	1.0, 	1.0, 	1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0,    1.0,      1.0, 1.0, 2.0, 1.0,    0.0, 0.0, # Dragon   15
	      1.0, 	0.5, 	1.0, 	1.0, 	1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0,    1.0,      2.0, 1.0, 1.0, 0.5,    0.5, 0.0, # Dark     16
	      1.0, 	2.0, 	1.0, 	0.5, 	1.0, 1.0, 1.0, 1.0, 0.5, 0.5, 1.0, 1.0,    1.0,      1.0, 1.0, 2.0, 2.0,    1.0, 0.0, # Fairy    17
	      0.0, 	0.0, 	0.0, 	0.0, 	0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,    0.0,      0.0, 0.0, 0.0, 0.0     0.0, 0.0  # None	 18

msg_grass_poison: .asciz "found in grass-poison"
msg_fire_none: .asciz "found in fire-none"
msg_fire_flying: .asciz "found in fire-flying"
msg_water_none: .asciz "found in water-none"
msg_bug_none: .asciz "found in bug-none"
msg_bug_flying: .asciz "found in bug-flying"
msg_bug_poison: .asciz "found in bug-poison"
msg_normal_flying: .asciz "found in normal-flying"
msg_normal_none: .asciz "found in normal-none"
msg_poison_none: .asciz "found in poison-none"
msg_electric_none: .asciz "found in electric-none"
msg_ground_none: .asciz "found in ground-none"
msg_poison_ground: .asciz "found in poison-ground"
msg_poison_flying: .asciz "found in poison-flying"
msg_bug_grass: .asciz "found in bug-grass"
msg_fighting_none: .asciz "found in fighting-none"
msg_water_fighting: .asciz "found in water-fighting"
msg_psychic_none: .asciz "found in psychic-none"
msg_water_poison: .asciz "found in water-poison"
msg_rock_ground: .asciz "found in rock-ground"
msg_water_psychic: .asciz "found in water-psychic"
msg_water_ice: .asciz "found in water-ice"
msg_ghost_poison: .asciz "found in ghost-poison"
msg_not_found: .asciz "not found"
msg2nd:.asciz "2nd input Winner"
msg1st:.asciz "1st input Winner"
msgnegative:.asciz "-1"

target: .word 0,0,0,0
values: .word 0, 0 
res: .float 0.0, 0.0, 0.0, 0.0
div1: .float 2.0
res1: .float 0.0,0.0
saved: .word 0, 0
.text

GET_DEC t1 #player 1
mv a1, t1
GET_DEC t3 #player 2
mv a3, t3

   la t0, saved     
   sw a1, 0(t0)     
   sw a3, 4(t0)     
   
    la t0, grass_poison   
    li t1, 0             
    li t2, 0             
    li t3, 9              

search_loop_grass_poison:
    lw t4, 0(t0)          
    beq a1, t4, found_grass_poison 
    addi t0, t0, 4       
    addi t1, t1, 1     
    blt t1, t3, search_loop_grass_poison 

    la t0, fire_none    
    li t1, 0           
    li t3, 8              

search_loop_fire_none:
    lw t4, 0(t0)         
    beq a1, t4, found_fire_none 
    addi t0, t0, 4        
    addi t1, t1, 1       
    blt t1, t3, search_loop_fire_none 

    la t0, fire_flying    
    li t1, 0             
    li t3, 1              

search_loop_fire_flying:
    lw t4, 0(t0)          
    beq a1, t4, found_fire_flying 
    addi t0, t0, 4        
    addi t1, t1, 1      
    blt t1, t3, search_loop_fire_flying 

    la t0, water_none      
    li t1, 0             
    li t3, 11             

search_loop_water_none:
    lw t4, 0(t0)         
    beq a1, t4, found_water_none 
    addi t0, t0, 4       
    addi t1, t1, 1      
    blt t1, t3, search_loop_water_none 

    la t0, bug_none       
    li t1, 0             
    li t3, 2             

search_loop_bug_none:
    lw t4, 0(t0)          
    beq a1, t4, found_bug_none 
    addi t0, t0, 4       
    addi t1, t1, 1       
    blt t1, t3, search_loop_bug_none 

    la t0, bug_flying    
    li t1, 0              
    li t3, 1             

search_loop_bug_flying:
    lw t4, 0(t0)          
    beq a1, t4, found_bug_flying 
    addi t0, t0, 4       
    addi t1, t1, 1       
    blt t1, t3, search_loop_bug_flying 

    la t0, bug_poison     
    li t1, 0             
    li t3, 5             

search_loop_bug_poison:
    lw t4, 0(t0)         
    beq a1, t4, found_bug_poison
    addi t0, t0, 4      
    addi t1, t1, 1      
    blt t1, t3, search_loop_bug_poison 

    la t0, normal_flying  
    li t1, 0              
    li t3, 8              

search_loop_normal_flying:
    lw t4, 0(t0)          
    beq a1, t4, found_normal_flying 
    addi t0, t0, 4       
    addi t1, t1, 1       
    blt t1, t3, search_loop_normal_flying 

    la t0, normal_none    
    li t1, 0             
    li t3, 8              

search_loop_normal_none:
    lw t4, 0(t0)         
    beq a1, t4, found_normal_none 
    addi t0, t0, 4        
    addi t1, t1, 1       
    blt t1, t3, search_loop_normal_none 

    la t0, poison_none   
    li t1, 0              
    li t3, 8             

search_loop_poison_none:
    lw t4, 0(t0)          
    beq a1, t4, found_poison_none 
    addi t0, t0, 4        
    addi t1, t1, 1        
    blt t1, t3, search_loop_poison_none 

    la t0, electric_none  
    li t1, 0              
    li t3, 5             

search_loop_electric_none:
    lw t4, 0(t0)          
    beq a1, t4, found_electric_none 
    addi t0, t0, 4        
    addi t1, t1, 1       
    blt t1, t3, search_loop_electric_none 

    la t0, ground_none    
    li t1, 0              
    li t3, 4              

search_loop_ground_none:
    lw t4, 0(t0)          
    beq a1, t4, found_ground_none 
    addi t0, t0, 4        
    addi t1, t1, 1        
    blt t1, t3, search_loop_ground_none 

    la t0, poison_ground  
    li t1, 0             
    li t3, 2             

search_loop_poison_ground:
    lw t4, 0(t0)          
    beq a1, t4, found_poison_ground 
    addi t0, t0, 4        
    addi t1, t1, 1        
    blt t1, t3, search_loop_poison_ground 

    la t0, poison_flying  
    li t1, 0              
    li t3, 2              

search_loop_poison_flying:
    lw t4, 0(t0)          
    beq a1, t4, found_poison_flying 
    addi t0, t0, 4        
    addi t1, t1, 1        
    blt t1, t3, search_loop_poison_flying 

    la t0, bug_grass     
    li t1, 0              
    li t3, 2              

search_loop_bug_grass:
    lw t4, 0(t0)          
    beq a1, t4, found_bug_grass 
    addi t0, t0, 4        
    addi t1, t1, 1       
    blt t1, t3, search_loop_bug_grass 

    la t0, fighting_none  
    li t1, 0              
    li t3, 5              

search_loop_fighting_none:
    lw t4, 0(t0)          
    beq a1, t4, found_fighting_none 
    addi t0, t0, 4        
    addi t1, t1, 1     
    blt t1, t3, search_loop_fighting_none 

    la t0, water_fighting 
    li t1, 0              
    li t3, 1              

search_loop_water_fighting:
    lw t4, 0(t0)          
    beq a1, t4, found_water_fighting 
    addi t0, t0, 4       
    addi t1, t1, 1        
    blt t1, t3, search_loop_water_fighting 

    la t0, psychic_none   
    li t1, 0              
    li t3, 5              

search_loop_psychic_none:
    lw t4, 0(t0)          
    beq a1, t4, found_psychic_none 
    addi t0, t0, 4        
    addi t1, t1, 1       
    blt t1, t3, search_loop_psychic_none 

    la t0, water_poison   
    li t1, 0              
    li t3, 2              

search_loop_water_poison:
    lw t4, 0(t0)          
    beq a1, t4, found_water_poison 
    addi t0, t0, 4        
    addi t1, t1, 1        
    blt t1, t3, search_loop_water_poison 

    la t0, rock_ground    
    li t1, 0             
    li t3, 4              

search_loop_rock_ground:
    lw t4, 0(t0)          
    beq a1, t4, found_rock_ground 
    addi t0, t0, 4        
    addi t1, t1, 1       
    blt t1, t3, search_loop_rock_ground 

    la t0, water_psychic  
    li t1, 0             
    li t3, 2              

search_loop_water_psychic:
    lw t4, 0(t0)          
    beq a1, t4, found_water_psychic 
    addi t0, t0, 4        
    addi t1, t1, 1        
    blt t1, t3, search_loop_water_psychic 

    la t0, water_ice      
    li t1, 0              
    li t3, 2              

search_loop_water_ice:
    lw t4, 0(t0)        
    beq a1, t4, found_water_ice 
    addi t0, t0, 4        
    addi t1, t1, 1        
    blt t1, t3, search_loop_water_ice 

    la t0, ghost_poison   
    li t1, 0            
    li t3, 3            

search_loop_ghost_poison:
    lw t4, 0(t0)         
    beq a1, t4, found_ghost_poison 
    addi t0, t0, 4    
    addi t1, t1, 1      
    blt t1, t3, search_loop_ghost_poison
    
    la t0, not_found  
    li t1, 0            
    li t3, 2  
    
search_not_found:
    lw t4, 0(t0)         
    beq a1, t4, found_not_found
    addi t0, t0, 4    
    addi t1, t1, 1      
    blt t1, t3, search_not_found

    PRINT_STRING msg_not_found
    j player2

found_grass_poison:
    PRINT_STRING msg_grass_poison
    la t6, target
    li t1, 11
    li t2, 3
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_fire_none:
    PRINT_STRING msg_fire_none
    la t6, target
    li t1, 9
    li t2, 18
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_fire_flying:
    PRINT_STRING msg_fire_flying
    la t6, target
    li t1, 9
    li t2, 2
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_water_none:
    PRINT_STRING msg_water_none
    la t6, target
    li t1, 10
    li t2, 18
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_bug_none:
    PRINT_STRING msg_bug_none
    la t6, target
    li t1, 6
    li t2, 18
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_bug_flying:
    PRINT_STRING msg_bug_flying
    la t6, target
    li t1, 6
    li t2, 2
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_bug_poison:
    PRINT_STRING msg_bug_poison
     la t6, target
    li t1, 6
    li t2, 3
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_normal_flying:
    PRINT_STRING msg_normal_flying
     la t6, target
    li t1, 0
    li t2, 2
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_normal_none:
    PRINT_STRING msg_normal_none
    la t6, target
    li t1, 0
    li t2, 18
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_poison_none:
    PRINT_STRING msg_poison_none
     la t6, target
    li t1, 3
    li t2, 18
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_electric_none:
    PRINT_STRING msg_electric_none
     la t6, target
    li t1, 12
    li t2, 18
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_ground_none:
    PRINT_STRING msg_ground_none
     la t6, target
    li t1, 4
    li t2, 18
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_poison_ground:
    PRINT_STRING msg_poison_ground
     la t6, target
    li t1, 3
    li t2, 4
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_poison_flying:
    PRINT_STRING msg_poison_flying
     la t6, target
    li t1, 3
    li t2, 2
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_bug_grass:
    PRINT_STRING msg_bug_grass
     la t6, target
    li t1, 6
    li t2, 11
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_fighting_none:
    PRINT_STRING msg_fighting_none
     la t6, target
    li t1, 1
    li t2, 18
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_water_fighting:
    PRINT_STRING msg_water_fighting
     la t6, target
    li t1, 10
    li t2, 1
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_psychic_none:
    PRINT_STRING msg_psychic_none
     la t6, target
    li t1, 13
    li t2, 18
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_water_poison:
    PRINT_STRING msg_water_poison
     la t6, target
    li t1, 10
    li t2, 3
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_rock_ground:
    PRINT_STRING msg_rock_ground
     la t6, target
    li t1, 5
    li t2, 4
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_water_psychic:
    PRINT_STRING msg_water_psychic
     la t6, target
    li t1, 10
    li t2, 13
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_water_ice:
    PRINT_STRING msg_water_ice
     la t6, target
    li t1, 10
    li t2, 14
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2

found_ghost_poison:
    PRINT_STRING msg_ghost_poison
     la t6, target
    li t1, 7
    li t2, 3
    sw t1, 0(t6)
    sw t2, 4(t6)
    j player2
    
player2:
    NEWLINE
    la t0, grass_poison   
    li t1, 0             
    li t2, 0             
    li t3, 9              

search_loop_grass_poison2:
    lw t4, 0(t0)          
    beq a3, t4, found_grass_poison2 
    addi t0, t0, 4       
    addi t1, t1, 1     
    blt t1, t3, search_loop_grass_poison2 

    la t0, fire_none    
    li t1, 0           
    li t3, 8              

search_loop_fire_none2:
    lw t4, 0(t0)         
    beq a3, t4, found_fire_none2 
    addi t0, t0, 4        
    addi t1, t1, 1       
    blt t1, t3, search_loop_fire_none2 

    la t0, fire_flying    
    li t1, 0             
    li t3, 1              

search_loop_fire_flying2:
    lw t4, 0(t0)          
    beq a3, t4, found_fire_flying2 
    addi t0, t0, 4        
    addi t1, t1, 1      
    blt t1, t3, search_loop_fire_flying2 

    la t0, water_none      
    li t1, 0             
    li t3, 11             

search_loop_water_none2:
    lw t4, 0(t0)         
    beq a3, t4, found_water_none2 
    addi t0, t0, 4       
    addi t1, t1, 1      
    blt t1, t3, search_loop_water_none2 

    la t0, bug_none       
    li t1, 0             
    li t3, 2             

search_loop_bug_none2:
    lw t4, 0(t0)          
    beq a3, t4, found_bug_none2 
    addi t0, t0, 4       
    addi t1, t1, 1       
    blt t1, t3, search_loop_bug_none2 

    la t0, bug_flying    
    li t1, 0              
    li t3, 1             

search_loop_bug_flying2:
    lw t4, 0(t0)          
    beq a3, t4, found_bug_flying2 
    addi t0, t0, 4       
    addi t1, t1, 1       
    blt t1, t3, search_loop_bug_flying2 

    la t0, bug_poison     
    li t1, 0             
    li t3, 5             

search_loop_bug_poison2:
    lw t4, 0(t0)         
    beq a3, t4, found_bug_poison2
    addi t0, t0, 4      
    addi t1, t1, 1      
    blt t1, t3, search_loop_bug_poison2 

    la t0, normal_flying  
    li t1, 0              
    li t3, 8              

search_loop_normal_flying2:
    lw t4, 0(t0)          
    beq a3, t4, found_normal_flying2 
    addi t0, t0, 4       
    addi t1, t1, 1       
    blt t1, t3, search_loop_normal_flying2 

    la t0, normal_none    
    li t1, 0             
    li t3, 8              

search_loop_normal_none2:
    lw t4, 0(t0)         
    beq a3, t4, found_normal_none2 
    addi t0, t0, 4        
    addi t1, t1, 1       
    blt t1, t3, search_loop_normal_none2 

    la t0, poison_none   
    li t1, 0              
    li t3, 8             

search_loop_poison_none2:
    lw t4, 0(t0)          
    beq a3, t4, found_poison_none2 
    addi t0, t0, 4        
    addi t1, t1, 1        
    blt t1, t3, search_loop_poison_none2 

    la t0, electric_none  
    li t1, 0              
    li t3, 5             

search_loop_electric_none2:
    lw t4, 0(t0)          
    beq a3, t4, found_electric_none2 
    addi t0, t0, 4        
    addi t1, t1, 1       
    blt t1, t3, search_loop_electric_none2 

    la t0, ground_none    
    li t1, 0              
    li t3, 4              

search_loop_ground_none2:
    lw t4, 0(t0)          
    beq a3, t4, found_ground_none2 
    addi t0, t0, 4        
    addi t1, t1, 1        
    blt t1, t3, search_loop_ground_none2 

    la t0, poison_ground  
    li t1, 0             
    li t3, 2             

search_loop_poison_ground2:
    lw t4, 0(t0)          
    beq a3, t4, found_poison_ground2 
    addi t0, t0, 4        
    addi t1, t1, 1        
    blt t1, t3, search_loop_poison_ground2 

    la t0, poison_flying  
    li t1, 0              
    li t3, 2              

search_loop_poison_flying2:
    lw t4, 0(t0)          
    beq a3, t4, found_poison_flying2 
    addi t0, t0, 4        
    addi t1, t1, 1        
    blt t1, t3, search_loop_poison_flying2 

    la t0, bug_grass     
    li t1, 0              
    li t3, 2              

search_loop_bug_grass2:
    lw t4, 0(t0)          
    beq a3, t4, found_bug_grass2 
    addi t0, t0, 4        
    addi t1, t1, 1       
    blt t1, t3, search_loop_bug_grass2 

    la t0, fighting_none  
    li t1, 0              
    li t3, 5              

search_loop_fighting_none2:
    lw t4, 0(t0)          
    beq a3, t4, found_fighting_none2 
    addi t0, t0, 4        
    addi t1, t1, 1     
    blt t1, t3, search_loop_fighting_none2 

    la t0, water_fighting 
    li t1, 0              
    li t3, 1              

search_loop_water_fighting2:
    lw t4, 0(t0)          
    beq a3, t4, found_water_fighting2 
    addi t0, t0, 4       
    addi t1, t1, 1        
    blt t1, t3, search_loop_water_fighting2 

    la t0, psychic_none   
    li t1, 0              
    li t3, 5              

search_loop_psychic_none2:
    lw t4, 0(t0)          
    beq a3, t4, found_psychic_none2 
    addi t0, t0, 4        
    addi t1, t1, 1       
    blt t1, t3, search_loop_psychic_none2 

    la t0, water_poison   
    li t1, 0              
    li t3, 2              

search_loop_water_poison2:
    lw t4, 0(t0)          
    beq a3, t4, found_water_poison2 
    addi t0, t0, 4        
    addi t1, t1, 1        
    blt t1, t3, search_loop_water_poison2 

    la t0, rock_ground    
    li t1, 0             
    li t3, 4              

search_loop_rock_ground2:
    lw t4, 0(t0)          
    beq a3, t4, found_rock_ground2 
    addi t0, t0, 4        
    addi t1, t1, 1       
    blt t1, t3, search_loop_rock_ground2 

    la t0, water_psychic  
    li t1, 0             
    li t3, 2              

search_loop_water_psychic2:
    lw t4, 0(t0)          
    beq a3, t4, found_water_psychic2 
    addi t0, t0, 4        
    addi t1, t1, 1        
    blt t1, t3, search_loop_water_psychic2

    la t0, water_ice      
    li t1, 0              
    li t3, 2              

search_loop_water_ice2:
    lw t4, 0(t0)        
    beq a3, t4, found_water_ice2 
    addi t0, t0, 4        
    addi t1, t1, 1        
    blt t1, t3, search_loop_water_ice2 

    la t0, ghost_poison   
    li t1, 0            
    li t3, 3            

search_loop_ghost_poison2:
    lw t4, 0(t0)         
    beq a3, t4, found_ghost_poison2 
    addi t0, t0, 4    
    addi t1, t1, 1      
    blt t1, t3, search_loop_ghost_poison2
    
    la t0, not_found  
    li t1, 0            
    li t3, 2  
    
search_not_found2:
    lw t4, 0(t0)         
    beq a3, t4, found_not_found2
    addi t0, t0, 4    
    addi t1, t1, 1      
    blt t1, t3, search_not_found2

    PRINT_STRING msg_not_found
    j next

found_grass_poison2:
    PRINT_STRING msg_grass_poison
     la t6, target
    li t1, 11
    li t2, 3
    sw t1, 8(t6)
    sw t2, 12(t6)
     j next

found_fire_none2:
    PRINT_STRING msg_fire_none
     la t6, target
    li t1, 9
    li t2, 18
    sw t1, 8(t6)
    sw t2, 12(t6)
     
    j next

found_fire_flying2:
    PRINT_STRING msg_fire_flying
    la t6, target
    li t1, 9
    li t2, 2
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_water_none2:
    PRINT_STRING msg_water_none
     la t6, target
    li t1, 10
    li t2, 18
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_bug_none2:
    PRINT_STRING msg_bug_none
      la t6, target
    li t1, 6
    li t2, 18
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_bug_flying2:
    PRINT_STRING msg_bug_flying
      la t6, target
    li t1, 6
    li t2, 2
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_bug_poison2:
    PRINT_STRING msg_bug_poison
        la t6, target
    li t1, 6
    li t2, 3
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_normal_flying2:
    PRINT_STRING msg_normal_flying
     la t6, target
    li t1, 0
    li t2, 2
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_normal_none2:
    PRINT_STRING msg_normal_none
      la t6, target
    li t1, 0
    li t2, 18
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_poison_none2:
    PRINT_STRING msg_poison_none
      la t6, target
    li t1, 3
    li t2, 18
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_electric_none2:
    PRINT_STRING msg_electric_none
      la t6, target
    li t1, 12
    li t2, 18
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_ground_none2:
    PRINT_STRING msg_ground_none
      la t6, target
    li t1, 4
    li t2, 18
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_poison_ground2:
    PRINT_STRING msg_poison_ground
      la t6, target
    li t1, 3
    li t2, 4
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_poison_flying2:
    PRINT_STRING msg_poison_flying
      la t6, target
    li t1, 3
    li t2, 2
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_bug_grass2:
    PRINT_STRING msg_bug_grass
      la t6, target
    li t1, 6
    li t2, 11
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_fighting_none2:
    PRINT_STRING msg_fighting_none
      la t6, target
    li t1, 1
    li t2, 18
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_water_fighting2:
    PRINT_STRING msg_water_fighting
      la t6, target
    li t1, 10
    li t2, 1
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_psychic_none2:
    PRINT_STRING msg_psychic_none
      la t6, target
    li t1, 13
    li t2, 18
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_water_poison2:
    PRINT_STRING msg_water_poison
      la t6, target
    li t1, 10
    li t2, 3
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_rock_ground2:
    PRINT_STRING msg_rock_ground
      la t6, target
    li t1, 5
    li t2, 4
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_water_psychic2:
    PRINT_STRING msg_water_psychic
      la t6, target
    li t1, 10
    li t2, 13
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_water_ice2:
    PRINT_STRING msg_water_ice
      la t6, target
    li t1, 10
    li t2, 14
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

found_ghost_poison2:
    PRINT_STRING msg_ghost_poison
      la t6, target
    li t1, 7
    li t2, 3
    sw t1, 8(t6)
    sw t2, 12(t6)
    j next

next: nop
    la t6, target
 
    lw t3, 0(t6) 
    lw t4, 4(t6) 
    lw t5, 8(t6) 
    lw t6, 12(t6)
    
    li t0, 18
    beq t4, t0, check_t6
    
    beq t6, t0, onev2
check_t6:
    beq t6, t0, botheq
    bne t6, t0, twov1
    
    #Player 1(2-type) v Player 2(2-type)
    GET_VALUE(t3,t5,f1)
    GET_VALUE(t3,t6,f2)
    GET_VALUE(t4,t5,f3)	
    GET_VALUE(t4,t6,f4)	
    
    GET_VALUE(t5,t3,f28)	
    GET_VALUE(t5,t4,f29)	
    GET_VALUE(t6,t3,f30)	
    GET_VALUE(t6,t4,f31)	
    
    la t1, div1
    flw f26, 0(t1)
    
    fmul.s f5,f1,f2     
    fmul.s f6,f3,f4     
    fadd.s f7, f5, f6     
    fdiv.s f8, f7, f26 
	
    fmul.s f4,f28,f29     
    fmul.s f5,f30,f31     
    fadd.s f7, f4, f5     
    fdiv.s f9, f7, f26   
    j fin
botheq: #Player 1(1-type) v Player 2(1-type)
    GET_VALUE(t3,t5,f1)
    GET_VALUE(t5,t3,f28)	
    fmv.s f8, f1     
    fmv.s f9, f28    
    j fin
onev2: nop #Player 1(1-type) v Player 2(2-type)
    GET_VALUE(t3,t5,f1)
    GET_VALUE(t3,t6,f2)
  
    GET_VALUE(t5,t3,f3)	
    GET_VALUE(t6,t3,f4)
    
    fmul.s f5,f1,f2   
    fmul.s f6,f3,f4
 
    fmv.s f8, f5     
    fmv.s f9, f6 
    j fin
twov1: #Player 1(2-type) v Player 2(1-type)
    GET_VALUE(t3,t5,f1)
    GET_VALUE(t4,t5,f2)
  
    GET_VALUE(t5,t3,f3)	
    GET_VALUE(t5,t4,f4)
    
    fmul.s f5,f1,f2   
    fmul.s f6,f3,f4
 
    fmv.s f8, f5     
    fmv.s f9, f6 
fin: nop
NEWLINE
la t0, saved
lw t1, 0(t0)  #get Player1 Pokemon ID     
lw t2, 4(t0)  #get Player2 Pokemon ID        
beq t1, t2, L3 #draw
addi x12, x0, 1 #put 1 to x12
feq.s x13, f8, f9 #gets 1 to x13 if equal 
bge x13, x12, L3 #draw
flt.s x13,f8, f9 #if Player1 < Player2 (1 to X13)
bge x13, x12, L2 #less than
	#if Player1 > Player2 
	lw a0, 0(t0)     
	li a7, 1         
	ecall           
J L5
L2:
	lw a0, 4(t0)     
	li a7, 1        
	ecall           
J L4
L3: PRINT_STRING msgnegative #draw
L4: NOP
L5: NOP 
j L11   	

found_not_found:  
NEWLINE
PRINT_STRING msg2nd
j l10
found_not_found2: 

NEWLINE
PRINT_STRING msg1st
l10: nop

L11: nop


