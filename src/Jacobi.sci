//Resolucion de Jacobi
//Se requiere:
//            1) Converge sii eig(A)<1
//
//Entrada:
//        A:   La matriz a resolver
//        b:   Vector independiente
//        x0:  Vector de arranque
//        it:  Cantidad maxima de iteraciones
//        tol: Tolerancia de error "minima"
//Salida:
//        x: Vector solucion del sistema
function x=jacobi(A,b,x0,it,tol)
  k = 1
  [n,n]=size(A)
  x=zeros(n,1)//Llena x con 0 por las dudas nunca entra en el while
  while k <= it
    for i = 1:n
      x(i)= (sum(-A(i,1:i-1)*x0(1:i-1)-A(i,i+1:n)*x0(i+1:n))+b(i))/A(i,i)
    end

    if (abs(x - x0) < tol) then
      break
    end
    
    x0=x
    k= k+1
  end 
    
endfunction 
  
