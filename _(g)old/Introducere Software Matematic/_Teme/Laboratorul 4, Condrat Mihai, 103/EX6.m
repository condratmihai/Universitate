%Mihai Condrat, Gr. 103, Laboratorul#04, EX#06, IntroSoftMat.

val_x = zeros(1,8);
val_serie = zeros(1,8);
val_func = zeros(1,8);
err_abs = zeros(1,8);
err_rel = zeros(1,8);

val_x = [-1/6, -1/4, -1/3, -1/2, 1/2, 1/3, 1/4, 1/6];
val_x = pi * val_x;

for i = 1:8
   
    suma = 0;
    x = val_x(i);
    
    for k = 0:100
        suma = suma + (((-1)^k)/factorial(2*k+1)) * x^(2*k+1);
    end
    
    val_serie(i) = suma;
    val_func(i) = sin(x);
    
end

err_abs = abs(val_func - val_serie);
err_rel = err_abs ./ val_func;

T = table(val_x', val_func', val_serie', err_abs', err_rel', ...
'VariableNames', {'x', 'x_matlab', 'x_serie', 'err_abs', 'err_rel'});
T
