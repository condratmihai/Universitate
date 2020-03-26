.data
coefa: .space 4 #initalizarea din program ar fi coefa: .float 2.0
coefb: .space 4
x: .space 4  # va contine solutia
e: .space 4  # va contine: 1 (sol. unica), 2 (inf. de sol), 3 (fara sol.)
sir1: .asciiz "Rezolvarea ecuatiei de gradul 1, ax + b = 0: \n"
sir2: .asciiz "a = "
sir3: .asciiz "b = "
sir4: .asciiz "Ecuatia are solutie unica, x = "
sir5: .asciiz "Ecuatia are o infinitate de solutii"
sir6: .asciiz "Ecuatia nu are nicio solutie"
.text
main:
li $v0,4
la $a0,sir1
syscall

li $v0,4
la $a0,sir2
syscall

li $v0,6
syscall
s.s $f0, coefa

li $v0,4
la $a0,sir3
syscall

li $v0,6
syscall
s.s $f0, coefb

li.s $f0,0.0     # $f0 <- 0.0
l.s $f1,coefa    # $f1 <- 2.0 (coefa)
l.s $f2,coefb    # $f2 <- 9.5 (coefb)
c.eq.s 0, $f1, $f0  # daca $f1=0 setam flag-ul 0 la valoarea 1
bc1t 0,et1         # daca flag-ul 0 are val. 1, salt la et. "et1"
 # cazul coefa nenul
neg.s $f2,$f2      # $f2 <- - coefb
div.s $f2,$f2,$f1  # $f2 <- - coefb/coefa
s.s $f2,x          # scriem sol. la adr. x
li $t0,1
sw $t0,e           # solutie unica
j sfarsit
 # cazul coefa nul
et1:
c.eq.s $f2, $f0  # daca $f2=0 setam flag-ul 0 la valoarea 1
bc1t et2         # daca flag-ul 0 are val. 1, salt la et. "et2"
 # cazul coefa nul, coefb nenul
li $t0,3
sw $t0,e           # fara solutii
j sfarsit
 # cazul coefa nul, coefb nul
et2:
li $t0,2
sw $t0,e           # infinitate de solutii
sfarsit:
lw $t0,e
li $t1,1


beq $t0,$t1, sol
li $t1,2
beq $t0,$t1,inf_sol
la $a0,sir6
j afisare

inf_sol:
la $a0,sir5
afisare:
li $v0, 4
syscall
j final

sol:
la $a0, sir4
li $v0,4
syscall
li $v0,2
l.s $f12,x
syscall


final:
li $v0,10
syscall
