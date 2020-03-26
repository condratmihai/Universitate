#z:=max(x,y)
.data
 x:.word 2
 y:.word 1
 z:.space 4
.text
main:
 lw $t0,x
 lw $t1,y
 blt $t0,$t1,et1  #daca t0<t1 => sare la eticheta "et1", altfel continua cu urmatoarea instructiune
 sw $t0,z  #inseamnca ca t0>=t1, deci t1 maxim ( il scrie la adresa z)
 j sfarsit  #sare la eticheta "sfarsit"
et1:     #aici se realizeaza saritura daca t0<t1
 sw $t1,z  #daca s-a realizat saritura, t0<t1, deci maximul e t1
sfarsit:
li $v0,10
syscall
