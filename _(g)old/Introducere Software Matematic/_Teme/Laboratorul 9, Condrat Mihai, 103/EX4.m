%Mihai Condrat, Gr. 103, Laboratorul#9, EX#04 , IntroSoftMat.

%Subpunctul e)
x = linspace(-3,3);
y = linspace(-3,3);

[X,Y] = meshgrid(x,y);

Z = X.^2/3 + 2*sin(3*Y);

Z(x.^2 + y.^2 >= 1) = NaN;

surf(X,Y,Z); %grafic in spatiu
view(0,0); %proiectie Ozx
view(90,0); %proiectie Oyz
view(0,90); %proiectie Oxy

%Subpunctul f)
x = linspace(-5,5);
y = linspace(-5,5);

[X,Y] = meshgrid(x,y);

Z = X.^2/3 + 2*sin(3*Y);

Z(x.^2 + y.^2 < 1) = NaN;
Z(x.^2 + y.^2 > 9) = NaN;

surf(X,Y,Z); %grafic in spatiu
view(0,0); %proiectie Ozx
view(90,0); %proiectie Oyz
view(0,90); %proiectie Oxy

%Subpunctul g)
x = linspace(-10,10);
y = linspace(-10,10);

[X,Y] = meshgrid(x,y);

R = sqrt(X.^2 + Y.^2);

Z = sin(R)./R;

surf(X,Y,Z); %grafic in spatiu
view(0,0); %proiectie Ozx
view(90,0); %proiectie Oyz
view(0,90); %proiectie Oxy
surf(X,Y,Z); %grafic in spatiu