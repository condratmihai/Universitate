.data
n:.word 5
z:.word 0
sir1: .asciiz "Al "
sir2: .asciiz "-lea termen al sirului lui Fibonacci este "

.text
main:
li $t0,0
subu $sp,4
sw $t0,0($sp)
li $t0,1
subu $sp,4
sw $t0,0($sp)
li $t0,1
subu $sp,4
sw $t0,0($sp)
et:
lw $t1,n
bgt $t0,$t1,sfarsit
   lw $t1,4($sp)
   sw $t1,8($sp)
   lw $t2,0($sp)
   sw $t2,4($sp)
   add $t2,$t2,$t1
   sw $t2,0($sp)
   addi $t0,$t0,1
   b et
sfarsit:
lw $t0, 8($sp)
addu $sp,12
sw $t0,z
li $v0,4
la $a0,sir1
syscall
li $v0,1
lw $a0,n
syscall
li $v0,4
la $a0,sir2
syscall
li $v0,1
lw $a0,z
syscall
li $v0,10
syscall
