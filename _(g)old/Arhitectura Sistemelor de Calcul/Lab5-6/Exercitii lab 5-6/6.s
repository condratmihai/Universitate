#6)
.data
  x: .space 4
.text
main:
  subu $sp,8      # incarc parametrii actuali
  li $t0,1
  sw $t0,0($sp)
  li $t0,2
  sw $t0,4($sp)
    # acum stiva este $sp:(1)(2)
  jal f
    # acum stiva este $sp:(5)  (are in locul parametrilor valoarea returnata)
  lw $t0,0($sp)  # descarc valoarea
  addu $sp,4     #  returnata
  sw $t0,x       # si o recuperez (in x)
    # acum x = 5
li $v0,10
syscall
f:              # la intrarea in apel stiva este $sp:(p)(q)
  subu $sp,4
  sw $fp,0($sp)    # salvam $fp
  addiu $fp,$sp,0  # acum stiva este $sp:$fp:($fp v)(p)(q)
  lw $t0,4($fp)    # $t0 = p
  mul $t0,$t0,$t0  # $t0 = p*p
  subu $sp,4
  sw $t0,0($sp)    # acum stiva este $sp:(p*p)$fp:($fp v)(p)(q)
  lw $t0,8($fp)    # $t0 = q
  mul $t0,$t0,$t0  # $t0 = q*q
  lw $t1,0($sp)    # $t1 = p*p
  addu $sp,4       # acum stiva este $sp:$fp:($fp v)(p)(q)
  add $t1,$t1,$t0  # $t1 = p*p + q*q (rezultatul)
    # incepand de acum pregatesc stiva pentru retur
  sw $t1,8($fp)    # acum stiva este $sp:$fp:($fp v)(p)(rezultat)
  lw $fp,0($fp)    # restauram $fp; stiva este $sp:($fp v)(p)(rezultat)
  addu $sp,8       # descarc cadrul de apel si gloesc stiva pana la rezultat
    # acum stiva este $sp:(rezultat)
jr $ra
