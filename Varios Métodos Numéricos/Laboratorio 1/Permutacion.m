function [ A ,I ] = Permutacion( A)
  
[n,m] = size(A);  %tomamos las medidas de A
I = eye(n);       %Formamos la identidad para la matriz de permutacion
Ampliada = [A I]; %formamos la ampliada para cuando hacer los cambios de fila, cambie la identidad igual
for i = 1:n  
    [mayor ,fila]= max(abs(Ampliada(i:n,i)));  %Pivoteo Parcial
    filacam = fila + i - 1;       
    if filacam ~= i          %comprueba que no sea la misma fila a cambiar, si es asi no es necesario
        Ampliada ([i, filacam] ,:) = Ampliada ([filacam, i] ,:);     %toma las 2 filas y aplica la permutacion
      end
  end
for i = 1:n
    for j = 1:n
        A(i,j) = Ampliada(i,j);   %Ahora separamos la ampliada en 2 matrices como en el principio
        I(i,j) = Ampliada(i,j + n);
      end
  end    
end