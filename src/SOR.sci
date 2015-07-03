//Resolucion de SOR(Succesive Over-Relaxation)
//Se requiere:
//            1) Converge sii eig(A)<1
//            2) El resultado depende mucho del w que se elija
//
//Entrada:
//        A:   La matriz a resolver
//        b:   Vector independiente
//        x0:  Vector de arranque
//        w:   Medida de relajacion
//        it:  Cantidad maxima de iteraciones
//        tol: Tolerancia de error "minima"
//Salida:
//        x: Vector solucion del sistema
function x=SOR(A,b,x0,w,it,tol)
  k=1
  [n,n]=size(A)
  x=zeros(n,1)
  while k <= it
    for i= 1:n
      x(i)= (1-w)*x0(i)+w*(sum(-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x0(i+1:n))+b(i))/A(i,i)
    end
    
    if (abs(x-x0) < tol) then
      break
    end
  
    x0=x
    k=k+1
  end
  
endfunction
