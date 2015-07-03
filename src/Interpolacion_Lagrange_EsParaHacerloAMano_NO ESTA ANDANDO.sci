//IMPORTANTE: No esta andando!, porque nose si puedo hacer algo asi como 
//una resta simbolica o algo asi en scilab, este algoritmo es en realidad
//para aplicarlo a mano.

//Supuesto Funcionamiento:
//Recibe:
//       X  Los puntos x0,x2,...,xn en donde se tiene y(xi)
//       Y  Los valores de y(xi) para todos los X
//Deberia devolver:
//       f  Funcion que es el polinomio de Lagrange, pero no lo puedo hacer
//          porque nose si podria operar simbolicamente de alguna manera
function f=Interpolacion_Lagrange(X,Y)
  
  N = length(X);
  P = zeros(N,N);
  P(:,1) = Y';
  
  for j= 2:N
    for i= j:N
      
      P(i,j)=((X-X(i-1))*P(i,j-1))-((X-X(i))*P(i-1,j-1))/(X(i)-X(i-1));
      
    end
  end

  f = P(N,N);
    
endfunction

