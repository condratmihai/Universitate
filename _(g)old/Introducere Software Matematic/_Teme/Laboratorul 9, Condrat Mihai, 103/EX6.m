%Mihai Condrat, Gr. 103, Laboratorul#9, EX#06 , IntroSoftMat.

N = input('Valoarea lui N:');
x1 = input('Valoarea lui x1:');
x2 = input('Valoarea lui x2');

x = zeros(N*N,1);
x(1) = 1; 
x(2) = 1;

M = zeros(N,N);

for i = 3:N*N
    x(i) = x(i-1) + x(i-2);
end

k = 1;
for i = 1:N
    for j = 1:N
        M(i,j) = x(k);
        k = k + 1;
    end
end

%Scriere
fileID = fopen('rezultat06.txt','w');
for i = 1:N
    fprintf(fileID,'%d ',M(i,:));
    fprintf(fileID,'\n');
end
fclose(fileID);

%type rezultat06.txt