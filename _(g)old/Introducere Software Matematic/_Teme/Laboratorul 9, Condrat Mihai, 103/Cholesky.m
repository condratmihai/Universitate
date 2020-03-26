%Mihai Condrat, Gr. 103, Laboratorul#9, IntroSoftMat.

function [L] = Cholesky(A)

[m n] = size(A);
if m ~= n
    error('Matricea nu este patratic?.');
end

for k = 1:n
    if (k < n) && (det(A(1:k,1:k)) < 0)
        error('Matricea nu este pozitiv definit?.');
    else
        if det(A) == 0
            error('Matricea nu este inversabil?.');
        end
    end
end

for i = 1:n
    for j = 1:n
        if A(i,j) ~= A(j,i)
            error('Matricea nu este simetric?.');
        end
    end
end

L=zeros(n);

for i=1:n
    L(i,i) = sqrt(A(i,i));
    L(i+1:n,i) = A(i+1:n,i)/L(i,i);
    A(i+1:n,i+1:n) = A(i+1:n,i+1:n) - (A(i+1:n,i) * A(i,i+1:n))/A(i,i);
end

end