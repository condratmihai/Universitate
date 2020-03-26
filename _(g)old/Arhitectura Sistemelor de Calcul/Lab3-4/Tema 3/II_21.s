.data
v1: .byte 1, 2, 3, 4, 5
v2: .byte 1, 1, 1, 1, 2
n: .word 5
p: .space 4

.text
main:

li $t2, 0
lw $t3, n
li $t4, 0
la $t0, v1
la $t1, v2

inceput:
bge $t2, $t3, sfarsit
lb $t0, 0($t0)
lb $t1, 0($t1)
mult $t0, $t1
mflo $t0
add $t4, $t4, $t0
addi $t2,1
la $t0, v1
la $t1, v2
add $t0,$t0, $t2
add $t1, $t1, $t2

j inceput

sfarsit:
sw $t4, p
li $v0, 10
syscall
