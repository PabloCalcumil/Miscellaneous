function [X, t] = Chol(A, b)
tic
[n,m] = size(A);      %dimensiones de A
L = A;                  %Podriamos usar A pero es para no perdernos en el camino
for k = 1:n             %Algoritmo de cholesky definido por sumatoria
    for i = 1:k - 1         
        sum = 0;          
        for j = 1:i - 1         
            sum = sum +L(i ,j) * L(k ,j);      
          end                                 %Algoritmo de cholesky definido por sumatoria
        L(k ,i)=(L(k ,i) - sum) / L(i ,i);     
      end   
    sum = 0;
    for j = 1:k - 1
        sum = sum + L(k ,j) * L(k ,j);  %Definido por algoritmo de Cholesky definido por sumatoria
      end
    L(k ,k) = sqrt(L(k ,k) - sum);
  end
for i = 1:n - 1           %Añade los 0s de la L de cholesky
    for j = 1:n         %Ya que esta es triangular inferior
        if j > i         
            L(i ,j) = 0; 
          end 
      end
  end
Lt = L';         %Lt sera la U de cholesky(transpuesta de L) tiangular superior
Y = b * 0;           %se inicializa el vector "c", que tiene el mismo tamaño de "b"
X = Y;              %Para formar el sistema Ly = b
Xf = X;           % Para resolver UXf = y con U = Lt
Y = Lsolve(L ,b);     %Resolvemos Ly = b
Xf = Usolve(Lt ,Y);   %Obtenemos la solucion al problema Ux = y, pero el vector al reves
for i = 1:n
    X(i) = Xf(n + 1 - i);     %Corregimos el vector anterior
  end
t = toc
end