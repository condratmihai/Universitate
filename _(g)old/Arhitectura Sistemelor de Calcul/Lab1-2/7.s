.data
 x: .word 4
 y: .word 3
 z: .word 5
 max: .space 4

.text
main:
 lw $t0,x
 lw $t1,y
 lw $t2,z
 blt $t0,$t1,et1
 bge $t2,$t0,et2
 sw $t0,max
 j sfarsit

et1:
 ble $t1,$t2,et2
 sw $t1,max
 j sfarsit

et2:
 sw $t2,max

sfarsit:
 li $v0,10
 syscall
