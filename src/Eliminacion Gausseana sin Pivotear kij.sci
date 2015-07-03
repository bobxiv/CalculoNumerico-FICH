//Eliminacion Gaussiana sin Pivoteo
//Recorrido kij
//Entra:  A: Matriz aumenada
//        n: Dimension de matriz A sin aumentar
//Sale:
//        x: vector columna de soluciones
function x=Reskij(A,n)
for k= 1:(n-1)
	for i= (k+1):n
	m = A(i,k)/A(k,k)
	A(i,k)=0
		for j = (k+1):(n+1)
		A(i,j)=A(i,j)-m*A(k,j)
		end
	end
end

//Retrosustitucion
x(n)=A(n,n+1)/A(n,n)
for i= (n-1):-1: 1
tmp=0
    for j= (i+1): n
    tmp= tmp + A(i,j)*x(j)
    end
x(i)=(A(i,n+1)-tmp)/A(i,i)    
end
endfunction

