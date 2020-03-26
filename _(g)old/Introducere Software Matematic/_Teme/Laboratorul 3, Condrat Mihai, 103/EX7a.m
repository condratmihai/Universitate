%Mihai Condrat, Gr. 103, Laboratorul#03, EX#07a, IntroSoftMat.

%Obs. implementarea este pt. numere întregi pozitive sau nule

display('Numerele introduse vor fi în baza 3.');
x = input('Introduceti valoarea lui x: \n');
y = input('Introduceti valoarea lui y: \n');

%Declarare vectori nuli
cif_x = zeros(1, 16);
cif_y = zeros(1, 16);
suma = zeros(1, 16);

%Fiecare vector are 16 pozitii, deci nr. maxim care poate fi stocat este:
%sum from i = 0 to 15 of 3^i = 21523360.

%Separa cifrele lui x într-un vector
i = 16;
while (x ~= 0)
    cif_x(i) = rem(x,10);
    
    x = floor(x/10);
    
    i = i - 1;
end

%Separa cifrele lui y într-un vector
i = 16;
while (y ~= 0)
    cif_y(i) = rem(y,10);
    
    y = floor(y/10);
    
    i = i - 1;
end

%Face suma pe componente a vectorilor, asigurându-se ca de fiecare data
%când una dintre pozitii are o valoare mai mare decât 3, o înlocuieste cu
%restul împartirii la el si adauga "carry-ul" la stânga.
for i = 16:-1:2
   
    nr_act = cif_x(i) + cif_y(i) + suma(i);
    suma(i) = rem(nr_act, 3);
    suma(i-1) = floor(nr_act/3);
    
end
%Pentru pozitia cea mai din stânga, pentru a asigura ca se poate atinge
%limita superioara mentionata mai sus(i.e. valoarea 21523360).
suma(1) = suma(1) + cif_x(1) + cif_y(1);

%Nr. obtinut:

s = 0;

for i = 1:16
    
    s = s*10 + suma(i);
    
end    

display('Suma obtinuta este:'); display(s);

