function [ Matriz,t ] = Trid( a, b, c, n )

tic
Matriz = zeros(n, n);   %formamos la matriz llena de ceros
for i = 1:n-1     %para no agrandar las dimensiones de la matriz
    Matriz(i, i) = a;       %en la diagonal los valores a
    Matriz(i + 1, i) = c;   %por debajo de la diagonal los valores c
    Matriz(i, i + 1) = b;   %por encima de la diagonal los valores b
  end
Matriz(n, n) = a;       %para completa la diagonal
t = toc
end
