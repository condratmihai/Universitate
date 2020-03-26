#3)
.data
sir1: .asciiz "Introduceti primul numar x = "
sir2: .asciiz "Indtroduceti cel de-al doilea numar y = "
sir3: .asciiz "cmmdc(x,y) = "
.text
main:
  li $v0,4
  la $a0,sir1
  syscall

  li $v0,5
  syscall
  move $t0, $v0

  li $v0,4
  la $a0,sir2
  syscall

  li $v0,5
  syscall
  move $t1, $v0

 inceput:
  beq $t0,$t1,egale
    bltu $t0,$t1,maimic
      subu $t0,$t0,$t1
      b inceput
    maimic:
      subu $t1,$t1,$t0
      b inceput
  egale:
move $t2, $t0
li $v0,4
la $a0,sir3
syscall

li $v0,1
move $a0, $t2
syscall
li $v0,10
syscall
