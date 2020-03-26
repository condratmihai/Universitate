.data
 x:.word 1
 y:.word 2
.text
main:
 la $t2,x      # incarca in $t2 adresa corespunzatoare lui "x"
 lw $t0,0($t2) # incarca in $t0 word-ul aflat la distanta 0 de x, adica 1
 lw $t1,4($t2) # incarca in $t1 word-ul aflat la distanta 4 de x, 
               # adica la distanta 0 de y, adica 2
 sw $t0,4($t2)
 sw $t1,0($t2)
li $v0,10
syscall