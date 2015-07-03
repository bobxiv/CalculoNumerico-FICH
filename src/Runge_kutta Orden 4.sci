//Ejemplo de sistema de Ec. Dif. de 2 ecuaciones
//Las ecuaciones son ordinarias
function usal=f(i,t,w)
  
  u(1)=-4*w(1)-2*w(2)+cos(t)+4*sin(t);
  u(2)=3*w(1)+w(2)-3*sin(t);
  
  usal=u(i);
endfunction


//Metod de resolucion de PVI de Ecuaciones Diferenciales Ordinarias
//de orden 1. Runge-Kutta Orden 4.
//IMPORTANTE: ESTA MODIFICADO PARA RESOLVER SISTEMAS DE ECUACIONES DIF.
//Su error por truncamiento local es O(h^4)
//Parametros:
// f    Es la funcion  dy/dt = f(t,y)
//      En caso de ser un sistema, el primer paramtro de f simpre es de 
//      que ecuacion
// W0   Es el valor inicial del problema, si es un sistema, luego W0 es 
//      un vector, con cada componente el W0 de una ecuacion
// N    Es la cantidad de pasos a tomar, con base a b, a y N se saca h
// a    Es el comienzo del intervalo, es decir y(a)=W0
// b    Es el fin del intervalo
function W=Runge_Kutta(f,W0,N,a,b)

  h = (b-a)/N;
  
  m = length( W0 );//cuenta si es que es un sistema de ec. dif.
                   //cunatas ecuaciones tiene
                   
  W = zeros(m,N);//es un vector de w por cada ecuacion, m ecuaciones
  W(:,1) = W0(:);
  
  s = a:h:b;

  for i= 1:N//loop principal
    
    k0 = zeros(m); k1 = zeros(m); k2 = zeros(m); k3 = zeros(m);
    
    for j= 1:m//un k por cada ecuacion
      k0(j) = f(j, s(i), W(:,i));
    end
  
    for j= 1:m
      k1(j) = f(j, s(i)+h/2, W(:,i)+k0(:)/2);
    end
    
    for j= 1:m
      k2(j) = f(j, s(i)+h/2, W(:,i)+k1(:)/2);
    end
  
    for j= 1:m
      k3(j) = f(j, s(i)+h, W(:,i));
    end
    
    
    for j= 1:m//un W por cada ecuacion    
      W(j,i+1) = W(j,i) + (h/6)*(k0(j) + 2*k1(j) + 2*k2(j) + k3(j));
    end
    
  end
    
  
endfunction

