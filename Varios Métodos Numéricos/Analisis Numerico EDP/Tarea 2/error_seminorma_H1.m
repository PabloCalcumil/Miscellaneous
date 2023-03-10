function [seminorma_H1] = error_seminorma_H1(U, x, nodos, h, b)
  
  %Con esta funcion se calcula la seminorma H1
  %a traves de una aproximacion de regla de punto medio,
  %regla de simpson y cuadratura gaussiana
 
  seminorma_H1 = 0;
  h = h(1);
  
  for i = 1:(nodos - 1)
    
    %Se utiliza diferencias centradas para la aproximacion de la derivada
    Uprima_i = (U(i + 1) - U(i)) / h;
    
    x_ihmedio = x(i) + (0.5 * h);
    
    seminorm_H1= (h/6)*((du_e(b, x(i)) - Uprima_i)^2 +...
                               4*(du_e(b, x_ihmedio) - Uprima_i)^2 +...
                              (du_e(b, x(i + 1)) - Uprima_i)^2);
    
    seminorma_H1 = seminorma_H1 + seminorm_H1;
    
  end
  
endfunction
