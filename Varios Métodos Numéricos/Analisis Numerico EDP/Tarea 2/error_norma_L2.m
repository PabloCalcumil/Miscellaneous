function [norma_L2] = error_norma_L2(U, x, nodos, h, b)
  
  %Con esta funcion se calcula la norma L2
  %a traves de una aproximacion de regla de punto medio,
  %regla de simpson y cuadratura gaussiana
  
 
  norma_L2 = 0;
  h = h(1);
  for i = 1:(nodos - 1)
    
    x_ihmedio = x(i) + (0.5 * h);

    norm_L2 = (h / 6)*( (u_e(b, x(i)) - U(i))^2 +...
               4 * ( u_e(b, x_ihmedio) - U(i)*0.5 - U(i + 1)*0.5)^2 +...
               (u_e(b, x(i + 1)) - U(i + 1)*1 )^2 );
               
    norma_L2 = norma_L2 + norm_L2;
    
  end
endfunction