function [ Vector ] = Fib( tope )
 
Vector = zeros(tope ,1); %formamos el vector de tope x 1 lleno de 0s
Vector(1) = 1;      %suponiendo que tope no sera <= 0 ponemos 1 en la primer componente
if tope >= 2        %Si el vector consiste solo de un numero tope = 1 sera soo un numero
    Vector(2) = 1;    %Ponemos en el segundo componente un 1 
    for i = 3:tope      %si tope = 2 no entrara al for
        Vector(i) = Vector (i-2) + Vector(i-1);   %Como ya empezamos en la componente 3 podemos tomar
                                                  %los dos valores anteriores
      end
  end 
end