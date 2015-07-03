function X=Newton(f,df,x0,it,tol)
  k=1;
  X=x0;
  while( k < it )
    
    X=x0 - f(x0)/df(x0);

    if( abs((X-x0)/X) < tol )
      return;
    end
    x0=X;
    k=k+1;
  end
  
  printf("No se logro la presicion esperada con las %d iteraciones\n",it);
  
endfunction
   
