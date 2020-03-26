#2)
.text
main:
  jal proc
li $v0,10
syscall
.data
  nl: .asciiz "\n"
.text
proc:           # la intrarea in procedura stiva este vida
    # rezervam spatiu pe stiva pentru entitatile cu locatie fixa pe perioada
    #  apelului - acest spatiu se va numi cadru de apel (vom vedea)
  subu $sp,16
    # salvam registrii callee-saved pe care ii modificam, in cadrul de apel
  sw $fp,12($sp)
  sw $s0,8($sp)
    # convenind ca sub cei doi registri salvati sa avem q, p,
    #  acum stiva este $sp:(q)(p)($s0 v)($fp v)
  addiu $fp,$sp,12  # plasam $fp sa pointeze primul word din cadru
    # acum stiva este $sp:(q)(p)($s0 v)$fp:($fp v)
    #  deci p este la -8($fp) iar q la -12($fp) (offset-uri fixe)
    # puteam alege orice pozitie pentru a plasa sa pointeze $fp, dar am
    #  ales-o pe aceasta (primul word din cadru) pentru a ne conforma unor
    #  conventii MIPS (a se vedea mai jos)
  sw $zero,-8($fp)   # p=0;
  sw $zero,-12($fp)  # q=0;
  li $s0,0           # aloc i in $s0; acum fac i=0;
  li $t0,3           # fixez $t0 la valoarea 3
  inceput:
  bge $s0,$t0,sfarsit
    lw $t1,-8($fp)
    add $t1,1
    sw $t1,-8($fp)     # ++p
      # evaluez (q+i)*(q-i)-p*i cu stiva
      # reamintim ca acum stiva este $sp:(q)(p)($s0 v)$fp:($fp v)
    lw $t1,-8($fp)     # evaluez p*i si incarc in stiva
    mulo $t1,$t1,$s0   #
    subu $sp,4         #
    sw $t1,0($sp)
      # acum stiva este $sp:(p*i)(q)(p)($s0 v)$fp:($fp v)
      # desi acum p, q sunt la alte offset-uri fata de $sp, ele sunt la
      #  aceleasi offset-uri (-8, respectiv -12) fata de $fp
    lw $t1,-12($fp)    # evaluez q-i si incarc in stiva
    sub $t1,$t1,$s0    #
    subu $sp,4         #
    sw $t1,0($sp)      #
      # acum stiva este $sp:(q-i)(p*i)(q)(p)($s0 v)$fp:($fp v)
    lw $t1,-12($fp)    # evaluez $t1=q+i
    add $t1,$t1,$s0    #
    lw $t2,0($sp)     # descarc din stiva q-i si evaluez $t1=(q+i)*(q-i)
    addu $sp,4        #
    mulo $t1,$t1,$t2  #
      # acum stiva este $sp:(p*i)(q)(p)($s0 v)$fp:($fp v)
    lw $t2,0($sp)     # descarc din stiva p*i si evaluez $t1=(q+i)*(q-i)-p*i
    addu $sp,4        #
    sub $t1,$t1,$t2   #
      # acum stiva este $sp:(q)(p)($s0 v)$fp:($fp v)
    sw $t1,-12($fp)   # atribui q=(q+i)*(q-i)-p*i
      # afisez q
    li $v0,1        # print int
    lw $a0,-12($fp) # $a0=q
    syscall
    li $v0,4        # print string
    la $a0,nl
    syscall
    add $s0,1     # ++i
    b inceput
  sfarsit:
    # acum stiva este $sp:(q)(p)($s0 v)$fp:($fp v)
    # restauram registrii callee-saved salvati la inceput, $s0 si $fp
  lw $s0,-4($fp)
  lw $fp,0($fp)   # acum nu mai pot accesa cadrul cu $fp caci are alta val.
  addu $sp,16     # descarc cadrul de apel
    # inaintea iesirii din procedura stiva este iar vida, ca la inceput
jr $ra
