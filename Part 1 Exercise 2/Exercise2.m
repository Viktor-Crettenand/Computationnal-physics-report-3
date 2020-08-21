close all
clear all
%path='C:\Users\vcretten\Desktop\Week 10-11\Exercise 2\figures\';
path='Z:\Third report\Third report\Week 10-11\Exercise 2\figures\';

% x_N{2}=[-0.309144286317686;-0.548889855279890;0.309144286317686;0.548889855279890];
% x_N{3}=[-0.810248259809932;-0.191987061604653;0.238858457348450;0.797689107173242;0.571389802462267;-0.605702045564737];
% x_N{4}=[0.874761694450291;0.453859092507843;-0.453859092506224;0.874761694454686;0.453859092513366;-0.874761694470947;-0.874761694462431;-0.453859092504843];



for N=1:10
x=sym('x',[2,N]);
Eharm=0;
Ecoul=0;
for j=1:N
    Eharm=Eharm+x(:,j)'*x(:,j);
    for i=1:N
        if i<j
            Ecoul=Ecoul+1/norm(x(:,i)-x(:,j));
        end
    end
end
x=x(:);
E=Ecoul+Eharm;
[E_min(N),coord{N}] = solvenonlinCG(E,x,start_cond(N))
%coord{N}=start_cond(N)
end



for M=1:10
    for i=1:M
        x_coord(i)=coord{M}((i-1)*2+1);
        y_coord(i)=coord{M}(i*2);
    end
    figure
    plot(x_coord,y_coord,'*k')
    title(strcat('title ',num2str(M)))
    ylabel('$x\mathrm{[a.u.]}$','Interpreter','latex','FontSize',18);
    xlabel('$y\mathrm{[a.u.]}$','Interpreter','latex','FontSize',18);
    xlim([-2,2])
    ylim([-2,2])
    legend(strcat('$E_{min}=$',num2str(round(E_min(M),2)),'$\mathrm{[a.u.]}$'),'Interpreter','latex','Location','best')
    set(gca,'FontSize',14)
    %saveas(gcf,strcat(path,'rep_min_ener_coord_N=',num2str(M)),'png');
end



