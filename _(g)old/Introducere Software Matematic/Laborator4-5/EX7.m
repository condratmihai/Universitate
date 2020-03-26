x = linspace(10^14, 10^16, 101); %101 elemente egal departate din [10^14, 10^16]

y1 = sqrt(2*(x.*x) + 1) - 1;
y2 = (2*(x.*x))/(sqrt(2*(x.*x) + 1) + 1);

plot(y1);
plot(y2)