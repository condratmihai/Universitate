%Mihai Condrat, Gr. 103, Laboratorul#10, EX#04 , IntroSoftMat.

function BilaUnitateR3(p)

%x1 = linspace(-1,1);
%x2 = linspace(-1,1);
%x3 = linspace(-1,1);
%[X,Y,Z] = meshgrid(x1,x2,x3);

for i = -1:0.1:1
for j = -1:0.1:1
for k = -1:0.1:1
    
    x = zeros(3,1);
    x(1) = i;
    x(2) = j;
    x(3) = k;
    
%Calcularea normei
p = 3; %norm? pt. testare
n = 3; %Num?rul de dimensiuni
index = 1;
if p == inf
    
    max = x(1);
    for i = 2:n
       if x(i) > max
           max = x(i);
       end
    end
    normaP = max;
    
else
    
    suma = 0;
    for i = 1:n
       suma = suma + (abs(x(i)) .^ p); 
    end
    normaP = nthroot(suma, p);
   
end

%Verificare conditie
if normaP == 1
    V(index,1) = i;
    V(index,2) = j;
    V(index,3) = k;
else
    V(index,1) = NaN;
    V(index,2) = NaN;
    V(index,3) = NaN;
end


end
end
end

%Implementare???
%Parcugere V, element cu element (dup? index)
%Dac? V(index,1) este NaN, trece la urm?torul element
%Dac? nu este NaN, afi?eaz? în spa?iu punctul de coordonate:
% (V(index,1),V(index,2),V(index,3))

end

