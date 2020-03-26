%Mihai Condrat, Gr. 103, Laboratorul#9, IntroSoftMat.

function [x] = MetSubsDesc(U, y)

[m n] = size(U);

if m ~= n
    error('Matricea nu este p?tratic?.');
end


for i = 1:n
    for j = 1:n
         if j<i && abs(U(i,j))>0
                error('Matricea nu este superior triunghiular?.');
            break;
        end
    end
end

if det(U) == 0 
    error('Matricea nu este inversabil?.');
end

x = zeros(n,1);

x(n) = y(n)/U(n, n);

    for i = n-1:-1:1
        
        s = 0;
        
        for j = i+1:n
            s = s + U(i,j) * x(j);
        end
        
        x(i) = (y(i) - s)/U(i,i);
     end
end