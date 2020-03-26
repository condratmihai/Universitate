#6)

#Intrucat in MIPS nu putem defini structuri, vom simula structura sub forma
# unui vector de 2 word-uri; primul word va contine "inf", al doilea "leg".


.data

cap: .space 4  # capul listei; retine adr. primului element
nr_elemente:     .asciiz "Nr. de elemente ale listei: "
dati_elementele: .ascii  "Dati elementele listei, "
                 .asciiz "cate unul pe linie:\n"
am_citit:        .asciiz "Am citit lista: "
blank:           .asciiz " "
nl:              .asciiz "\n"


.text
main:
 # citim nr. de elemente ale listei
li $v0, 4  # print string
la $a0,nr_elemente
syscall
li $v0,5   # read int
syscall
move $t1,$v0  # $t1 va retine nr. de elemente ale listei
 # alocam si citim elementele listei
li $v0,4   # print string
la $a0,dati_elementele
syscall
li $t0,0      # $t0 va fi numarul de ordine al elementului curent
la $t2,cap    # $t2 va fi adresa locului unde se va stoca adresa urmatorului element de lista
citesc:
bge $t0,$t1,citit
  # aloc un element (2 word, unul pt. valoare, unul pt. adr. urmatorului)
  li $v0,9   # sbrk
  li $a0,8
  syscall
  move $t3,$v0
  # citim valoarea elementului
  li $v0,5
  syscall
  sw $v0,0($t3)
  sw $zero,4($t3)  # deocamdata in campul de adr. urm. elem. pun nul
  sw $t3,($t2)  #la *t2 adica la adr ce retinea al doilea camp/cap pune adresa urmatorului elem
  addu $t2,$t3,4 #t2 acum retine din nou adr celui de-al doilea camp
  addiu $t0,1
  b citesc
citit:
 # afisam elementele listei pana intalnim terminatorul nul
li $v0,4   # print string
la $a0,am_citit
syscall
lw $t3,cap
scriu:
beq $t3,$zero,scris
  li $v0,1   # print int
  lw $a0,0($t3)
  syscall
  li $v0,4   # print string
  la $a0,blank
  syscall
  lw $t3,4($t3)
  b scriu
scris:
li $v0,4   # print string
la $a0,nl
syscall
li $v0,10
syscall
##########
