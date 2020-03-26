.data		
	string: .byte 129, 3, 135, 129
	final: .space 4
	n: .byte 4
	
.text

main:
	
	lb $t6, n	   #t6 = index
	lb $t7, n	   #t7 = nr. elemente din vector
	li $t8, 1       #t8 = unitate or
	li $t9, 255   #t9 = unitate and 
	
	la $t4, string	#t4 = adresa start vector initial
	la $t5, final	#t5 = adresa start vector in care se salveaza
	sub $t6, $t6, $t8
	add $t4, $t4, $t6
	#add $t5, $t5, $t6
	lbu $t0, 0($t4)	#t0 = nr. prelucrat actual
	
	#retinere bit stanga
	srl $t1, $t0, 7 #t1 = bit stanga precedent, t2 = bit stanga actual
	
	#shift, t3 = nr. dupa shiftare
	sll $t3, $t0, 1
	#and $t3, $t3, $t9
	
	#salvare ultimul byte (temporar, va fi updatat la final)
	sb $t3, 0($t5)
	
	sub $t6, $t6, $t8 #update index
	foreach:
		
		sub $t4, $t4, $t8
		add $t5, $t5, $t8
		lbu $t0, 0($t4)		#actualizare numar
		
		srl $t2, $t0, 7		#retinere bit stanga
		
		sll $t3, $t0, 1		#shift
		
		or $t3, $t3, $t1	#modificare bit dreapta
		
		move $t1, $t2		#pastreaza bitul din stanga pentru a modifica urmatorul numar
		
		sb $t3, 0($t5)		#salvare byte prelucrat
		
		sub $t6, $t6, $t8
	bgez $t6, foreach
	
	#modifica ultimul bit din secventa (in cazul in care bitul aflat initial in extrema stanga era '1')
	lb $t6, n
	sub $t6, $t6, $t8
	sub $t5, $t5, $t6
	lbu $t0, 0($t5)
	
	or $t0, $t0, $t1
	
	sb $t0, 0($t5)
	
#end
li $v0, 10
syscall
