function [y,l]=baskara(x)
  disc = x(2)^2-4*x(1)*x(3)
    if disc == 0 then
       l= 'Las raices son iguales'
    elseif disc<0 then
       l= 'Las raices son complejas'
    else l= 'Las raices son distintas'
    end

  y(1) = (-x(2)+sqrt(disc))/(2*x(3))
  y(2) = (-x(2)-sqrt(disc))/(2*x(3))
 endfunction
