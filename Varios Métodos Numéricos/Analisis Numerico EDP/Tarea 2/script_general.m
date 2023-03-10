%--------------------------------------------------------------
%--------------------------------------------------------------

%Se tiene el problema donde la malla es general
%es decir, no necesariamente tiene espaciamiento uniforme
%  -u'' + bu' + u = 2x,      en (0,1)
%  u(0) = u(1) = 0


clear all
close all
clc

%---------------------------------------------------------------
%------------------------ Problema 4(a) ------------------------
%---------------------------------------------------------------

%Vemos primero el problema para una malla general

%Cantidad total de nodos, incluyendo el x_0 = 0 y x_N = 1
cant_nodos = 100;

%Ahora vemos los nodos interiores, formados aleatoriamente
nodos_int = malla_general(cant_nodos - 2);

%Como se formaron aleatoriamente los nodos, 
%el espaciamiento no es uniforme, por lo que
%con el siguiente ciclo, formamos las N-1 
%distancias entre nodos, es decir h's no uniformes

h = zeros(cant_nodos - 1, 1);

for k = 1:(cant_nodos - 1)
  if k == 1
      h(k) = nodos_int(k);
  elseif k == (cant_nodos - 1)
      h(k) = 1 - nodos_int(k - 1);
  else
      h(k) = nodos_int(k) - nodos_int(k - 1);
  end
end

%Ahora veremos los errores (error maximo) para cada caso b = 0 y b = 100
b1 = 0;
b2 = 100;

%Formamos el vector que incluye los valores x = 0 y x = 1
% esto para la solución analitica de la edo
x = zeros(cant_nodos, 1);
x(2:cant_nodos - 1) = nodos_int;

%Calculo del error, norma del maximo
error_b1 = max(abs(sol_discre(b1, h, cant_nodos - 2, nodos_int) - u_e(b1, x)));
error_b2 = max(abs(sol_discre(b2, h, cant_nodos - 2, nodos_int) - u_e(b2, x)));

error_b1
error_b2


%---------------------------------------------------------------
%------------------------ Problema 4(b) ------------------------
%---------------------------------------------------------------

%Espaciamiento Uniforme y vectores para espaciamiento, nodos y errores
%Segun sea el parametro b de la EDO
H = zeros(6, 1);
N = zeros(6, 1);
error_b1 = zeros(6, 1);
error_b2 = zeros(6, 1);

%Vectores de espaciamiento, en cada celda tendran un espaciamiento distinto
for k = 0:5
  H(k + 1) = 5^(-1) * 2^(-k);
  N(k + 1) = 1/H(k + 1) - 1;
endfor

%
for k = 1:6
  
  %Se forma un nuevo vector de nodos en base al espaciamiento dado para cada k
  x = zeros(N(k) + 2, 1);
  for i = 1:N(k) + 2
      x(i) = (i - 1) * H(k);
  end
  
  
  %Calculo de los errores para cada cantidad de nodos interiores
  %segun sea su espaciamiento, y tambien segun el parametro b
  
  h = ones(N(k) + 1, 1) * H(k);
  
  U_1 = sol_discre(b1, h, N(k), x(2:N(k) + 1));
  U_2 = sol_discre(b2, h, N(k), x(2:N(k) + 1));
  
  %Calculamos norma L2 para funcion (u - U)
  error_b1(k) = error_norma_L2(U_1, x, N(k), h, b1);
  error_b2(k) = error_norma_L2(U_2, x, N(k), h, b2);
  
  end

figure(1)
loglog(H, error_b1)
title('Error norma L2 vs h para b = 0 en escala log-log')

figure(2)
loglog(H, error_b2)
title('Error norma L2 vs h para b = 100 en escala log-log')

