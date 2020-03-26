#7)
.data
  s: .space 4
.text
main:
  subu $sp,16   # incarcam parametrii, conform conventiei C
  li $t0,3
  sw $t0,12($sp)
  li $t0,2
  sw $t0,8($sp)
  li $t0,1
  sw $t0,4($sp)
  li $t0,3
  sw $t0,0($sp)
  jal aduna      # functia returneaza in $v0
  addu $sp,16    # descarcam atatia par. cati am incarcat (adica 4 parametri)
  sw $v0,s       # val. ret. este in $v0
    # acum s contine 6
  subu $sp,12
  li $t0,20
  sw $t0,8($sp)
  li $t0,10
  sw $t0,4($sp)
  li $t0,2
  sw $t0,0($sp)
  jal aduna
  addu $sp,12     # acum am incarcat doar 3 par., deci descarc doar 3 par.
  sw $v0,s
    # acum s contine 30
li $v0,10
syscall
aduna:   # primeste o stiva de forma $sp:(n)()()()...
  subu $sp,16      # rezerv loc pt. salvat $fp si pentru i,s,l din functie
  sw $fp,12($sp)
  addiu $fp,$sp,12
    # acum stiva este $sp:(l)(s)(i)$fp:($fp v)(n)()()()...
  addu $t0,$fp,8
  sw $t0,-12($fp)  # va_start(l,n); avem $sp:(l)(s)(i)$fp:($fp v)(n)l:()()...
  sw $zero,-8($fp) # s=0
  sw $zero,-4($fp) # i=0
  aduna_et1:
  lw $t0,-4($fp)
  lw $t1,4($fp)
  bge $t0,$t1,aduna_et2  # daca i>=n iesim
    lw $t0,-12($fp)
    addu $t0,4           # 4 este sizeof(int)
    sw $t0,-12($fp)
    lw $t0,-4($t0)       # 4 este sizeof(int)
    lw $t1,-8($fp)
    add $t1,$t1,$t0
    sw $t1,-8($fp)       # s+=va_arg(i,int)
    lw $t0,-4($fp)
    add $t0,1
    sw $t0,-4($fp)       # ++i
    b aduna_et1
  aduna_et2:
    # in aceasta implementare nu avem ce executa pentru va_end(l)
  lw $v0,-8($fp)
  lw $fp,0($fp)
  addu $sp,16
jr $ra
