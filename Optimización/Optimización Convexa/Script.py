# Importamos librerias y funciones

import numpy as np
import matplotlib.pyplot as plt
import Funcion_Weiszfeld as FW
import Gradiente_BCT as GB
import Newton_BCT as NB
from time import time


### Creamos las configuraciones de testeo
# Nota: La funcion np.random.randint crea numeros aleatorios
#       con distribucion uniforme discreta 
#  Y np.random.uniform con distribucion uniforme continua


x_i100 = np.random.randint(100, size = 100)
x_i1000 = np.random.randint(1000, size = 1000)
x_i10000 = np.random.randint(10000, size = 10000)
y_i100 = np.random.randint(100, size = 100)
y_i1000 = np.random.randint(1000, size = 1000)
y_i10000 = np.random.randint(10000, size = 10000)
w_i100 = np.random.uniform(10,50,100)
w_i1000 = np.random.uniform(100,500,1000)
w_i10000 = np.random.uniform(1000,5000,10000)

print("Los siguientes datos se utilizarán para todos los datos\n")
iteracion_max = int(input("Ingrese iteracion maxima:"))
tolerancia = float(input("Ingrese tolerancia de error:"))

# Obtendremos los valores para cada caso para el metodo Weiszfeld
# calculando tiempo de ejecucion, iteraciones y funcion objetivo

# Caso |I|=100

time_FWi = time()

values_FW100 = FW.Weiszfeld(w_i100,x_i100,y_i100,100,tolerancia,iteracion_max)

time_FWf = time()
time_FW100 = time_FWf - time_FWi

# Caso |I|=1000

time_FWi = time()

values_FW1000 = FW.Weiszfeld(w_i1000,x_i1000,y_i1000,1000,tolerancia,iteracion_max)

time_FWf = time()
time_FW1000 = time_FWf - time_FWi


# Caso |I|=10000

time_FWi = time()

values_FW10000 = FW.Weiszfeld(w_i10000,x_i10000,y_i10000,10000,tolerancia,iteracion_max)

time_FWf = time()
time_FW10000 = time_FWf - time_FWi


print("\nPara el metodo del Gradiente y Newton con Backtracking se ingresarán alpha y beta:\n")
alfa = -1
beta = -1
print("Recuerda:")
print("\nValor de alpha en (0 , 0.5)")
print("\nValor de beta en (0 , 1)\n")


#Valores de alfa y beta permitidos

while (alfa > 0.5 or alfa < 0):
	alfa = float(input("Ingresa valor de alpha:"))
	if alfa >0.5 or alfa < 0:
		print("\nValor de alpha entre 0 y 0.5\n")
		

while (beta > 1 or beta < 0):
	beta = float(input("Ingresa valor de beta:"))
	if beta >1 or beta < 0:
		print("\nValor de alpha entre 0 y 0.5\n")



# Obtendremos los valores para cada caso para el metodo de la gradiente con backtracking
# calculando tiempo de ejecucion, iteraciones y funcion objetivo


# Caso |I|=100


time_GBi = time()

values_GB100 = GB.Gradiente(w_i100,x_i100,y_i100,100,alfa,beta,tolerancia,iteracion_max)

time_GBf = time()
time_GB100 = time_GBf - time_GBi

# Caso |I|=1000

time_GBi = time()

values_GB1000 = GB.Gradiente(w_i1000,x_i1000,y_i1000,1000,alfa,beta,tolerancia,iteracion_max)

time_GBf = time()
time_GB1000 = time_GBf - time_GBi


# Caso |I|=10000

time_GBi = time()

values_GB10000 = GB.Gradiente(w_i10000,x_i10000,y_i10000,10000,alfa,beta,tolerancia,iteracion_max)

time_GBf = time()
time_GB10000 = time_GBf - time_GBi


# Obtendremos los valores para cada caso para el metodo de la gradiente con backtracking
# calculando tiempo de ejecucion, iteraciones y funcion objetivo


# Caso |I|=100


time_NBi = time()

values_NB100 = NB.Newton(w_i100,x_i100,y_i100,100,alfa,beta,tolerancia,iteracion_max)

time_NBf = time()
time_NB100 = time_NBf - time_NBi

# Caso |I|=1000

time_NBi = time()

values_NB1000 = NB.Newton(w_i1000,x_i1000,y_i1000,1000,alfa,beta,tolerancia,iteracion_max)

time_NBf = time()
time_NB1000 = time_NBf - time_NBi


# Caso |I|=10000

time_NBi = time()

values_NB10000 = NB.Newton(w_i10000,x_i10000,y_i10000,10000,alfa,beta,tolerancia,iteracion_max)

time_NBf = time()
time_NB10000 = time_NBf - time_NBi








print("____________________________________________________________________")


print("\nValores de funcion Weiszfeld con Backtracking para 100 datos:\n")
print("\nEl valor del optimo de la funcion objetivo es:", values_FW100[0])
print("\nLa cantidad de iteraciones fue:", values_FW100[1])
print("\nSe demoro:", time_FW100)

print("----------------------------------------")

print("\nValores de funcion Weiszfeld con Backtracking para 1000 datos:\n")
print("\nEl valor del optimo de la funcion objetivo es:", values_FW1000[0])
print("\nLa cantidad de iteraciones fue:", values_FW1000[1])
print("\nSe demoro:", time_FW1000)

print("----------------------------------------")

print("\nValores de funcion Weiszfeld con Backtracking para 10000 datos:\n")
print("\nEl valor del optimo de la funcion objetivo es:", values_FW10000[0])
print("\nLa cantidad de iteraciones fue:", values_FW10000[1])
print("\nSe demoro:", time_FW10000)

print("____________________________________________________________________")


print("\nValores de funcion Gradiente con Backtracking para 100 datos:\n")
print("\nEl valor del optimo de la funcion objetivo es:", values_GB100[0])
print("\nLa cantidad de iteraciones fue:", values_GB100[1])
print("\nSe demoro:", time_GB100)

print("----------------------------------------")

print("\nValores de funcion Gradiente con Backtracking para 1000 datos:\n")
print("\nEl valor del optimo de la funcion objetivo es:", values_GB1000[0])
print("\nLa cantidad de iteraciones fue:", values_GB1000[1])
print("\nSe demoro:", time_GB1000)

print("----------------------------------------")

print("\nValores de funcion Gradiente con Backtracking para 10000 datos:\n")
print("\nEl valor del optimo de la funcion objetivo es:", values_GB10000[0])
print("\nLa cantidad de iteraciones fue:", values_GB10000[1])
print("\nSe demoro:", time_GB10000)

print("____________________________________________________________________")

print("\nValores de funcion Newton con Backtracking para 100 datos:\n")
print("\nEl valor del optimo de la funcion objetivo es:", values_NB100[0])
print("\nLa cantidad de iteraciones fue:", values_NB100[1])
print("\nSe demoro:", time_NB100)

print("----------------------------------------")

print("\nValores de funcion Newton con Backtracking para 1000 datos:\n")
print("\nEl valor del optimo de la funcion objetivo es:", values_GB1000[0])
print("\nLa cantidad de iteraciones fue:", values_NB1000[1])
print("\nSe demoro:", time_NB1000)

print("----------------------------------------")

print("\nValores de funcion Newton con Backtracking para 10000 datos:\n")
print("\nEl valor del optimo de la funcion objetivo es:", values_NB10000[0])
print("\nLa cantidad de iteraciones fue:", values_NB10000[1])
print("\nSe demoro:", time_NB10000)

print("____________________________________________________________________")

