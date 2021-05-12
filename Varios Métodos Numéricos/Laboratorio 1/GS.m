function [ X, t ] = GS( A, b, tol )
tic
[A,P] = MED(A);   %Si A no es estrictamente dominante, hacemos que sea estrictamente dominante y entrega
                   %La de permutacion para permutar b
i = 0;    %Definimos variables para iterar
j = 0; 
suma1 = 0;  %Definimos las sumatorias
suma2 = 0;
[n,m] = size(A);  %Le sacamos las dimensiones a la matriz A (solo sirven las filas)
X = zeros(n,1);   %Formamos X que sera X(k+1)
Xk = X;           %Formamos X(k)
Error = X;        %Formamos el vector Error 
tolerancia = 2 * tol;   %tomamos este valor para entrar al while y comenzar a iterar
while tolerancia > tol
    for i = 1:n     %filas de la matriz
        suma1 = 0;  %definimos las sumatorias que deben comenzar de 0 cada vez que ya
        suma2 = 0;  %tenemos los valores de un coeficiente para el vector X
        for j = 1:i - 1   %sacamos los valores de la matriz A en la parte triangular inferior 
            suma1 = suma1 + A(i,j)*X(j,1);  % sumatoria para X
          end
        for j = i + 1:n   %sacamos los valores de la matriz A en la parte triangular superior
            suma2 = suma2 + A(i,j)*Xk(j,1); %sumatoria para X
          end
        X(i,1) = (1 / A(i,i)) * (-1 * (suma1 + suma2) + b(i,1));  %valores de cada componente de X      
      end
      Error = (X - Xk); %Sacamos el vector Error en X(k+1) - X(k)
      tolerancia = norm(Error,Inf);  %Sacamos su mayor valor de la norma infinito
      Xk = X; %Guardamos el valor de X(k+1) en X(k) para volver a iterar 
    end
t = toc    
end

