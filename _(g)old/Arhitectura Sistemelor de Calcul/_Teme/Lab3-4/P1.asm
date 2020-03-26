.data
x: .word 1
y: .word 1
z: .word 2
n: .word 5

.text

lw $t0, n
li $t1, 3

lw $t3, x
lw $t4, y
lw $t5, z

loop:

add $t5, $t3, $t4
move $t3, $t4
move $t4, $t5

sub $t2, $t0, $t1
add $t1, $t1, 1
bgtz $t2, loop

end:
li $v0, 10
syscall
