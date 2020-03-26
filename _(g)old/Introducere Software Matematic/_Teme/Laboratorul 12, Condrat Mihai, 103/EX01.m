%Mihai Condrat, Gr. 103, Laboratorul#12, IntroSoftMat.

format long;

%EX#01 (d)

syms x y z;

E1 = 5*x + 6*y - 3*z - 10;
E2 = 3*x - 3*y + 2*z - 14;
E3 = 2*x - 4*y - 12*z - 24;

S = solve(E1, E2, E3, x, y, z);

disp('x = '), disp(S.x)
disp('y = '), disp(S.y)
disp('z = '), disp(S.z)

