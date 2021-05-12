function [ Y ] = Lsolve(L, b)

[m, n] = size(L) ;     %verificacion de que es matriz cuadrada
Ampliada=[L b];                      %Ampliamos la matriz con las soluciones
Y = zeros(n, 1 ) ;          %generamos un vector de zeros
yn = Ampliada (1, n + 1) / Ampliada (1, 1 ); %Calculamos el valor de x1
Y(1) = yn ;
for j = 2:n           %ciclo iterativo que parte desde el penultimo hasta el primero.
    Y(j)= (Ampliada(j, n + 1) - (Ampliada(j, 1 : j - 1) * Y(1: j - 1))) / (Ampliada(j, j)); 
          % b menos la sumatoria de soluciones anteriores
  end
end