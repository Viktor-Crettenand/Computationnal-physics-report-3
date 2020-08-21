function xinmatrixform = matrixform(x)
%puts vector x in matrix form to better see the solution to the puzzle
N=sqrt(length(x));
xinmatixform=zeros(N);
for i=1:N
xinmatrixform(i,:)=x((i-1)*N+1:i*N);
end
end

