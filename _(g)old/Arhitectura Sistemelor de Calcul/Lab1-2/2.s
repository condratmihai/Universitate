.data
 x:.space 4  #alocam spatiu de 4 bytes pentru a putea retine la adresa x un word
 y:.space 4
.text
main:
 li $t0,1   #se incarca 1 in t0
 sw $t0,x   #din t0 se scrie in memorie la adresa x
 li $t0,2   #se incarca 2 in t0
 sw $t0,y   #din t0 se scrie in memorie la adresa y
# de aici e ca inainte
 lw $t0,x
 lw $t1,y
 sw $t0,y
 sw $t1,x
li $v0,10
syscall