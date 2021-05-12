function [X] = PUL(A, b)
 
[n,m] = size(A);    %Le sacamos el numero de filas y columnas a la matriz dada
L = zeros(n,m);     %Formamos Las matices L y U solo de ceros
U = zeros(n,m);
X = zeros(n,1);     %Vectores llenos de 0s que seran para Ux = y, y para Ly = b
Y = X;
Xf = X;           %Al final da los valores al reves y con este lo enderezamos
k = 0;
[A, P] = Permutacion(A);     %Formamos la matriz A permutada y entregamos P para que permute b

for k = 1:n
    U(k,k:n) = A(k,k:n) - L(k,1:k-1) * U(1:k-1,k:n);    %Vamos poniendo los valores para formar la matriz triangular 
                                                        %superior desde la columna 1 en adelante
    L(k,k) = 1;             %Llenamos de 1 la diagonal de L
    L(k+1:n,k) = (A(k+1:n,k) - L(k+1:n,1:k-1) * U(1:k-1,k))/U(k,k); %Se van poniendo los valores a la matriz triangular 
                                                                    %inferior desde la fila 2 porque en la 1 va un 1
    end
b = P * b;        %Permutamos b, multiplicamos por la izquierda ya que cambiamos filas
Y = Lsolve(L, b);     %Obtenemos la solucion al problema Ly = b
Xf = Usolve(U, Y);    %Obtenemos la solucion al problema Ux = y, pero el vector al reves
for i = 1:n
    X(i) = Xf(n + 1 - i);     %Corregimos el vector anterior
  end

end
