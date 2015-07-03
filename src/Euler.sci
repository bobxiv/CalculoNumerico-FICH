//Metod de resolucion de PVI de Ecuaciones Diferenciales Ordinarias
//de orden 1. Metodo de Euler.
//Su error por truncamiento local es O(h)
//Parametros:
// f    Es la funcion  dy/dt = f(t,y)
// W0   Es el valor inicial del problema
// N    Es la cantidad de pasos a tomar, con base a b, a y N se saca h
// a    Es el comienzo del intervalo, es decir y(a)=W0
// b    Es el fin del intervalo
function W= Euler(f,W0,N,a,b)
  
  h= (b-a)/N;
  
  W = zeros(1,N);
  W(1) = W0;
  s= a:h:b;
  
  for i= 1:N
    
    W(i+1) = W(i) + h*f(s(i), W(i));
    
  end
  
endfunction



