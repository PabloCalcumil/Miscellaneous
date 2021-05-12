function [ raiz ] = NewtonRaphson( f,df,X0,tolerancia )

%Metodo de Newton Raphson
%Notar que se escoge un valor X0 cerca de la raiz, sino puede fallar el metodo
%Por otro lado pense en hacer que estuviera en un intervalo [a,b] y que X0 = (a + b) / 2, pero no fue muy exacto, por lo mismo de arriba

factor = 1;       %division entre f/df
Xk1 = X0;           %Tomamos el primer valor
Xk = abs(Xk1) + 1;    %Arbitrario para entrar al while
while (abs(Xk1 - Xk) > tolerancia)     %Calculamos el error y vemos si es menor a la tolerancia
    Xk = Xk1;         %para la siguiente iteracion
    factor = -1 * f(Xk) / df(Xk);   %division para la nueva iteracion
    Xk1 = Xk + factor;      %Nueva iteracion
  end
raiz = Xk1;       %tomamos el valor de la raiz
end
