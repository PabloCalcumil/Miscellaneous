import numpy as np

def Gradiente(ArregloW,ArregloX,ArregloY,numero,alfa,beta,tolerancia,kmax):
	
	#Establecemos el valor semilla
	WX, WY = ArregloW * ArregloX, ArregloW * ArregloY
	x_k = np.sum(WX)/np.sum(ArregloW)
	y_k = np.sum(WY)/np.sum(ArregloW)
	f_xk = ArregloW * np.sqrt((ArregloX - x_k) * (ArregloX - x_k) + (ArregloY - y_k)*(ArregloY - y_k))
	f_xk = np.sum(f_xk)
	
	#Aca tenemos las 2 coordenadas del Delta x que es menos gradiente al ser descenso
	df_x = np.sum(ArregloW * ((x_k - ArregloX) / np.sqrt((ArregloX - x_k)*(ArregloX - x_k) + (ArregloY - y_k)*(ArregloY - y_k))))
	df_x = -1 * df_x
	df_y = np.sum(ArregloW * ((y_k - ArregloY) / np.sqrt((ArregloX - x_k)*(ArregloX - x_k) + (ArregloY - y_k)*(ArregloY - y_k))))
	df_y = -1 * df_y
	
	
	#Funcion objetivo pero en el nuevo x_k = x_k-1 + t*Deltax, para ver condicion de iteracion
	f_xk1 = ArregloW * np.sqrt((ArregloX - (x_k + df_x))*(ArregloX - (x_k + df_x)) + (ArregloY - (y_k + df_y))*(ArregloY - (y_k + df_y)))
	f_xk1 = np.sum(f_xk1)
	error = abs(f_xk1 - f_xk)
	contador = 0
	
	#Vemos con el criterio del error del metodo gradiente
	while  error > tolerancia and kmax > contador:
		
		#Retomamos valores correspondientes de t y del criterio para t optimo con funcion y gradiente actualizado
		t = 1.0
		funcion_x = f_xk + -1 * alfa * t * ((df_x * df_x) + (df_y * df_y))
		
		#Criterio del Backtracking
		while f_xk1 > funcion_x:
			
			#Actualizamos t
			t = beta * t
			
			#Esta variable sirve solo para ver si se cumple el criterio de Backtracking
			f_xk1 = np.sqrt((ArregloX - (x_k + t*df_x))*(ArregloX - (x_k + t*df_x))+(ArregloY - (y_k + t*df_y))*(ArregloY - (y_k + t*df_y)))
			f_xk1 = np.sum(ArregloW * f_xk1)
			funcion_x = f_xk + -1 * alfa * t * ((df_x * df_x) + (df_y * df_y))


		#Actualizamos x_k, dado el t que se obtuvo antes de no cumplir criterio de Backtracking
		t = t / beta
		x_k = x_k + t * df_x
		y_k = y_k + t * df_y
		
		#Gradiente en el nuevo x_k
		df_x = np.sum(ArregloW * ((x_k - ArregloX) / np.sqrt((ArregloX - x_k)*(ArregloX - x_k) + (ArregloY - y_k)*(ArregloY - y_k))))
		df_x = -1 * df_x
		df_y = np.sum(ArregloW * ((y_k - ArregloY) / np.sqrt((ArregloX - x_k)*(ArregloX - x_k) + (ArregloY - y_k)*(ArregloY - y_k))))
		df_y = -1 * df_y

		
		#Este será el nuevo valor para el criterio de t optimo de backtracking
		f_xk1 = ArregloW * np.sqrt((ArregloX - x_k) * (ArregloX - x_k) + (ArregloY - y_k)*(ArregloY - y_k))
		f_xk1 = np.sum(f_xk1)
		
		#Vemos error con el x_k-1
		error = abs(f_xk - f_xk1)
		
		#Tenemos el valor de la funcion objetivo actualizado
		f_xk = f_xk1
		contador = contador + 1
		
	return (f_xk,contador)
	
