function [Integral] = SimpsonTO(F,a,b,n)

%F funcion
%[a,b] intervalo
%Regla de Simpson Tres Octavos
%n tiene que ser multiplo de 3

h = (b - a) / n;    %Para los sub-intervalos equidistantes
untsuma = 0;        %suma de los sub-indices 1,4,7,10,...
dostsuma = 0;       %suma de los sub-indices 2,5,8,11,...
trestsuma = 0;      %suma de los sub-indices 3,6,9,12,...
for j = 1 : n - 1
    xj = a + h * j;     %%nodos desde X1 hasta Xn-1 equidistantes
    if(mod(j,3) == 0)     %para formar la sumatoria de los sub-indices 3,6,9,12,...
        trestsuma = trestsuma + F(xj);    %sumatoria sub-indice 3,6,9,12,... evaluados en f
    end
    if(mod(j,3) == 1)             %para formar la sumatoria de los sub-indices 1,4,7,10,...
        untsuma = untsuma + F(xj);  %sumatoria sub-indice 1,4,7,10,... evaluados en f
    end
    if(mod(j,3) == 2)             %para formar la sumatoria de los sub-indices 2,5,8,11,...
        dostsuma = dostsuma + F(xj);   %sumatoria sub-indice 2,5,8,11,... evaluados en f
    end
end
Integral = (3 * h / 8) * (F(a) + 3 * untsuma + 3 * dostsuma + 2 * trestsuma + F(b)); %Calculo integral
