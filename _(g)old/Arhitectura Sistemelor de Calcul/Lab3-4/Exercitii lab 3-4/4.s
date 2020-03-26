#4)
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
  beqz $t1, sfarsit
  divu $t0,$t1   # lo <- $t0 / $t1; hi <- $t0 % $t1
  move $t0,$t1   # $t0 <- $t1
  mfhi $t1       # $t1 <- hi
  b inceput
 sfarsit:
  move $t2,$t0
  li $v0,4
  la $a0,sir3
  syscall

  li $v0,1
  move $a0, $t2
  syscall
li $v0,10
