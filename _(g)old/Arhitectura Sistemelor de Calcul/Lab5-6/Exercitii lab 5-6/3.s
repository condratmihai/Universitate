#3).data
  x: .word 1
  y: .word 2
  z: .word 10
  rez1: .space 4
  rez2: .space 4
.text
main:
  la $a0,rez1
  lw $a1,x
  lw $a2,y
  jal aduna
    # acum rez1 = 3
  la $a0,rez2
  lw $a1,z
  li $a2,20
  jal aduna
    # acum rez2 = 30
li $v0,10
syscall
aduna:
  add $a1,$a1,$a2
  sw $a1,0($a0)
jr $ra
