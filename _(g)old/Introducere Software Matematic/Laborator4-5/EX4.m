% x^2 + p*x + q = 0

p = input('p = ');
q = input('q = ');

delta = p^2 - 4*q

if delta < 0
    display("hau bau, n-am radacini reale");
else if delta >=0
        x1 = (-p + sqrt(delta))/2;
        x2 = (-p - sqrt(delta))/2;
        
        if x1 == x2
           display("Are o singura radacina reala.");
           fprintf('x = %d', x1);
        else 
            display("Are doua radacini reale.");
            fprintf('x1 = %d\n', x1);
            fprintf('x2 = %d', x2);
        end
    end
end
            
    