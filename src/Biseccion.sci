function X=Biseccion(f,a,b,it,tol)
  if( a > b )
    printf("[%d,%d] no forma un intervalo valido\n",a,b);
    X=null;
    return;
  end
    
  k=1;
  p=a;
  while( k < it )
    
    p= (a+b)/2;
    
    if( f(a)*f(p) < 0 )
      b=p;
    else
      a=p;
    end
  
    if( abs(f(p)) < tol )
      X= p;
      return;
    end
    
    k=k+1;
  end
  
  printf("No se logro la presicion esperada con las %d iteraciones\n",it);
  X= p;
  
endfunction

    
    
