.data
x: .word 2
y: .word 1
z: .word 3
.text
main:
########## calculam y+z si introducem in stiva
lw $t0,y
lw $t1,z
add $t0,$t0,$t1 # $t0 = y+z = 4
subu $sp,4
sw $t0,0($sp)   # acum stiva contine: $sp:4
########## calculam ((x+y)*(x-y)*(x+z)) si introducem in stiva
##### calculam x+z si introducem in stiva
lw $t0,x
lw $t1,z
add $t0,$t0,$t1 # $t0 = x+z = 5
subu $sp,4
sw $t0,0($sp)   # acum stiva contine: $sp:5,4
##### calculam x-y si introducem in stiva
lw $t0,x
lw $t1,y
sub $t0,$t0,$t1 # $t0 = x-y = 1
subu $sp,4
sw $t0,0($sp)   # acum stiva contine: $sp:1,5,4
##### calculam x+y  si introducem in stiva
lw $t0,x
lw $t1,y
add $t0,$t0,$t1 # $t0 = x+y = 3
subu $sp,4
sw $t0,0($sp)   # acum stiva contine: $sp:3,1,5,4
##### acum stiva contine valorile subexpresiilor primei expresii
##### ramane sa inmultim aceste valori
lw $t0,0($sp)
lw $t1,4($sp)
addu $sp,8
mulo $t0,$t0,$t1
subu $sp,4
sw $t0,0($sp)   # acum stiva contine: $sp:3,5,4
#####
lw $t0,0($sp)
lw $t1,4($sp)
addu $sp,8
mulo $t0,$t0,$t1
subu $sp,4
sw $t0,0($sp)   # acum stiva contine: $sp:15,4
########## acum stiva contine valorile subexpresiilor expresiei mari
########## ramane sa impartim aceste valori
lw $t0,0($sp)
lw $t1,4($sp)
addu $sp,8
div $t0,$t1
mfhi $t0
subu $sp,4
sw $t0,0($sp)   # acum stiva contine: $sp:3
#################### recuperam din stiva in $v0 intregii expresii
lw $v0,0($sp)
addu $sp,4      # $v0=3
li $v0, 10
syscall
