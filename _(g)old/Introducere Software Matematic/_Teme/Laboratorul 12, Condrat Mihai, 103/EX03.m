%Mihai Condrat, Gr. 103, Laboratorul#12, IntroSoftMat.

format long;

%EX#03 (c)

syms rho(u);
rho(u) = (20 * 10) * exp(1)^(-0.04 * u) / (sqrt((10 * cos(u))^2 + (20 * sin(u))^2));

syms x(u);
x(u) = rho(u) * cos(u);

syms y(u);
y(u) = rho(u) * sin(u);

syms z(u);
z(u) = (18 * u)/(2 * 5 * pi);

figure
fplot3(x(u), y(u), z(u), [0, 2*5*pi])

title('\fontname{Arial} Laboratorul 12, EX03, C', 'FontSize', 14, 'FontWeight', 'bold')
xlabel('\fontname{Times New Roman} x', 'FontSize', 12, 'FontAngle', 'italic')
ylabel('\fontname{Times New Roman} y', 'FontSize', 12, 'FontAngle', 'italic')
zlabel('\fontname{Times New Roman} z', 'FontSize', 12, 'FontAngle', 'italic')

%legend('aia verde ie cum fuge un cîine anpotriva vîntului', 'North')

print('functieImplicita.eps', '-depsc')
