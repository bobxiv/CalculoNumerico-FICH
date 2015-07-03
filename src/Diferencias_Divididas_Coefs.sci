//Supuesto Funcionamiento:
//Recibe:
//       X  Los puntos x0,x2,...,xn en donde se tiene y(xi)
//       Y  Los valores de y(xi) para todos los X
//Deberia devolver:
//       f  Funcion que es el polinomio de Lagrange, pero no lo puedo hacer
//          porque nose si podria operar simbolicamente de alguna manera
function a=Diferencias_Divididas_Coefs(X,Y)

  N=length(X);
  F=zeros(N,N);
  F(:,1)=Y';
  
  for j= 2:N
    for i= j:N
      
      F(i,j)= (F(i,j-1)-F(i-1,j-1))/(X(i)-X(i-1));
      
    end
  end
  
  a=zeros(1,N);
  for k= 1:N
    a(k)= F(k,k);
  end
    
endfunction

