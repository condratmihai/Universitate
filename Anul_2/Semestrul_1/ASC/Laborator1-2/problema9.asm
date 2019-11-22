.data
x: .word 1, 2, 3, 7, 8, 9
n: .word 6

.text
main:

lw $t0, n

mulo $t0, $t0, 4

sub $t0, $t0, 4

li $s1, 0

tag:
lw $t1, x($t0)
add $s1, $s1, $t1
sub $t0, $t0, 4

bgez $t0, tag

#echivalent return 0;
li $v0, 10
syscall












