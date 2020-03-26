#sortare bubble sort

.data
 v:.word 11 1 9 7 10
 n:.word 5
 k:.space 4
 i:.space 4

.text

main:
et0:
#i=0, k initial 1, presupunem ca vectorul e sortat
li $t0,1
sw $t0,k
li $t0,0
sw $t0,i

#in t0 e i
intrare: #se trece o data prin vector facandu-se swap intre elemente alaturate unde este cazul
 lw $t1,n
 addi $t1, $t1, -1   #n-1
 sll $t1,$t1,2   #4*(n-1) pentru ca mergem din 4 in 4
 bge $t0,$t1,et1   # daca i > =  4*(n-1)
 lw $t1,v($t0)   #$t1 = v[t0]
 addi $t0,$t0,4   #t0 += 4
 lw $t2,v($t0)    # $t2 = v[t0+4] (urmatorul element)
 ble $t1,$t2,et2     #daca sunt in ordine cresc, jump la et2
 sw $t1, v($t0)   #altfel, swap
 addi $t0,$t0,-4
 sw $t2, v($t0)
 li $t0,0
 sw $t0,k     # k = 0
 et2:
 lw $t0,i
 addi $t0,$t0,4
 sw $t0,i    # i += 4
 j intrare

et1:
lw $t0,k
li $t1,1    #daca la final k=1, inseamna ca s-a trecut prin vector fara niciun swap, deci toate in ordine cresc, altdel sare la et0 unde se face trecerea din nou prin vector
beq $t0,$t1, iesire
j et0

iesire:
li $v0,10
syscall
