%Mihai Condrat, Gr. 103, Laboratorul#03, EX#02, IntroSoftMat.

% S := sum from k = 0 to \inf of 1/(3^k)
% S este o serie geometrica de ratie r = 1/3, r < 1
% Deci aceasta poate fi calculata dupa relatia S = 1/(1-r)

r = 1/3;

S = 1/(1-r);

display(S);


%Alternativ, conform definitiei formale a limitei, trebuie sa avem un rang
%de la care |s_n - c| < \eps, unde s_n este sirul sumelor partiale iar c
%este valoarea catre care sirul converge.

s_51 = 0;

c = 3/2;

for i = 0:1:50
   
    s_51 = s_51 + 1/(3^i);
    
end

dif = abs(s_51 - c);

if dif < eps display('Sirul converge la valoarea 3/2.');
else ('Sirul nu converge la valoarea 3/2.');
end
