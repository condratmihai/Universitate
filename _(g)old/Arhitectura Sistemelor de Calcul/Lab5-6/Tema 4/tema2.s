.data
v: .space 24

.text
main:
  li $t0,0
  li $t1,1

  li $v0,5
  syscall
  move $t2, $v0

  la $t3,v
  li $t4,6
  for1:

  bge $t0,$t4, et
  subu $sp, 12          #reg caller-saved
  sw $t1, 0($sp)
  sw $t3, 4($sp)
  sw $t4, 8($sp)

  subu $sp,8          #parametri ( tot caller-saved, dar pusi separat ca sunt parametri)
  sw $t0, 0($sp)
  sw $t2, 4($sp)

  jal g

  lw $t0, 0($sp)
  lw $t2, 4($sp)  #restauram valoarea parametrilor
  addu $sp,8

  lw $t1, 0($sp)
  lw $t3, 4($sp)
  lw $t4, 8($sp)   #restauram valoarea celorlalti registri caller-saved
  addu $sp,12

  sw $v0, 0($t3)
  addi $t3,4
  addi $t0,1
  j for1

  et:
  li $t0,0
  la $t3,v

  for2:
  bge $t0,$t4, et4
  lw $t2, 0($t3)
  mul $t1, $t1, $t2
  addi $t0,1
  addi $t3,4
  j for2

  et4:
  li $v0,1
  move $a0,$t1
  syscall

  sfarsit:
  li $v0, 10
  syscall

  g:
  subu $sp,4                  #sp,fp:(fp v)(i)(k)(p=1)(adr v)(6)
  sw $fp, 0($sp)
  addiu $fp,$sp,0


  subu $sp,4
  lw $t0, 12($sp)
  lw $t1, 8($sp)
  add $t0, $t0, $t1
  sw $t0, 0($sp)      #sp:(r=k+i),fp:(fp v)(i)(k)(p=1)(adr v)(6)

  rem $t0,$t0,2
  beqz $t0, et2
  lw $v0, 8($sp)
  mul $v0, $v0, $v0
  addi $v0,2
  j et3

  et2:
  lw $v0, 8($sp)
  mul $v0,$v0,3

  et3:

  addu $sp,4
  lw $fp, 0($fp)  #descarc cadrul de apel
  addu $sp,4

  jr $ra
