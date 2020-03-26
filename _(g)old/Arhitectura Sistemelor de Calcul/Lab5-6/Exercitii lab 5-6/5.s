#5)
.data
  x: .word 1
  y: .word 2
  z: .word 10
  rez1: .space 4
  rez2: .space 4
.text
main:
    # push y, x, adr. rez1
  subu $sp,12
  la $t0,rez1
  sw $t0,0($sp)
  lw $t0,x
  sw $t0,4($sp)
  lw $t0,y
  sw $t0,8($sp)
    # acum stiva contine $sp:(adr.rez1)(x)(y)
  jal aduna
    # acum rez1 = 3
    # stiva insa contine (ca la inceput) $sp:(adr.rez1)(x)(y) si o descarc
  addu $sp,12
    # acum stiva este vida
    # push 20, z, adr. rez2
  subu $sp,12
  la $t0,rez2
  sw $t0,0($sp)
  lw $t0,z
  sw $t0,4($sp)
  li $t0,20
  sw $t0,8($sp)
    # acum stiva contine $sp:(adr.rez2)(z)(20)
  jal aduna
    # acum rez2 = 30
    # stiva insa contine (ca la inceput) $sp:(adr.rez2)(z)(20) si o descarc
  addu $sp,12
    # acum stiva este vida
li $v0,10
syscall
aduna:  # la intrarea in apel stiva este $sp:(r)(p)(q)
  subu $sp,4
  sw $fp,0($sp)    # salvam $fp
  addiu $fp,$sp,0  # acum stiva este $sp:$fp:($fp v)(r)(p)(q)
  lw $t0,8($fp)
  lw $t1,12($fp)
  add $t0,$t0,$t1
  lw $t1,4($fp)
  sw $t0,0($t1)
  lw $fp,0($fp) # restauram $fp
  addu $sp,4    # descarc cadrul de apel; acum stiva este iar $sp:(r)(p)(q)
jr $ra
