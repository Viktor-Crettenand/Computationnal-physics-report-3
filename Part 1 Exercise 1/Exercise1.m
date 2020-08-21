clear all
close all
path='C:\Users\Viktor\Desktop\EPFL\Troisi?me ann?e\Semestre 2\Computationnal physics III\Third report\Week 10-11\Exercise1\images and figures\';
path='Z:\Third report\Third report\Week 10-11\Exercise1\images and figures\';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%point 1
N=3;
b=[1;2;0;...
    2;1;1;...
    0;1;0];
A=puzzleA(N);
x=A\b;
matrixform(x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%point 2
%f'(x)=Ax?b=?r
%x is the solution of Ax = b then f'(x) (minimum)if A is symmetric positiv definite
%test of functions:
A=[3,2;2,6];
b=[2;-8];
solveSD(A,b);
solveCG(A,b);
% results should be [2,-2] (example from course)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%part 3
N=10;
board1=[3,5,9,4,5,1,2,3,3,4;3,10,6,11,6,4,4,4,7,5;4,6,10,6,9,9,5,4,4,8;5,6,2,5,8,6,7,2,5,7;...
    6,9,8,5,6,9,4,2,3,6;8,11,6,8,7,6,5,6,2,3;8,8,9,6,6,5,6,8,4,2;7,9,6,5,4,4,4,8,5,4;...
    7,8,6,6,4,4,5,8,5,9;4,5,6,4,3,4,3,3,7,7];
board1=board1';
board2=[2,7,8,6,5,3,7,7,5,2;4,8,12,8,6,5,8,10,5,3;1,7,6,7,4,6,8,10,4,2;3,5,3,2,5,5,11,9,7,4;...
    7,7,7,4,9,7,10,11,7,8;8,9,5,12,7,10,8,3,7,6;6,7,7,7,11,8,8,6,4,8;5,2,4,6,4,5,5,0,6,5;...
    2,4,2,4,4,4,4,5,4,6;3,2,2,1,2,4,6,5,6,3];
board2=board2';
A=puzzleA(N);
%---------------with solveSD: takes 11.509 s to solve both
x_1_SD_=solveSD(A*A,A*board1(:));
x_1_SD=matrixform(x_1_SD_);
figure
heatmap(round(x_1_SD));
set(gca,'FontSize',14)
%saveas(gcf,strcat(path,'heatmapboard1SD'),'png');

x_2_SD_=solveSD(A*A,A*board2(:));
x_2_SD=matrixform(x_2_SD_);
figure
heatmap(round(x_2_SD,1));
set(gca,'FontSize',14)
%saveas(gcf,strcat(path,'heatmapboard2SD'),'png');

%-----------------------
% x_1_SD=matrixform(solveSD(A,board1(:)));
% x_2_SD=matrixform(solveSD(A,board2(:)));
%---------------with solveCG: takes 0.013 s to solve both
x_1_CG_=solveCG(A*A,A*board1(:));
x_1_CG=matrixform(x_1_CG_);
figure
heatmap(round(x_1_CG));
set(gca,'FontSize',14)
%saveas(gcf,strcat(path,'heatmapboard1CG'),'png');

x_2_CG_=solveCG(A*A,A*board2(:));
x_2_CG=matrixform(x_2_CG_);
figure
heatmap(round(x_2_CG,1));
set(gca,'FontSize',14)
%saveas(gcf,strcat(path,'heatmapboard2CG'),'png');
%-----------------------
% x_1_CG=matrixform(solveCG(A,board1(:)));
% x_2_CG=matrixform(solveCG(A,board2(:)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%part 4
[~,error_x_1_SD]=solveSD(A*A,A*board1(:),x_1_SD_);
figure
semilogy(100:length(error_x_1_SD),error_x_1_SD(100:end))
ylabel('error','Interpreter','latex','FontSize',18);
xlabel('number of iterations','Interpreter','latex','FontSize',18);
set(gca,'FontSize',14)
%saveas(gcf,strcat(path,'errorinterationboard1SD'),'png');

[~,error_x_2_SD]=solveSD(A*A,A*board2(:),x_2_SD_);
figure
semilogy(100:length(error_x_2_SD),error_x_2_SD(100:end))
ylabel('error','Interpreter','latex','FontSize',18);
xlabel('number of iterations','Interpreter','latex','FontSize',18);
set(gca,'FontSize',14)
%saveas(gcf,strcat(path,'errorinterationboard2SD'),'png');

[~,error_x_1_CG]=solveCG(A*A,A*board1(:),x_1_CG_);
figure
semilogy(1:length(error_x_1_CG),error_x_1_CG)
ylabel('error','Interpreter','latex','FontSize',18);
xlabel('number of iterations','Interpreter','latex','FontSize',18);
set(gca,'FontSize',14)
%saveas(gcf,strcat(path,'errorinterationboard1CG'),'png');

[~,error_x_2_CG]=solveCG(A*A,A*board2(:),x_2_CG_);
figure
semilogy(1:length(error_x_2_CG),error_x_2_CG)
ylabel('error','Interpreter','latex','FontSize',18);
xlabel('number of iterations','Interpreter','latex','FontSize',18);
set(gca,'FontSize',14)
%saveas(gcf,strcat(path,'errorinterationboard2CG'),'png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%questions:
%- how to plot solutions like in the exercise sheet?
%- why are neither of the two solutions whole valued for board2?
%- Explain the purpose of this replacement: shouldn't change the result.
%seems to avoid division by zero in the solveSD function. The other
%function doesn't need the replacement