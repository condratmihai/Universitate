%Mihai Condrat, Gr. 103, Laboratorul#06, EX#01, IntroSoftMat.

x = -2*pi:0.1:2*pi;
cos_x = cos(x);

%Polinoamele Taylor de grad maxim 3.
T0_x = x .^ 0;
T1_x = T0_x + ((-1)^1)*(x.^(2*1))/factorial(2*1);
T2_x = T1_x + ((-1)^2)*(x.^(2*2))/factorial(2*2);
T3_x = T2_x + ((-1)^3)*(x.^(2*3))/factorial(2*3);

%Metoda_1
plot(x, cos_x, ...
     x, T1_x, ...
     x, T2_x, ...
     x, T3_x);
     
 %Metoda_2
 plot(x, cos_x);
 hold on
 plot(x, T1_x);
 plot(x, T2_x);
 plot(x, T3_x);
 hold off
 
 %Metoda_3
 plot(x, cos_x);
 line(x, T1_x);
 line(x, T2_x);
 line(x, T3_x);
 
    