#1)

.data
x: .word 1
y: .word 2
z: .word 3
e: .space 4
.text
main:
 # evaluam x <= y si stocam raspunsul 1(true)/0(false) in $s0
lw $t0,x
lw $t1,y
sleu $s0,$t0,$t1
 # evaluam x != z si stocam raspunsul 1/0 in $s1
lw $t0,x
lw $t1,z
sne $s1,$t0,$t1
 # evaluam (x<=y || x!=z ), adica ($s0 or $s1),si stocam raspunsul 1/0 in $s0
or $s0,$s0,$s1
 # evaluam y == z si stocam raspunsul 1/0 in $s1
lw $t0,y
lw $t1,z
seq $s1,$t0,$t1
 # evaluam (x<=y || x!=z ) && (y == z), adica ($s0 and $s1),
 #  si stocam raspunsul 1/0 in $v0, apoi in memorie
and  $v0,$s0,$s1
sw $v0,e
li $v0,10
syscall
