function [U] = sol_discre(b_value, h_value, nodos, x_values)
  
  %Esta función entrega el valor de la aproximacion de u
  %en el nodo i
  
  %Formamos el vector de la funcion
  
  F = zeros(nodos, 1);
  for i=1:(nodos)
    F(i) = f(x_values(i));
  end
    
  % Formamos la matriz tridiagonal
  M = zeros(nodos, nodos);
  
  for k = 1: (nodos)
    
    M(k,k) = 2/(h_value(k)^2) - b_value/h_value(k) + 1;    %Valores en las diagonales
    
    if k < (nodos)
      M(k,k + 1) = -1/(h_value(k)^2);
      M(k + 1, k) = -1/(h_value(k)^2) + b_value/h_value(k);       
    end
   end
  
  %Resolvemos el sistema formado MU=F

  U = zeros(nodos, 1); 
  U = M\F;
  U = [0;
       U;      %Le agregamos los valores de frontera
       0];
  
endfunction




















