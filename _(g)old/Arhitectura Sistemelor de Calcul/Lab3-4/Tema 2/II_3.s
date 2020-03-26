.data
n:.space 4
i:.space 4
s:.space 4
sir1: .asciiz "Introduceti un numar n = "
sir2: .asciiz "Suma divizorilor sai este:  "
.text
main:
li $v0,4
la $a0, sir1
syscall
li $v0,5
syscall
sw $v0,n
li $t0,1
lw $t1,n
beq $t0,$t1,et1
lw $t2,n
addi $t2,$t2,1
sw $t2,s
li $t0,2
sw $t0,i
et:
lw $t1,n
srl $t1,$t1,1
bgt $t0,$t1,sfarsit
  lw $t1,n
  div $t1,$t0
  mfhi $t1
  addi $t0,$t0,1
  sw $t0,i
  bnez $t1,et
  add $t2,$t2,$t0
  addi $t2,$t2,-1
  sw $t2,s
  b et
et1:
sw $t0,s
sfarsit:
li $v0, 4
la $a0, sir2
syscall
li $v0, 1
lw $a0, s
syscall
li $v0,10
syscall
