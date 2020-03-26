#9)
.data
 v:.word 1 2 3
 n:.word 3
 i:.space 4
 s:.space 4

.text

main:
 li $t0,0
 sw $t0,s
 li $t0,0
 sw $t0,i


intrare:
 lw $t1,n
 sll $t1,$t1,2
 bge $t0,$t1,iesire
 lw $t0,v($t0)
 lw $t1,s
 add $t1,$t1,$t0
 sw $t1,s
 lw $t0,i
 addi $t0,$t0,4
 sw $t0,i
 j intrare

iesire:
li $v0,10
syscall
