#8)
.data
  n: .word 5
  x: .word 1
  y: .word 1
  z: .space 4
.text
main:
  li $s0,2 # alocam i in $s0
  inceput:
  lw $t0,n
  bge $s0,$t0,sfarsit
    subu $sp,8    # incarcam parametrii pt. "iteratie", conform conventiei C
    la $t0,y
    sw $t0,4($sp)
    la $t0,x
    sw $t0,0($sp) # $sp:(&x)(&y)
    jal iteratie
    addu $sp,8    # descarcam stiva de par. actuali ai lui "iteratie"
  add $s0,$s0,1
  b inceput
  sfarsit:
  lw $t0,y
  sw $t0,z  # acum z contine 5
li $v0,10
syscall
iteratie: # primeste parametri adrese $sp:(a)(b)
    # alocam un cadru de apel in care vom salva $ra, $fp, si vom aloca c
  subu $sp,12
  sw $ra,8($sp)
  sw $fp,4($sp)
  addiu $fp,$sp,8  # acum $sp:(c)($fp v)$fp:($ra v)(a)(b)
    # incarc parametrii actuali pentru "aduna"
  subu $sp,8
  lw $t0,8($fp)
  lw $t0,0($t0)
  sw $t0,4($sp)  # push *b
  lw $t0,4($fp)
  lw $t0,0($t0)
  sw $t0,0($sp)  # push *a
    # acum $sp:(*a=x)(*b=y)(c)($fp v)$fp:($ra v)(a=&x)(b=&y)
  jal aduna
    # am convenit ca "aduna" sa returneze prin stiva, deci acum:
    # $sp:(x+y)(c)($fp v)$fp:($ra v)(a=&x)(b=&y)
  lw $t0,0($sp)
  addu $sp,4      # pop valoarea returnata de "aduna"
    # acum $sp:(c)($fp v)$fp:($ra v)(a=&x)(b=&y)
  sw $t0,-8($fp)  # c=aduna(*a,*b)
  lw $t0,8($fp)
  lw $t0,0($t0)
  lw $t1,4($fp)
  sw $t0,0($t1)   # (*a)=(*b), adica x=y
  lw $t0,-8($fp)
  lw $t1,8($fp)
  sw $t0,0($t1)   # (*b)=c, adica y=c
    # restauram registrii calee-saved, descarcam cadrul de apel si revenim
  lw $ra,0($fp)
  lw $fp,-4($fp)
  addu $sp,12
jr $ra
aduna: # primeste parametri intregi $sp:(a)(b)
    # alocam un cadru de apel in care salvam $fp
  subu $sp,4
  sw $fp,0($sp)
  addiu $fp,$sp,0
    # acum stiva (desenata vertical) este:
    #   $sp:$fp:($fp vechi salvat de "aduna" si care pointeaza |)
    #           (a al lui "aduna" = x)                         |
    #           (b al lui "aduna" = y)                         |
    #           (loc c al lui "iteratie")                      |
    #           ($fp vechi salvat de "iteratie")               |
    #           ($ra vechi salvat de "iteratie")  <------------|
    #           (a al lui "iteratie" = &x)
    #           (b al lui "iteratie" = &y)
  lw $t0,4($fp)
  lw $t1,8($fp)
  add $t0,$t0,$t1  # $t0=a+b
    # pregatim stiva cu valoarea returnata
  sw $t0,8($fp)
  lw $fp,0($fp)
  addu $sp,8
jr $ra
