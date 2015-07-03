//Resolucion iterativa, tipo punto fijo:
//
//    x = x0 - inv(J) F(x)
//
//              Donde el jacobiano y el sistema F se calcula cada iteracion

//Soluciona un sistema no lineal de ecuaciones de 3x3 por Newton donde:
//-Las ecuaciones del sistema
//        |-  F1(x)
//    F(x)|   F2(x)
//        |-  F3(x)
//                    Donde x el vector de las incognitas
//    
//-El jacobiano(matriz) donde el DF?1_x?2
//                  ?1 es el numero de ecuacion
//                  ?2 es el numero de incognita, el x sera escalar
//
//     J(x)|- DF1_x1  DF1_x2  DF1_x3
//         |  DF2_x1  DF2_x2  DF2_x3
//         |- DF3_x1  DF3_x2  DF3_x3
//-La cantidad maxima de iteraciones it
//
//-La tolerancia de error tol
function X=NewtonSistema(F1,F2,F3,DF1_x1,DF1_x2,DF1_x3,DF2_x1,DF2_x2,DF2_x3,DF3_x1,DF3_x2,DF3_x3,x0,it,tol)
  k=1;
  X=x0;
  while( k < it )
    
    F=[F1(x0),F2(x0),F3(x0)];
    J= [DF1_x1(x0),DF1_x2(x0),DF1_x3(x0);
        DF2_x1(x0),DF2_x2(x0),DF2_x3(x0);
        DF3_x1(x0),DF3_x2(x0),DF3_x3(x0);
        ];
    y = inv(J) * (-F');
    X=x0 + y'; 

    if( norm(J) < tol )
      return;
    end
  
    x0=X;
    k=k+1;
  end
  
  printf("No se logro la presicion esperada con las %d iteraciones\n",it);
  
endfunction


//Algunas funciones para probar el funcionamiento
//Este sistema(vector):
//
//     F(x)=   | 3*x(1)-cos(x(2)*x(3))-1/2               = 0 |
//             | x(1)^2-81*(x(2)+0.1)^2+sin(x(3))+1.06   = 0 |
//             | exp(-x(1)*x(2))+20*x(3)+(10*3.1415-3)/3 = 0 |

function res=F1(x)
  res = 3*x(1)-cos(x(2)*x(3))-1/2;
endfunction
function res=F2(x)
  res = x(1)^2-81*(x(2)+0.1)^2+sin(x(3))+1.06;
endfunction
function res=F3(x)
  res = exp(-x(1)*x(2))+20*x(3)+(10*3.1415-3)/3;
endfunction

//Queda este jacobiano(matriz):
//
//     J(x)=   | 3                     x(3)*sin(x(2)*x(3))   x(2)*sin(x(2)*x(3)) |
//             | 2*x(1)                -162*(x(2)+0.1)       cos(x(3))           |
//             | -x(2)*exp(-x(1)*x(2)) -x(2)*exp(-x(1)*x(2)) 20                  |

function res=DF1_x1(x)
  res = 3;
endfunction
function res=DF1_x2(x)
  res = x(3)*sin(x(2)*x(3));
endfunction
function res=DF1_x3(x)
  res = x(2)*sin(x(2)*x(3));
endfunction

function res=DF2_x1(x)
  res = 2*x(1);
endfunction
function res=DF2_x2(x)
  res = -162*(x(2)+0.1);
endfunction
function res=DF2_x3(x)
  res = cos(x(3));
endfunction

function res=DF3_x1(x)
  res = -x(2)*exp(-x(1)*x(2));
endfunction
function res=DF3_x2(x)
  res = -x(2)*exp(-x(1)*x(2));
endfunction
function res=DF3_x3(x)
  res = 20;
endfunction
   
