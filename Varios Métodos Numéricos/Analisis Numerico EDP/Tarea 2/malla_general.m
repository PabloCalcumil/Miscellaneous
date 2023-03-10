function [aleatorios] = malla_general(N)
  %Esta función entregara una cantidad N de numeros aleatorios
  %dentro del intervalo que se pida
  
  aleatorios = rand(N, 1);
  aleatorios = sort(aleatorios);
  
endfunction
