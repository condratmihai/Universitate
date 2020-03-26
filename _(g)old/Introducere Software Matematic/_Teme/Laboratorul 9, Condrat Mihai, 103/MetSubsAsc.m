%Mihai Condrat, Gr. 103, Laboratorul#9, IntroSoftMat.

function [y] = MetSubsAsc(L, b)

[m n] = size(L);

if m ~= n
    error('Matricea nu este p?tratic?.');
end

for i = 1:n
    for j = 1:n
        if j>i && L(i,j) ~= 0
            error('Matricea nu este inferior triunghiular?.');
            break;
        end
    end
end
 
if det(L) == 0 
    error('Matricea nu este inversabil?.');
end
   
y=zeros(n,1);
           
y(1) = b(1)/L(1, 1);
           
    for i = 2:n
               
        s = 0;
               
        for j = 1:i
            s = s + L(i,j) * y(j);
        end  
    
        y(i) = (b(i) - s)/L(i,i);
    end
end