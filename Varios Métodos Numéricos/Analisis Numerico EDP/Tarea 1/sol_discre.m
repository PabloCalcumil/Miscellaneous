function [U] = sol_discre(b_value, h_value, nodos, x_values)
  
  %Esta función entrega el valor de la aproximacion de u
  %en el nodo i
  
  %Formamos el vector de la funcion
  
  F = zeros(nodos, 1);
  for i=1:nodos
    F(i) = f(x_values(i + 1));
  end
    
  % Formamos la matriz tridiagonal

  m_arr = -1/(h_value^2);     
  m_dia = 2/(h_value^2) - b_value/h_value + 1;    %Valores en las diagonales
  m_aba = -1/(h_value^2) + b_value/h_value;       
  
  M = zeros(nodos, nodos);
  on_diagonal = m_aba * ones(nodos - 1, 1);
  main_diagonal = m_dia * ones(nodos, 1);
  off_diagonal = m_arr * ones(nodos - 1, 1);

  M = diag(on_diagonal, 1) + diag(main_diagonal) + diag(off_diagonal, -1);
  
  %Resolvemos el sistema formado MU=F

  U = zeros(nodos, 1); 
  U = M\F;
  U = [0;
       U;      %Le agregamos los valores de frontera
       0];
  
endfunction




















