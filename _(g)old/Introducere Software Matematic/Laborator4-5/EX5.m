x = zeros (1,6);
rang = zeros (1,6);
serie = zeros (1,6);
err_abs = zeros (1,6);
err_rel = zeros (1,6);

x = [-20, -10, -1, 1, 10, 20];

for i = 1:6
   
    suma = 0;
    k = 0;
    
    while abs(x(i)^k/factorial(k)) > eps
        
        suma = suma + x(i)^k/factorial(k);
        k = k+1;
        
    end
    
    serie(i) = suma;
    rang(i) = k;
    
end

err_abs = abs(exp(x) - serie);

err_rel = err_abs ./ exp(x);



T = table(x', rang', serie', err_abs', err_rel', 'VariableNames', {'x', 'rang', 'serie', 'err_abs', 'err_rel'});

T
