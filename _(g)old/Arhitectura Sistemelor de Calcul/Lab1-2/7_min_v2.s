.data
x: .word  7
y: .word  9
z: .word  5
min: .space 4

.text
main:
lw $t0,x
sw $t0,min
lw $t1,y
ble $t0,$t1,et
sw $t1,min
et:
lw $t0,min
lw $t1,z
ble $t0,$t1,et1
sw $t1,min

et1:
li $t1,10
syscall
