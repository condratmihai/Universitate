.data
n: .space 4
s: .word 0
sir1: .asciiz "Introduceti un numar n = "
sir2: .asciiz "Suma cifrelor sale este:  "

.text
main:
li $v0,4
la $a0, sir1
syscall
li $v0,5
syscall
sw $v0,n
lw $t0,n
lw $t1,s
li $t2, 10
intrare:
beqz $t0, sfarsit
div $t0,$t2
mflo $t0
mfhi $t3
add $t1,$t1, $t3
j intrare

sfarsit:
sw $t1,s
li $v0, 4
la $a0, sir2
syscall
li $v0, 1
lw $a0, s
syscall
li $v0,10
syscall
