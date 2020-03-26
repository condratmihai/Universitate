.data
x: .word 0x1,0x2,0x3,0x4,0x5,0x6       # si in C si aici, matricile sunt
y: .word 0x10,0x20,0x30,0x40,0x50,0x60 #  stocate liniarizat (se stocheaza
z: .space 24                           #  liniile una dupa alta)
 # suma va fi 0x11,0x22,0x33,0x44,0x55,0x66
nl: .word 2
nc: .word 3
.text
main:
lw $t6,nl
lw $t7,nc
li $t0,0  # ii=0
intrare_ciclu_linii:
bge $t0,$t6,iesire_ciclu_linii
  li $t1,0  # jj=0
  intrare_ciclu_coloane:
  bge $t1,$t7,iesire_ciclu_coloane
    mulo $t2,$t0,$t7    # $t2=ii*nc+jj, indicele in vectorul de liniarizare
    add   $t2,$t2,$t1   #   corespunzator pozitiei [ii][jj] din matrici
    sll $t2,$t2,2       # acum $t2 este offsetul in octeti al elementului
    lw $t3,x($t2)    # $t3=x[ii][jj]
    lw $t4,y($t2)    # $t4=y[ii][jj]
    add $t3,$t3,$t4  # $t3=x[ii][jj]+y[ii][jj]
    sw $t3,z($t2)    # z[ii][jj]=x[ii][jj]+y[ii][jj]
  addi $t1,$t1,1  # ++jj
  b intrare_ciclu_coloane
  iesire_ciclu_coloane:
addi $t0,$t0,1  # ++ii
b intrare_ciclu_linii
iesire_ciclu_linii:
li $v0,10
syscall
