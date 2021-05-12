function [raiz]=Biseccion(f,a,b,tolerancia)

%Metodo de Biseccion
%Se utiliza el metodo suponiendo que existe una raiz y que es continua, y un intervalo [a,b]
  
c = (a + b) / 2;    %Como dice el metodo de biseccion tomamos el valor en la mitad del intervalo
iteracion = 0;           %servira para el error
while (abs((b - a) / (2 ^ iteracion)) > tolerancia && f(c) ~= 0)  %tenemos que el error esta acotado por (bn - an) / 2^n
    if(f(b) > 0 && f(a) < 0)    %Para asegurar que hay una raiz
        if(f(c) < 0)     %si f(c) es negativa 
            a = c;        %la raiz esta en el intervalo [c,b]
        end
        if (f(c) > 0)   %si f(c) es positiva
            b = c;          %la raiz esta en el intervalo [a,c]
        end
        c = (a + b) / 2;    %definimos c nuevamente en el nuevo intervalo
        iteracion = iteracion + 1;     %la nueva iteracion para el error
    end        %si f(c) = 0 encontramos la raiz y saldra de todo
    if(f(b) < 0 && f(a) > 0)    %Para asegurar que hay una raiz
        if(f(c) > 0)        %si f(c) es positiva
            a = c;          %la raiz esta en el intervalo [c,b]
        end
        if (f(c) < 0)   %si f(c) es negativa 
            b = c;          %la raiz esta en el intervalo [a,c]
        end
        c = (a + b) / 2;      %definimos c nuevamente en el nuevo intervalo
        iteracion = iteracion + 1;      %la nueva iteracion para el error
    end                 %si f(c) = 0 encontramos la raiz y saldra de todo
  end
raiz = c;       %Entregamos la aproximacion de la raiz
end


