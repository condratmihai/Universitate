#6)
.data
 v:.word 2, 1, 3, 2, 3  # vectorul
 n:.word 5              # nr. de elemente ale vectorului
 i:.space 4             # indice (putem folosi si un registru)
 max:.space 4           # aici vom stoca valoarea maxima
.text
main:
#initializari
 li $t0,0
 sw $t0,i    # i:=0
 lw $t0,v
 sw $t0,max  # max:=v[0]
#ciclu
intrare:
 lw $t0,i
 addi $t0,$t0,1
 sw $t0,i            # i:=i+1
 lw $t1,n
 bge $t0,$t1,iesire  # daca i>=n iesim din ciclu
 add $t0,$t0,$t0
 add $t0,$t0,$t0     # acum $t0=4*i, adica offsetul in octeti al lui v[i]
                     #  fata de v
 lw $t0,v($t0)       # $t0:=v[i]
 lw $t1,max
 ble $t0,$t1,et
 sw $t0,max
et:
 j intrare
iesire:
li $v0,10
syscall