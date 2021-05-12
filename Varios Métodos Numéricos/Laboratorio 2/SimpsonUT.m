function [Integral] = SimpsonUT(F,a,b,n)

%F es la funcion
%[a,b] es el intervalo 
%Regla de Simpson Un Tercio 
%n tiene que ser par

h = (b - a) / n;    %Para los sub-intervalos equidistantes
sumapar = 0;      %suma de los nodos con sub-indice par
sumaimpar = 0;    %suma de los nodos con sub-indice impar
for j = 1 : n - 1    
    xj = a + h * j;     %nodos desde X1 hasta Xn-1 equidistantes
    if(mod(j,2) == 0)   %para formar la sumatoria de los sub-indice par
        sumapar = sumapar + F(xj);  %sumatoria sub-indice par evaluados en f
    end
    if(mod(j,2) ~= 0)   %para formar la sumatoria de los sub-indice impar
        sumaimpar = sumaimpar + F(xj);    %sumatoria sub-indice impar evaluados en f
    end
end
Integral = (h / 3) * (F(a) + 2 * sumaimpar + 4 * sumapar + F(b)); %Calculo de la integral
    
