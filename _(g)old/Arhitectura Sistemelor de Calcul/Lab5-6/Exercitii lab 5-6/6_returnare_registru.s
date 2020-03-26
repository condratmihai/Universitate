.data
  x: .space 4
.text
main:
  subu $sp,8      # incarc parametrii actuali
  li $t0,1
  sw $t0,0($sp)
  li $t0,2
  sw $t0,4($sp)  # acum stiva este $sp:(1)(2)
  jal f
  addu $sp,8     # descarc parametrii actuali
  sw $v0,x       # recuperez valoarea returnata
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
  add $v0,$t1,$t0  # $v0 = p*p + q*q
  lw $fp,0($fp)    # restauram $fp
  addu $sp,4       # descarc cadrul de apel; acum stiva este iar $sp:(p)(q)
jr $ra
