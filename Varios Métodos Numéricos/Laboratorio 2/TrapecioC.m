function [Integral] = TrapecioC(F,a,b,n)

%Regla de Trapecio Compuesto
  
h = (b - a) / n;    %division de los subintervalos equidistantes
suma = 0;           %Para la suma de los nodos X1,X2,...,Xn-1
for i = 1 : n - 1     %Para la suma de los nodos X1,X2,...,Xn-1
    xi = a + h * i;     %formamos los nodos X1,X2,...,Xn-1
    suma = suma + F(xi);  %sumatoria de los nodos X1,X2,...,Xn-1 evaluados en f
end
Integral = (h / 2) * (F(a) + F(b) + 2 * suma);  %calculo de la integral