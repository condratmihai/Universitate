.data
 v:.word 11 1 7 9 10
 n:.word 5
 x:.word 7
 y:.space 4
 i:.space 4

.text

main:
 li $t0,0
 sw $t0,y
 li $t0,0
 sw $t0,i


intrare:
 lw $t1,n
 sll $t1,$t1,2
 bge $t0,$t1,iesire
 lw $t0,v($t0)
 lw $t1,x
 beq $t0,$t1,et1
 lw $t0,i
 addi $t0,$t0,4
 sw $t0,i
 j intrare

et1:
li $t0,1
sw $t0,y

iesire:
li $v0,10
syscall
