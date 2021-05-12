function [ Vector ] = Pisano( largo, modulo)  
  %Pisano pide el largo del vector y el valor con el cual formaremos el modulo
Vector = Fib(largo);
for i = 1:largo
    Vector(i) = mod(Vector(i) ,modulo);
  end
end  