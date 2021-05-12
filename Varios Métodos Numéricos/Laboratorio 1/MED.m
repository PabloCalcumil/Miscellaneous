function [A, I] = MED(A)


[n,m] = size(A);  %tomamos las medidas de A
I = eye(n);       %Formamos la identidad para la matriz de permutacion
Ampliada = [A I]; %formamos la ampliada para cuando hacer los cambios de fila, cambie la identidad igual
for k = 1:n 
  % Pivoteo parcial
    [mayor, i]= max(abs(Ampliada(k,k:n) ) );  %Busca el mayor valor en la fila k
    columnacam =i + k - 1;        %valor para ver la posicion dle pivote respecto a la posicion k
    if 2 * mayor > sum(abs(A(k,:)))  %Restriccion para que se Est. Dominante por FILAS
        if columnacam ~=k          %comprobar si se debe realizar la permutacion o no
            Ampliada(:, [k,columnacam ]) = Ampliada(:, [ columnacam ,k]);     %toma las 2 columnas y aplica la permutacion
            Ampliada(:, [k + n, columnacam + n]) = Ampliada(:, [ columnacam + n,k + n]);
          end
      end
  end
for i = 1:n
    for j = 1:n
        A(i,j) = Ampliada(i,j);   %Ahora separamos la ampliada en 2 matrices como en el principio
        I(i,j) = Ampliada(i,j + n);
      end
  end    
 
end