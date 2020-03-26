%Mihai Condrat, Gr. 103, Laboratorul#11, EX#03 , IntroSoftMat.

%a)
syms x y;
S = (x+2)*(x-2)*(x-4.5)*(x+0.5);
display('Polinomul cu r?d?cinile date este:');
expand(S)

%b)
P = x.^6 - 6.5 * x.^5 - 58 * x.^4 + 167.5 * x.^3 + 728 * x.^2 - 890 * x - 1400;
display('R?d?cinile polinomului sunt:');
sol = solve(P)

%c)
S1 = sin(4*x) - 4 * sin(x) * cos(x) + 8 * (sin(x))^3 * cos(x);
if simplify(S1) == 0 display('Egalitatea este adev?rat?.');
else display('Egalitatea nu este adev?rat?.');
end

S2 = cos(x) * cos(y) - 1/2 * (cos(x-y) + cos(x+y));
if simplify(S2) == 0 display('Egalitatea este adev?rat?.');
else display('Egalitatea nu este adev?rat?.');
end