clear all, close all
%path='Z:\Third report\Third report\Week 12-13\Exercise3\figures\';
%filename = 'Z:\Third report\Third report\Week 12-13\Exercise3\wavefunctions\values_u.csv';
filename='P:\EPFL\Troisième année\Semestre 2\Computationnal physics III\Third report\Rendu\Part 2 Exercise 3\wavefunctions\values_u.csv';
values=load(filename);

Q=cell([36,1]);
equ4=zeros(36,1);

for i=1:36
Q{i}=load(strcat('P:\EPFL\Troisième année\Semestre 2\Computationnal physics III\Third report\Rendu\Part 2 Exercise 3\wavefunctions\wavefunctions_',num2str(i),'.csv'));

n=128;
O=cell([n,1]);
S=cell([n,1]);
equ7=zeros(n,1);

for k=1:n
O{k}=[Q{i}(:,k),Q{i}(:,k+n)];
[S{k},~,~]=svd(O{k});
p=S{k}'*Q{i};
equ7(k)=(p(1,k)*p(2,k+n)-p(1,k+n)*p(2,k))^2;
end

equ4(i)=mean(equ7);
end

plot(values,equ4,'.')
ylabel('$<$double occupency$>\mathrm{[\,]}$','Interpreter','latex','FontSize',18);
xlabel('U/t$\mathrm{[\,]}$','Interpreter','latex','FontSize',18);
set(gca,'FontSize',14)
%saveas(gcf,strcat(path,'doubleoccupencyexpectationvalue'),'png');