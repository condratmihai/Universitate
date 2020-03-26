%Mihai Condrat, Gr. 103, Laboratorul#08, EX#05 , IntroSoftMat.
function [Vol] = VolRezervor(h)
h = 15;
% y^2 = 15^2 - x^2, functia integrat? pentru ob?inerea volumului partial
y_sq = @(x) 15^2 - x.^2;
y_sqrt = @(x) sqrt(15^2 - x.^2);

%baliz? în prima jum?tate a sferei
if h <= 15
    integr = pi*integral(y_sq, -15, h - 15);
    V = integr;
end

%baliz? în cilindru
if (h > 15 && h <=55)
   V = 2/3 * pi * 15^3;
   V = V + pi * 15^2 * (h - 15);
end

%baliz? în a doua jum?tate a sferei
if h > 55
     V = 2/3 * pi * 15^3;
     V = V + pi * 15^2 * 40;
     integr = pi*integral(y_sq, 0, h-55);
     V = V + integr;
end


Vol = V;

fplot(@(x) VolRezervor(x), [0, 70], 'b');

end

