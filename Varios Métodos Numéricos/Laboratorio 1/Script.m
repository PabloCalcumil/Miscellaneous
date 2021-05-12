%Problema 1
%{
A = [34 -30 0;30 -66 20;0 20 -25]; %Valores obtenidas por la Ley de mallas
b = [6;0;40];%Vector solucion
[U,L,b] = LU(A,b); %Descomposicion de las matrices
Y = Lsolve(L,b) %Solucion del sistema Ly=b
X = Usolve(U,Y) %Solucion del sistema Ux=y
%%Hasta aqui se calculan las intensidades
ia = X(1,1)  %Se presentan las intensidades 
ib = X(2,1)
ic = X(3,1)
Pa = [A(1,1);A(2,1);A(3,1)]; 
Pb = [A(1,2);A(2,2);A(3,2)]; 
Pc = [A(1,3);A(2,3);A(3,3)]; 
Pa = abs((ia^2) * Pa) %Se presentan las potencias disipadas de las resistencias por las que pasa ia
Pb = abs((ib^2) * Pb) %Se presentan las potencias disipadas de las resistencias por las que pasa ib
Pc = abs((ic^2) * Pc) %Se presentan las potencias disipadas de las resistencias por las que pasa ic
%}
%Problema 2
%{
T = [-4 1 0 1 0 0 0 0 0;1 -4 1 0 1 0 0 0 0;0 1 -4 0 0 1 0 0 0;1 0 0 -4 1 0 1 0 0;0 1 0 1 -4 1 0 1 0;0 0 1 0 1 -4 0 0 1;0 0 0 1 0 0 -4 1 0;0 0 0 0 1 0 1 -4 1;0 0 0 0 0 1 0 1 -4];
b = [-75;-75;-175;0;0;-100;-50;-50;-150];
Vectors = PUL(T,b) %Se hace por PUL ya que Cholesky da los valores negativos
%{ 
V = Jacobi(T,b,10^-6) %Por si se quiere ver los demas metodos
V = Chol(T,b) %Da los valores negativos
V = GS(T,b,10^-6)
%}

%}
%problema 3
%{
%Caso 1
A = Trid(8,4,3,10)
f = Pisano(10,5)
[n,n] = size(A);
V1 = PUL(A,f)  %soluciones de PUL y Cholesky, Cholesky no sirve Explicado en el informe
V2 = Chol(A,f)
%{
V = Jacobi(A,f,10^-6)
V = GS(A,f,10^-6)
%}
%}
%{
%Caso 2
A = Trid(10,3,3,100)
f = Pisano(100,3)
[n,n] = size(A);
V1 = PUL(A,f)  %soluciones de PUL y Cholesky
V2 = Chol(A,f)
%{
V = Jacobi(A,f,10^-6)
V = GS(A,f,10^-6)
%}
%}
%{
%Caso 3
A = Trid(10,5,6,100)
f = Pisano(100,5)
[n,n] = size(A);
V1 = PUL(A,f)  %soluciones de PUL y Cholesky, Cholesky no sirve Explicado en el informe
V2 = Chol(A,f)
%{
V = Jacobi(A,f,10^-6)      %Estos metodos mueren, cuidado
V = GS(A,f,10^-6)          %Explicado en el informe
%}
%}

