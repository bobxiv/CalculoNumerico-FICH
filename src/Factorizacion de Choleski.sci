//Factorizacion de Choleski
//Se requiere:
//            1) A Definida Positiva
//
//Entrada:
//        A: La matriz de la que se calculara L*L' = A
//        n: Dimension de A
//Salida:
//        L: Matriz tringular inferior con la factorizacion
//           , la parte superior se sacara L'
function L=fact_choleski(A,n)
  
  //Limpio la triangular superior ya que la matriz es simetrica
  //y esa parte no nos interesa
  for i= 1:n
    for j= (i+1):n
      A(i,j)=0
    end
  end
  
  //Procesando primera columna
  A(1,1)= sqrt(A(1,1))   //L11 = A11^(1/2)
  for i= 2:n
    A(i,1)= A(i,1)/A(1,1)//Li1 = Ai1/L11
  end

  //Procesando Cuerpo
  for i= 2:(n-1)
    tmp=0
    for k= 1:(i-1)
      tmp= tmp + A(i,k)^2 //sigma[k=1:i-1] Lik^2
    end
    A(i,i) = sqrt(A(i,i) - tmp)//Lii = (A(ii)-tmp)^(1/2)
    
    for j= (i+1):n//Calcula abajo de la diagonal
      tmp=0
      for k= 1:(i-1)
        tmp= tmp + A(j,k)*A(i,k)//sigma[k=1:i-1] Ljk * Lik
      end
    A(j,i)= (A(j,i) - tmp)/A(i,i)//Lji = (Aji-tmp)/Lii
    end
  end
  
  //Procesando ultima columna
  tmp=0
  for k= 1:(n-1)
    tmp= tmp + A(n,k)^2
  end
  A(n,n)= sqrt(A(n,n) - tmp)
  
  //Por la factorizacion
  // A = L*L'
  L=A
endfunction
        
