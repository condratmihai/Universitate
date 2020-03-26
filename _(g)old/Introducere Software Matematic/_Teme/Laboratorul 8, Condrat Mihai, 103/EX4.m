%Mihai Condrat, Gr. 103, Laboratorul#08, EX#04, IntroSoftMat.

%Solu?ia ecua?iei Ax = b, pentru cazul 1 (sistem compatibil det. ?i A
%admite factorizare f?r? pivotare
A = [1 2 3; 2 6 6; 1 6 10];
b = [6; 14; 17];

[L, U] = LUfp(A);
y = MetSubsAsc(L, b);
x = MetSubsDesc(U, y);

%Solu?ia sistemului:
x
