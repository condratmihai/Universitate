%Mihai Condrat, Gr. 103, Laboratorul#04, EX#03, IntroSoftMat.

h = zeros(1, 20);
h(1) = 0.1;

for i = 2:20
   h(i) = h(i-1) * 10^(-1); 
end

%Valoarea lui f(2)
f_2 = 2^2 + 2*2 - 3;

%Valoarea lui f'(2)
f_prim_2 = 2 * 2 + 2;

%Aproxim?rile lui f'(2) (cu diferen?e descendente)
f_prim_d = zeros(1,20);

f_prim_d = (((2-h).^2 + 2*(2-h) - 3) - f_2) ./ h;

%Erori
err_abs = abs(f_prim_2 - f_prim_d);
err_rel = err_abs ./ f_prim_2;

%Tabel
T = table(h', f_prim_d', err_abs', err_rel', ...
'VariableNames', {'h', 'f_prim_aproximat', 'err_abs', 'err_rel'});
T



