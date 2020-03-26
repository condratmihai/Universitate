#swap
.data
 x:.word 1
 y:.word 2
.text
main:
 lw $t0,x  #se incarca din memorie de la adresa lui x in registrul t0
 lw $t1,y  #se incarca din memorie de la adresa lui y in registrul t1
 sw $t0,y  #se scrie in memorie la adresa lui x din registrul t1 ( cel in care se afla valoarea lui y)
 sw $t1,x  #se scrie in memorie la adresa lui y din registrul t0 ( cel in care se afla valoarea lui x)
li $v0,10
syscall
