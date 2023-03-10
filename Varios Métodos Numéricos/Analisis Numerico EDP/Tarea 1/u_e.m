function ui = u_e(b_value, x)

%Esta funcion entrega el valor exacto de la funcion u 
  %evaluado en el punto xi
  
  %Primero agregamos los valores y constantes obtenidas
  %al resolver la EDO de forma analitica
  
  exp_1 = (b_value + sqrt(b_value^2 + 4))/2;
  exp_2 = (b_value - sqrt(b_value^2 + 4))/2;
  A = (2/(exp(exp_1) - exp(exp_2))) * (b_value - b_value * exp(exp_2) - 1);
  B = (2/(exp(exp_1) - exp(exp_2))) * (b_value * exp(exp_1) - b_value + 1);
  
  %Le entregamos los valores exactos de la funcion
  
  
  ui = A * exp(exp_1 * x) + B * exp(exp_2 * x) + 2 * x - 2 * b_value;