import numpy as np
def distancia(x,y,p1,p2,l):
    res=np.zeros(l)
    for i in range(0,l):
        res[i]=np.sqrt((p1-x[i])**2+(p2-y[i])**2)
    return res

def gradiente(x,y,p1,p2,w,d):
    res=np.array([0,0])
    res[0]=np.sum(w*(p1-x)/d)
    res[1]=np.sum(w*(p2-y)/d)
    return res

def hessiana(x,y,p1,p2,w,d):
    res=np.zeros((2,2))
    res[0][0]=np.sum(w*(d-(p1-x)**2/d)/d**3)
    res[0][1]=-np.sum(w*(p1-x)*(p2-y)/d**2)
    res[1][0]=res[0][1]
    res[1][1]=np.sum(w*(d-(p1-y)**2/d)/d**3)
    return res
    
def Newton(w,x,y,l,alfa,beta,tolerancia,c):
    #paso
    t=1.
    
    #punto de partida y distancia
    sx,sy=w*x,w*y
    xk,yk=np.sum(sx)/np.sum(w),np.sum(sy)/np.sum(w)
    d=distancia(x,y,xk,yk,l)
    
    #gradiente
    g=gradiente(x,y,xk,yk,w,d)
    
    #hessiana
    h=hessiana(x,y,xk,yk,w,d)
    
    #lambda y direccion de descenso
    dire=np.linalg.inv(h)@g
    lamb=np.transpose(g)@dire
    count=0
    
    while 2*tolerancia<lamb**2 and count<c:
        xk,yk=xk-alfa*t*dire[0],yk-alfa*t*dire[0]
        d=distancia(x,y,xk,yk,l)
        g=gradiente(x,y,xk,yk,w,d)
        h=hessiana(x,y,xk,yk,w,d)
        dire=np.linalg.inv(h)@g
        lamb=np.transpose(g)@dire
        #rint(count,lamb)
        t=beta*t
        count+=1
    return (np.sum(w*d),count)
