#4)
.data
  x: .word 1
  y: .word 2
  z: .word 10
  rez1: .space 4
  rez2: .space 4
.text
main:
  la $t0,rez1
  sw $t0,r
  lw $t0,x
  sw $t0,p
  lw $t0,y
  sw $t0,q
  jal aduna
    # acum rez1 = 3
  la $t0,rez2
  sw $t0,r
  lw $t0,z
  sw $t0,p
  li $t0,20
  sw $t0,q
  jal aduna
    # acum rez2 = 30
li $v0,10
syscall
.data
  r: .space 4 # primul parametru al procedurii
  p: .space 4 # al doilea parametru al procedurii
  q: .space 4 # al treilea parametru al procedurii
.text
aduna:
  lw $t0,p
  lw $t1,q
  add $t0,$t0,$t1
  lw $t1,r
  sw $t0,0($t1)
jr $ra
