%Mihai Condrat, Gr. 103, Laboratorul#06, EX#04, IntroSoftMat.


x1 = -5:0.1:-2.1;
y1 = zeros(length(x1));

x2 = -2:0.1:-0.1;
y2 = x2 .^ 2;

x3 = 0:0.1:2.9;
y3 = x3 .^3;

x4 = 3:0.1:3.9;
y4 = x4 .^ 2 + 18;

x5 = 4:0.1:5;
y5 = zeros(length(x5));

x = [x1 x2 x3 x4 x5];
y = [y1 y2 y3 y4 y5];

plot(x,y);

