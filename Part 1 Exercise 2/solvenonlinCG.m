function [E_min,x_] = solvenonlinCG(f0,x,varargin)
%nonlinear conjugate gradient algorithm
% x is an approximat solution
f1=gradient(f0,x);
f2=hessian(f0,x);
f0=matlabFunction(f0,'Vars',{x}); %-> qqch=f0(x)
f1=matlabFunction(f1,'Vars',{x});
f2=matlabFunction(f2,'Vars',{x});
if nargin>2
    x_=varargin{1};
else
x_=2*(rand(length(x),1)-0.5);
end
r=-f1(x_);
d=r;
a=100000;
epsilon=1e-12;
epsilonstar=1e-14;
    while norm(r)>epsilon
        %a=-double(subs(f1'*d,x,x_))/double(subs(d'*f2*d,x,x_));
        a=-f1(x_)'*d/(d'*f2(x_)*d);
        while norm(a*d)>epsilonstar
            %     a=-double(subs(f1,x,x_))'*d/(d'*double(subs(f2,x,x_))*d);
                a=-f1(x_)'*d/(d'*f2(x_)*d); %evaluates hessian and gradiant in the direction of d but doesn't seems
                %faster!!! actually it is a little bit faster
                x_=x_+a*d;
        end
        temp_r=r;
        r=-f1(x_);
        beta=r'*r/(temp_r'*temp_r);
        d=r+beta*d;
            
    end
    E_min=f0(x_);

end
