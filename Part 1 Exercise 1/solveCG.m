function [x,error]= solveCG(A,b,varargin)
%conjugate gradient algorithm
% x is an approximat solution
x=rand(length(A),1);
r=b-A*x;
d=r;
epsilon=1e-10;
iteration=0;
if nargin==3
    while norm(r)>epsilon
        a=r'*r/(d'*A*d);
        x=x+a*d;
        temp_r=r;
        r=r-a*A*d;
        beta=r'*r/(temp_r'*temp_r);
        d=r+beta*d;
        iteration=iteration+1;
        error(iteration)=norm(varargin{1}-x);
    end
else
    while norm(r)>epsilon
        a=r'*r/(d'*A*d);
        x=x+a*d;
        temp_r=r;
        r=r-a*A*d;
        beta=r'*r/(temp_r'*temp_r);
        d=r+beta*d;
        iteration=iteration+1;
    end
end
end

