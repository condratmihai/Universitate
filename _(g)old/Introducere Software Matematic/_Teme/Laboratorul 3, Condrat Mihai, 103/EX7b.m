%Mihai Condrat, Gr. 103, Laboratorul#03, EX#07b, IntroSoftMat.

X = input('Introduce?i valoarea lui X: \n');
Y = input('Introduce?i valoarea lui Y: \n');

%Declarare vectori nuli
cif_X = zeros(1, 16);
cif_Y = zeros(1, 16);
suma = zeros(1, 16);

%(i) Conversia nr. (Convertite direct în cadrul vectorului)

%Separa cifrele lui X într-un vector (în baza 3)
i = 16;
while (X ~= 0)
    cif_X(i) = rem(X,3);
    
    X = floor(X/3);
    
    i = i - 1;
    
end

%Separa cifrele lui Y într-un vector (în baza 3)
i = 16;
while (Y ~= 0)
    cif_Y(i) = rem(Y,3);
    
    Y = floor(Y/3);
    
    i = i - 1;
    
end

%(ii) Adunarea nr.-lor, conform EX7a
for i = 16:-1:2
   
    nr_act = cif_X(i) + cif_Y(i) + suma(i);
    suma(i) = rem(nr_act, 3);
    suma(i-1) = floor(nr_act/3);
    
end
suma(1) = suma(1) + cif_X(1) + cif_Y(1);

%(iii) Conversia sumei în baza 10

s = 0;

for i = 16:-1:1
    
    k = 16 - i;
    s = s + suma(i)*3^(k);
    
end    

display('Suma obtinuta este:'); display(s);