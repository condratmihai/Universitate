.data
n: .word 0
s: .word 0

string1: .asciiz "Dati numarul pentru care vreti sa aflati suma divizorilor: "
string2: .asciiz "Suma divizorilor numarului este: "

.text
main:

li $v0, 4 
la $a0, string1 
syscall 

li $v0, 5 
syscall 
sw $v0, n 

lw $t0, n #t0 - n
lw $t1, n #t1 - suma

add $t1, $t1, 1
div $t2, $t1, 2 #t2 - limita
li $t3, 1 #t3 - index


loop:
add $t3, $t3, 1
rem $t4, $t0, $t3 # t4 - n/index rest
beqz $t4, adauga
end_adauga:
sub $t5, $t2, $t3 #t5 - limita-index
bgtz $t5, loop
blez $t5, end


adauga:
add $t1, $t1, $t3
b end_adauga


end:
li $v0, 4
la $a0, string2
syscall 

li $v0, 1
move $a0, $t1
syscall

li $v0, 10
syscall



