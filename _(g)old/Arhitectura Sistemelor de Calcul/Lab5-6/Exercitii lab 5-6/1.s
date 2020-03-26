#1)
.data
  s: .word 1
.text
main:
  li $s0,0  # alocam i din "main" in $s0
  inceput:
  li $t0,3
  bge $s0,$t0 sfarsit
    move $t0,$s0      # in $t0 calculam i*i, apoi i*i*i
    mulo $t0,$t0,$s0  # acum, $t0 = i*i
    lw $t1,s
    add $t1,$t1,$t0
    sw $t1,s
    subu $sp,4     # $t0 ne trebuie si mai tarziu si nu e salvat de apelat,
    sw $t0,0($sp)  #  deci il salvam in apelant; acum stiva este: $sp:($t0 v)
    jal linie_s
    lw $t0,0($sp)  # dupa revenire stiva este tot: $sp:($t0 v)
    addu $sp,4     #  si restauram $t0 la revenirea in apelant
    mulo $t0,$t0,$s0  # acum, $t0 = i*i*i
    lw $t1,s
    add $t1,$t1,$t0
    sw $t1,s
    jal linie_s  # acum nu ne mai trebuie in apelant $t0 si nu-l mai salvam
    add $s0,1
    b inceput
  sfarsit:
li $v0,10
syscall
.data
  stea:  .asciiz "*"
  linie: .asciiz "-"
  nl:    .asciiz "\n"
.text
linie_s:       # stiva primita la inceput este:  $sp:($t0 v)
  subu $sp,4    # salvam $s0 in apelat, deoarece il va modifica
  sw $s0,0($sp) #        acum stiva este:  $sp:($s0 v)($t0 v)
  li $s0,0  # alocam i din "linie_s1" in $s0
  inceput1:
  lw $t0,s
  bge $s0,$t0,sfarsit1
    li $v0,4  # print string
    la $a0,stea
    syscall
    add $s0,1
    b inceput1
  sfarsit1:
  li $v0,4
  la $a0,nl
  syscall
  lw $s0,0($sp) # restauram valoarea veche a lui $s0;
  addu $sp,4    #  acum stiva este ca la inceput: $sp:($t0 v)
jr $ra
