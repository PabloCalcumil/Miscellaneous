%------------------------------------------------------------------------------
%------------------------------------------------------------------------------
%--------------------------------Pregunta c y d--------------------------------
%------------------------------------------------------------------------------
%------------------------------------------------------------------------------

%Diferencias finitas centradas para el problema
%  -u'' + bu' + u = 2x,      en (0,1)
%  u(0) = u(1) = 0

clear all
close all
clc

%Parametro b de la EDO
b1 = 0;
b2 = 100;

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
  error_b1(k) = max(abs(sol_discre(b1, H(k), N(k), x) - u_e(b1, x, N(k))));
  error_b2(k) = max(abs(sol_discre(b2, H(k), N(k), x) - u_e(b2, x, N(k))));
  end

error_b1
error_b2

figure(1)
loglog(H, error_b1)
title('Error vs h para b = 0 en escala log-log')

figure(2)
loglog(H, error_b2)
title('Error vs h para b = 100 en escala log-log')

%------------------------------------------------------------------------------
%------------------------------------------------------------------------------
%----------------------------------Pregunta e----------------------------------
%------------------------------------------------------------------------------
%------------------------------------------------------------------------------

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

figure(3)
plot(intervalo, y_1, 'r', x_20, sol_discre(b1, H(1), N(1), x_20), 'b', x_80, sol_discre(b1, H(2), N(2), x_80), 'g')
legend('u', 'h20', 'h80')
title('U y u vs x para b = 0')

figure(4)
plot(intervalo, y_2, 'r', x_20, sol_discre(b2, H(1), N(1), x_20), 'b', x_80, sol_discre(b2, H(2), N(2), x_80), 'g')
legend('u', 'h20', 'h80')
title('U y u vs x para b = 100')






