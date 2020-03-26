%Mihai Condrat, Gr. 103, Laboratorul#02 , IntroSoftMat.

%Problema 2 - Aproximare Stirling

val_calc = [20, 30, 40, 50];
val_fact = zeros(1,4);
err_rel = zeros(1,4);
err_abs = zeros(1,4);

e = exp(1);

val_fact = factorial(val_calc);

val_calc = sqrt((2 * pi) .* val_calc) .* ((val_calc ./ e) .^ val_calc);

err_abs = abs(val_fact - val_calc);
err_abs

err_rel = abs(err_abs ./ val_calc);
err_rel



%Problema 4 - Alg. Euclid

while b>0
    r = mod(a,b);
    a = b;
    b = r;
end

display(a);