function x = start_cond(N)
%UNTITLED3 construction of starting condition for minimum of energy
x=zeros(2*N,1);
if N<10 && N>5
    theta=2*pi/(N-1);
elseif N==10
    theta=2*pi/7;
else
    theta=2*pi/N;
end

for i=1:N
    if (i<N && N<10) || N<6
        [x_,y_] = pol2cart(0.1+theta*(i-1),1+0.1*(rand-0.5));
        x((i-1)*2+1)=x_;
        x(i*2)=y_;
    elseif i==N && N<10
        [x_,y_] = pol2cart(2*pi*rand,0.1*rand);
        x((i-1)*2+1)=x_;
        x(i*2)=y_;
    elseif N==10
        if i<N-2
            [x_,y_] = pol2cart(0.1+theta*(i-1),1+0.1*(rand-0.5));
        else
            [x_,y_] = pol2cart(0.5+2*pi/3*(i-1),0.5+0.1*(rand-0.5));
        end
        x((i-1)*2+1)=x_;
        x(i*2)=y_;
    end
end
end