for k = 1:6
  
  h = ones(N(k) + 1, 1) * H(k);
  
  U_1 = sol_discre(b1, h, N(k), x(2:N(k) + 1));
  U_2 = sol_discre(b2, h, N(k), x(2:N(k) + 1));
  
  %Calculamos seminorma H1 para funcion (u - U)
  
  error_b1(k) = error_b1(k) + error_seminorma_H1(U_1, x, N(k), h, b1);
  error_b2(k) = error_b2(k) + error_seminorma_H1(U_2, x, N(k), h, b2);
  
endfor

error_b1
error_b2

figure(3)
loglog(H, error_b1)
title('Error norma H1 vs h para b = 0 en escala log-log')

figure(4)
loglog(H, error_b2)
title('Error norma H1 vs h para b = 100 en escala log-log')


%---------------------------------------------------------------
%------------------------ Problema 4(c) ------------------------
%---------------------------------------------------------------


%Espaciamiento y cantidad de nodos para el h20 y h80
H = [1/20 , 1/80];
N = [1/H(1) - 1, 1/H(2) - 1];

% Vector de nodos (internos y externos) para h20
x_20 = zeros(N(1) + 2, 1);   
for i = 1:N(1) + 2
    x_20(i) = (i - 1) * H(1);
end

% Vector de nodos (internos y externos) para h80
x_80 = zeros(N(2) + 2, 1);
for i = 1:N(2) + 2
    x_80(i) = (i - 1) * H(2);
end

%Calculo de la solucion u para el problema analitico para b = 0 y b = 100
intervalo = 0:0.001:1;
y_1 = u_e(b1, intervalo);
y_2 = u_e(b2, intervalo);

h_1 = ones(N(1), 1) * H(1);
h_2 = ones(N(2), 1) * H(2);

figure(5)
plot(intervalo, y_1, 'r', x_20, sol_discre(b1, h_1, N(1), x_20), 'b', x_80, sol_discre(b1, h_2, N(2), x_80), 'g')
legend('u', 'U_{h20}', 'U_{h80}')
title('U y u vs x para b = 0')

figure(6)
plot(intervalo, y_2, 'r', x_20, sol_discre(b2, h_1, N(1), x_20), 'b', x_80, sol_discre(b2, h_2, N(2), x_80), 'g')
legend('u', 'U_{h20}', 'U_{h80}')
title('U y u vs x para b = 100')


%---------------------------------------------------------------
%------------------------ Problema 4(d) ------------------------
%---------------------------------------------------------------

N = 100;
betas = 20;

error = zeros(betas, 1);
error_L2 = zeros(betas, 1);
error_H1 = zeros(betas, 1);
T = zeros(betas,N);

for m = 1:betas
  beta = 1 + .1 * m;
  
  for i = 1: N + 1
    T(m, i) = 1 - ((N - (i - 1)) / N)^beta;
  endfor
  
  h = zeros(N, 1);

  for k = 1:N
    if k == 1
      h(k) = T(m, 2);
    elseif k == (N - 1)
      h(k) = 1 - T(m, N);
    else
      h(k) = T(m, k) - T(m, k - 1);
    end
  end
  
  T = transpose(T);
  
  U_2 = sol_discre(b2, h, N - 1, T(2: N, m));
  u_2 = u_e(b2, T(:, m));
  
  error(m) = max(abs(U_2 - u_2));
  
  
  error_L2(m) = error_norma_L2(U_2, T(2:N - 1, m), N - 2, h, b2);
  error_H1(m) = error_L2(m) +...
             error_seminorma_H1(U_2, T(2:N - 1, m), N - 2, h, b2);
  
end


error
error_L2
error_H1

%Buscamos el minimo error
minimo_error = min(error)
minimo_error_L2 = min(error_L2)
minimo_error_H1 = min(error_H1)

index_error = find(error == minimo_error);
index_L2 = find(error_L2 == minimo_error_L2);
index_H1 = find(error_H1 == minimo_error_H1);

%finalmente se escogen los betas 

beta_norma_del_maximo = 1 + 0.1 * index_error
beta_norma_L2 = 1 + 0.1 * index_L2
beta_norma_H1 = 1 + 0.1 * index_H1


























