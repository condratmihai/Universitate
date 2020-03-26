%Mihai Condrat, Gr. 103, Laboratorul#12, IntroSoftMat.

%EX#06

%Primul set de date:
A = [3  -6   26; 4  -8  -7; 0   4   4; 0   3  -3];
b = [1 1 1 1]';

%Al doilea set de date:
%A = [1   -1; 0   1e-10; 0   0];
%b = [0 1e-10 1]';
%OBS.: Solu?ia g?sit? pentru acest sistem este x = [1 1]'

[m,n] = size(A);
[mb,nb] = size(b);

conditie = 1;

%Prima condi?ie: (i)
%A doua condi?ie: (ii)
%Condi?iile 3 ?i 4: (iii)
if (n < m) || (rank(A) ~= n) || (mb ~= m) || (nb ~= 1)
    conditie = 0;
end

if conditie == 1
    display('Solu?ia nu poate fi calculat?.');
else
  
%Gram-Schmidt Modificat
Q = zeros(m,n);
R = zeros(n,n);

for k = 1:n
    
    Q(:,k) = A(:,k);
    
    for i = 1:k-1
        R(i,k) = Q(:,i)' * Q(:,k);
        Q(:,k) = Q(:,k) - R(i,k) * Q(:,i);
    end
    
    R(k,k) = norm(Q(:,k))';
    Q(:,k) = Q(:,k)/R(k,k);
    
end

%Sistemul se reduce la R*x = Q' * b = B
B = Q' * b;

%Rezolvarea sistemului folosind metoda substitu?iei
uptriang = dsp.UpperTriangularSolver;
x = uptriang(R,B);

%Afi?area solu?iei
display('Solu?ia sistemului este: ');
x


end
