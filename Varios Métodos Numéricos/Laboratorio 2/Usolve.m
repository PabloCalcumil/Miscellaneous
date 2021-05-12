function [ X ] = Usolve(U, Y)

[m, n] = size(U) ;     %verificacion de que es matriz cuadrada
Ualverres = zeros(m,n);  %para formar triangular inferior
Yalrreves = Y;            %formar Y al reves 
for i = n:-1:1
    for j = n:-1:1          %formamos la triangular superior en un inferior para que sea mas facil
        Ualverres(n + 1 - i, n + 1 - j) = U(i,j); 
        Yalrreves(n + 1 - i) = Y(i);
      end
  end
Y = Yalrreves;     %solo para no escribir a cada rato Yalrreves y Ualverres
U = Ualverres;
Ampliada = [U Y];                      %Ampliamos la matriz con las soluciones
X = zeros(n, 1 ) ;          %generamos un vector de zeros
xn = Ampliada (1, n + 1) / Ampliada (1, 1 ); %Calculamos el valor de x1
X(1) = xn ;
for j = 2:n           %ciclo iterativo que parte desde el penultimo hasta el primero.
    X(j)= (Ampliada(j, n + 1) - (Ampliada(j, 1 : j - 1) * X(1: j - 1))) / (Ampliada(j, j)); 
          % b menos la sumatoria de soluciones anteriores
  end
end
  
  

  
  
  