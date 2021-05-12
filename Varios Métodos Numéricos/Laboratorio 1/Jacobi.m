function [ X ] = Jacobi( A, b, tol) 
tic
[A,P] = MED(A);   %Si A no es estrictamente dominante, hacemos que sea estrictamente dominante y entrega
                   %La de permutacion para permutar b                    
D = A;      %Dejamos los valores de A en las matrices D L U
L = A;      %esto ya que A = L + D + U
U = A; 
i = 0;      %variables para iterar
j = 0; 
[n,n] = size(A);    %Como sera matriz cuadrada 
for i = 1: n        %Para recorrer las filas
    for j = 1: n     %Para recorrer las columnas
        if i == j     %En la diagonal estas matrices tendran 0s
            U(i, j) = 0; 
            L(i, j) = 0; 
        end 
        if i > j      %Solo se dejaran los valores en la matriz tiangular inferior L
            U(i, j) = 0;    %La matriz triangular superior esta con 0s en este sector
            D(i, j) = 0;    %Al igual que U la diagonal tambien tiene 0s en este sector
        end 
        if i < j      %Solo se dejaran los valores en la matriz triangular superior U
            L(i, j) = 0;  %Analogo a lo anterior
            D(i, j) = 0; 
        end 
    end 
    L(n, n) = 0;      %Aveces el coeficiente en la fila n y columna n no es considerada
    U(n, n) = 0;      %Solo para asegurarse de que sera 0
end 

Dinv = D;   %Para formar la inversa
for i = 1: n  %Como es la diagonal necesitamos solo una variable para recorrer
    if D(i,i) ~= 0    %Se indetermina de es 0
        Dinv(i,i) = (D(i,i))^-1;    %Asi es la matriz inversa de la diagonal
    end
end
Tj = -1 * Dinv * (L + U);  %Formamos Tj correspondiente para jacobi
Segundo = Dinv * b;        %Para no esta poniendo Dinv * b a cada rato    
i = 1; 
tolerancia = 10 * tol;    %Para entrar al while
[n,m] = size(b);          %dimensiones de b
X = zeros(n,1);            %formamos X para iterar, sera X(k+1)
Xk = X;                    %Para iterar 
ERRORk = X;               %Vector Error
while tolerancia > tol
     
    X = Tj * X + Segundo;          %Iteracion de Jacobi            
    ERRORk =  (X - Xk);                %Error visto en clases            
    tolerancia = norm(ERRORk, Inf);    %Norma infinito para sacar la tolerancia
    Xk = X;                    %Ponemos el vector Xk nos servira para cuando tengamos que X = Xk+1 
  end 
t = toc
end