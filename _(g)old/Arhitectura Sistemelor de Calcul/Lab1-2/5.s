#5)
#sort(x,y,z)
.data
 x:.word 3
 y:.word 1
 z:.word 2
.text
main:
 lw $t0,x
 lw $t1,y
 ble $t0,$t1,et1
 sw $t0,y
 sw $t1,x
et1:
 lw $t0,y
 lw $t1,z
 ble $t0,$t1,et2
 sw $t0,z
 sw $t1,y
et2:
 lw $t0,x
 lw $t1,y
 ble $t0,$t1,et3
 sw $t0,y
 sw $t1,x
et3:
li $v0,10
syscall
