.data
  n: .space 4
  x: .byte 1
  sir1: .asciiz "Introduceti un numar n = "
  sir2: .asciiz "Numarul este prim "
  sir3: .asciiz "Numarul nu este prim "
.text
main:
li $v0,4
la $a0, sir1
syscall
li $v0,5
syscall
sw $v0,n
lw $t0,n
li $t1,1
beq $t0, $t1, et
srl $t2, $t0, 1
addi $t1, $t1, 1

intrare:
bgt $t1, $t2, sfarsit
div $t0, $t1
mfhi $t3
beqz $t3, et
addi $t1, $t1, 1
j intrare

et:
li $t0,0
sb $t0,x

sfarsit:
li $v0, 4
lb $t0, x
bnez $t0, prim
la $a0, sir3
j afisare
prim:
la $a0, sir2
afisare:
syscall
li $v0,10
syscall
