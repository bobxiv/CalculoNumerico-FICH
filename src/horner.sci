//Aplica el metodo de horner para calcular un polinomio
//y su derivada en un punto
//Entrada:
//        - x_eval Punto a evaluar el polinomio P y su derivada P'
//        - coef Los coeficientes de P, donde coef(0) es cte y coef(n) grado
//Salida:
//        - p P(x_eval)
//        - dp P'(x_eval)
//
//Importante P'(x_eval)=Q(x_eval) y b(1)=P(x_eval)
function [p,dp]=horner(x_eval,coef)
  [o,n] = size(coef);
  b = ones(1,n);
  b(n) = coef(n);
  for i=1:2 //primera iteracion calcula p, en la segunda dp
    for k= n-1:-1:1

      b(k) = coef(k) + b(k+1)*x_eval;//definicion de bk segun horner
      
    end
    
    if( i==1)
      p=b(1);
    else  
      dp=b(1);
      return;
    end
        
    coef(1:n-1) = b(2:n); 
    b(n-1)=coef(n-1);
    n= n-1;
  end
endfunction
 
