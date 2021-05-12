function [ Vector ] = NRSNL(F, J, X0, tolerancia )

%Metodo de Newton Raphson para Sistemas No Lineales
%Para no utilizar la inversa del jacobiano se resuelve el sistema J * DX = -F

Xk = X0;    %Tomamos el valor semilla
Xk1 = 10 * X0;    %Para que ingrese al while, Notar que si X0 = 0v no entrara al while
Xk2 = X0;         %Para no tener problemas ni enredos al inicio del while
while (norm(Xk1 - Xk,inf) > tolerancia)   %La norma debe ser menor a la tolerancia
    Xk = Xk2;         %Aca se toma el valor Xk2 ya que es el que va a cambiar
    A = J(Xk(1),Xk(2));     %La matriz Jacobiana evaluada en el valor
    b = -1 * F(Xk(1),Xk(2));    %La funcion vectorial evaluada en el valor
    DX = PUL(A,b);        %Resolvemos el sistema J * DX = -F
    Xk2 = DX + Xk;          %Tenemos que Xk+1 = DX + Xk
    Xk1 = Xk2;              %Le entregamos el valor a Xk1
  end       
Vector = Xk1;       %Se entrega la solucion al sistema
end