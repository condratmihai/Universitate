.data
array: .space 24


.text

main:
li $s0,1 #z=1

li $t0,0
li $t1,6
la $t2, array

for:
bge $t0,$t1, et
sw $t0,0($t2)
add $t2,4
add $t0,1
j for

et:
subu $sp,4
li $t0,6
sw $t0, 0($sp)    #parametrul in stiva -> (6)
jal sum

addu $sp,4    # descarc parametrul
add $s0, $s0, $v0

li $v0, 1
move $a0,$s0
syscall

end:
li $v0,10
syscall

sum:
subu $sp,4                  #sp,fp:(fp v)(6)
sw $fp, 0($sp)
addiu $fp,$sp,0

subu $sp,4            #reg callee-saved $sp:($s0),fp:(fp v)(6)
sw $s0, 0($sp)

subu $sp,8
li $t0,0
sw $t0, 4($sp)      #sp: (spatiu pentru i)(s=0),($s0),fp:(fp v)(6)

sw $t0, 0($sp)      #i=0
sw $t1, 4($fp)
la $t2, array

for_sum:
bge $t0, $t1, et2
lw $t0, 4($sp)
lw $s0, 0($t2)
add $t0, $t0, $s0
sw $t0, 4($sp)
lw $t0, 0($sp)
addi $t2,4
addi $t0,1
sw $t0,0($sp)
j for_sum

et2:
lw $v0, 4($sp)
addu $sp,8   # sp:($s0),fp:(fp v)(6)

lw $s0, 0($sp)   #restauram valoarea lui s0
lw $fp, 0($fp)
addu $sp,8       #descarc cadrul de apel
jr $ra
