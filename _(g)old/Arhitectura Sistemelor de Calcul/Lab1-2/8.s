#selection sort prin selectia minimului
.data
x: .word 7
y: .word 2
z: .word 1

.text
main:
lw $t0,x
lw $t1,y
blt $t0, $t1, et  #min =x, pe prima pozitie (minimul e in t0)
#min = y si il vom duce pe prima pozitie
sw $t0,y
sw $t1,x
lw $t0,x #(minimul e acum pe prima pozitie si depus tot in t0)

et:  #deci pana acum min=t0, pe prima pozitie (adica in x) => il comparam cu urmatorul element, adica z
lw $t1,z
blt $t0, $t1, et2 #minimul este tot pe prima pozitie(in t0, iar in t1 este celalalt necesar comparatiei, cel de pe pozitia 3), il lasam acolo si cum avem pe prima pozitie minimul celor 3 elem, trecem la calcularea min pentru ultimele 2
#minimul e pe a treia pozitie, adica in z si vom face swap-ul pentru a il duce pe a prima pozitie
sw $t0,z
sw $t1,x
lw $t1,z #(vrem ca elem de comparat de pe ultima pozitie sa fie tot in t1)



et2: # cautarea minimului pe ultimele 2 pozitii
lw $t0,y
blt $t0, $t1, sfarsit # minimul dintre y si z e y, ramane pe pozitia lui si am ajuns la sfarsit
#minimul dintre y si z e z => el trebuie sa fie pe a doua pozitie
sw $t0,z
sw $t1,y

sfarsit:
li $v0, 10
syscall
