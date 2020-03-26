.data
i: .word 0
e: .byte 10, 20, '+', 10, 15, '+', '-', 4, 3, '-', '-', 0


.text

main:


lw $t0, i
lb $t1, e($t0)



while:
		beqz $t1, iesire
		beq $t1, '+', et1
		beq $t1, '-', et2
		subu $sp, 4
		sw $t1, 0($sp)
while1:
		addi $t0, $t0, 1
		lb $t1, e($t0)

j while


et1:

lw $t3, 0($sp)
lw $t4, 4($sp)
addu $sp, 8
add $t3, $t4, $t3
subu $sp, 4
sw $t3, 0($sp)

j while1

et2:

lw $t3, 0($sp)
lw $t4, 4($sp)
addu $sp, 8
sub $t3, $t4, $t3
subu $sp, 4
sw $t3, 0($sp)

j while1

iesire:

lw $t0, 0($sp)
addu $sp, 4
li $v0, 1
move $a0, $t0
syscall


li $v0, 10
syscall
