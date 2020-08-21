function [x,error] = solveSD(A,b,varargin)
%Steepest descent algorithm
% x is an approximat solution
x=rand(length(A),1);
r=b-A*x;
epsilon=1e-10;
iteration=0;
if nargin==3
    while norm(r)>epsilon
        a=r'*r/(r'*A*r);
        x=x+a*r;
        r=b-A*x; 
        iteration=iteration+1;
        error(iteration)=norm(varargin{1}-x);
    end
else
    while norm(r)>epsilon
        a=r'*r/(r'*A*r);
        x=x+a*r;
        r=b-A*x;
        iteration=iteration+1;
    end  
    
end

end

% kappa=max(eig(A*A))/min(eig(A*A));
% 
% round((kappa-1)/(kappa+1),10)

