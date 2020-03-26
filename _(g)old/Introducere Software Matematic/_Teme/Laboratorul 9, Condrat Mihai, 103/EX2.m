%Mihai Condrat, Gr. 103, Laboratorul#9, EX#02 , IntroSoftMat.

%Solu?ia ecua?iei Ax = b, pentru Cazul 1: A admite factorizarea Cholesky 
A = [25 15 -5; 15 18 0; -5 0 11];
b = [35; 33; 6];

L = Cholesky(A);
y = MetSubsAsc(L, b);
x = MetSubsDesc(L', y);

%Solu?ia sistemului:
x
