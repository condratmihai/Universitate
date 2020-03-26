%Mihai Condrat, Gr. 103, Laboratorul#08, IntroSoftMat.

function [L,U] = LUfp(A)

[m n] = size(A);

%Verificare: matrice p?tratic??
if m ~= n
    error('Matricea nu este p?tratic?.');
end

%Verificare: determinant/minori nenuli?
n = n(1);
for k = 1:n
    if det(A(1:k,1:k)) == 0
        error('Matricea nu este inversabil? sau are minori nuli.');
    end
end

%Factorizarea propriu-zis?
n = size(A, 1);
L = eye(n);

for k = 1 : n
   
    L(k + 1 : n, k) = A(k + 1 : n, k) / A(k, k);

    for l = k + 1 : n
        A(l, :) = A(l, :) - L(l, k) * A(k, :);
    end
    
end

U = A;

end