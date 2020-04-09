function [A1,A2] = DHm(A)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
A1=[];
A2=eye(4);
for i=1:size(A,1)
    Aux=rotx(A(i,1))*trasxyz(A(i,2),0,0)*(trasxyz(0,0,A(i,3))*rotz(A(i,4)));
    A1=[A1;Aux];
    A2=A2*Aux;
end

end