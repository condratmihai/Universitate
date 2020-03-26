.data
y:.word 1
z:.word 1
n:.space 4
x:.space 4
sir1: .asciiz "Introduceti numarul termenului pe care vreti sa il aflati n = "
sir2: .asciiz "Al n-lea termen este "

.text
main:
li $v0,4
la $a0, sir1
syscall
li $v0,5
syscall
sw $v0,n
li $t0,1
et:
lw $t1,n
bgt $t0,$t1,sfarsit
  lw $t1,y
  sw $t1,x
  lw $t2,z
  sw $t2,y
  add $t2,$t2,$t1
  sw $t2,z
  addi $t0,$t0,1
  b et
sfarsit:
li $v0, 4
la $a0, sir2
syscall
li $v0, 1
lw $a0, x
syscall
li $v0,10
syscall
