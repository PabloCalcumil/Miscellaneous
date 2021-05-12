import numpy as np

def Weiszfeld(ArregloW,ArregloX,ArregloY,numero,tolerancia,kmax):
	
	#Establecemos el valor semilla
	WX, WY = ArregloW * ArregloX, ArregloW * ArregloY
	x_k = np.sum(WX)/np.sum(ArregloW)
	y_k = np.sum(WY)/np.sum(ArregloW)
	
	#Valor d_i para obtener nuevos valores de iteracion y el error
	d_i = np.sqrt((ArregloX-x_k) * (ArregloX-x_k) + (ArregloY-y_k) * (ArregloY-y_k))
	Z_k = np.sum(ArregloW*d_i)
	contador, error = 0,10000
	Z_k1 = Z_k
	
	while error > tolerancia and contador < kmax:
	
		#Nuevos valores al iterar
		x_k = np.sum(WX/d_i)/np.sum(ArregloW/d_i)
		y_k = np.sum(WY/d_i)/np.sum(ArregloW/d_i)
		
		#Valor d_i actualizado con nuevos x_k e y_k, y nuevo valor para error
		d_i = np.sqrt((ArregloX-x_k) * (ArregloX-x_k) + (ArregloY-y_k) * (ArregloY-y_k))
		Z_k1 = np.sum(ArregloW * d_i)
		contador = contador + 1
		error = abs(Z_k1-Z_k)
		Z_k = Z_k1
		
	#Valor de funcion objetivo evaluada en el optimo
	VOptimo = np.sum(ArregloW * np.sqrt((ArregloX-x_k) * (ArregloX-x_k) + (ArregloY-y_k) * (ArregloY-y_k)))
	return (VOptimo,contador)
