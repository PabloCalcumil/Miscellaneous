function [raiz] = PuntoFijo( X0,tolerancia,g )

%Metodo de Punto Fijo
%Se utiliza suponiendo que la funcion g tiene punto fijo unico y que cumple |g'(x)| <= k, 0 < k < 1 para x que pertenece a (a,b)

Xk = X0;    %Tomamos el valor inicial
Xk1 = g(Xk);  %aplicamos punto fijo y sacamos la nueva iteracion
while abs(Xk1 - Xk) > tolerancia    %comprobamos el error
    Xk = Xk1;         %igualamos para hacer la nueva iteracion
    Xk1 = g(Xk);      %aplicamos la iteracion
  end
raiz = Xk1;     %Raiz encontrada
end

