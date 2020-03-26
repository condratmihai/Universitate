%Mihai Condrat, Gr. 103, Laboratorul#13, IntroSoftMat.

%Subpunctul (c)
format long;

x = [-5.0, -3.4, -2.0, -0.8, 0.0, 1.2, 2.5, 4.0, 5.0, 7.0, 8.5];
y = [4.4, 4.5, 4.0, 3.6, 3.9, 3.8, 3.5, 2.5, 1.2, 0.5, -0.2];

%Vectorii cu coeficien?ii polinomului
x2 = x.^2;
x1 = x;
x0 = ones(1,11);

b = y';

%Matricea sistemului
A = horzcat(x2', x1', x0');

%GS - PCMMP
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
 
%Înmul?ire cu transpusa, pentru a g?si solu?ia cmmp   
b = A' * b;
A = A' * A;
  
%Gram-Schmidt Modificat
[m,n] = size(A);
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
S = uptriang(R,B);

end


%Subpunctul (d)
figure
scatter(x,y);
hold on;
fplot(@(t) S(1,1)*t^2 + S(2,1)*t + S(3,1))

title('\fontname{Arial} Laboratorul 13', 'FontSize', 14, 'FontWeight', 'bold')
xlabel('\fontname{Times New Roman} x', 'FontSize', 12, 'FontAngle', 'italic')
ylabel('\fontname{Times New Roman} y', 'FontSize', 12, 'FontAngle', 'italic')

print('functieImplicita.eps', '-depsc')

