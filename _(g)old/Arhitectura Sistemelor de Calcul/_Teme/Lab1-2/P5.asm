.data
x: .word 2
y: .word 3
z: .word 1

.text
main:

lw $t0, x
lw $t1, y

#(x < y) => skip_y
ble $t0, $t1, skip_y
lw $t0, y
lw $t1, x
ble $t0, $t1, skip_x

skip_y:
#(y < z) => end
lw $t0, y
lw $t1, z
ble $t0, $t1, end
lw $t0, z
lw $t1, y
ble $t0, $t1, end

skip_x:
#(x < z) => end
lw $t0, x
lw $t1, z
ble $t0, $t1, end
lw $t0, z
lw $t1, x
ble $t0, $t1, end

end:
li $v0, 10
syscall





