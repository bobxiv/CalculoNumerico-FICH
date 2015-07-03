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
      return;
    end
  
    x0=x
    k=k+1
  end

x=null;
  
endfunction

function GetData(NumDatos,MatDim, arch)

  //Para evitar warnings sin importancia
  funcprot(0);

    try
	   File = mopen(arch,'wt');
    catch
      error('No se puede abrir el archivo\n');
    end

	for k= 1:NumDatos
 	 printf('---------------------------------------------------------\n');
	 printf('Generando Dato %i\n',k);
	 printf('Obteniendo una matriz Definida Positiva\n');
	 DefPos = 0;
	    while(~DefPos)
            //genero una matriz simetrica
            A= rand(MatDim,MatDim);
            for i= 1:MatDim
            		for j= i:MatDim
              		 A(i,j)=A(j,i);
            		 end
        	   end
            A = A*100;// escalo la matriz, para no tener valores entre 0 y 1
            
            //verifica que sea definida positiva
            try
            	  chol(A);
            	  DefPos = 1;
           	 catch
                continue;
            end
         end
     	 printf('Matriz Definide Positiva obtenida\n');
     	 printf('Resolviendo el sistema\n');
		b= rand(MatDim,1);
        w= 1;// 0<w<2 para que converga con cualquier x0
		x0= zeros(MatDim,1);
        tic();
        for n= 1:100
          res = SOR(A,b,x0,w,10000,10^-15);//res sera null, si la matriz no
                                           //converge con la tolerancia e iteraciones
                                           //esperadas
        end
		ElapsedTime = toc();
        ElapsedTime = ElapsedTime/100;
		if( res == null )
			fprintf(File,'No converge\n');
   	     	  printf('Sistema no converge, con 10000 iteraciones y E-15 tolerancia\n');
		else
			fprintf(File,'Time: %1.20f\n', ElapsedTime);
   	     	  printf('Sistema converge en %1.20f\n segundos\n',ElapsedTime);
		end
		
	end
	
	mclose(File);

endfunction 

function muestras(n, n1, n2)
  arch = 'C:\\Users\\BOB\\Desktop\\Datos'
  for i=1:n
    s = arch + string(i) + '.txt'
    GetData(n1, n2, s)
  end
endfunction

