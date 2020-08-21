function A = puzzleA(N)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%creation of T-------------
T=eye(N);
for i=1:N
    if i+1<=N
    T(i,i+1)=1;
    end
    if i-1>0
    T(i,i-1)=1;
    end
end
%--------------------------
A=kron(T,eye(N))+kron(eye(N),T)-kron(eye(N),eye(N));
end

