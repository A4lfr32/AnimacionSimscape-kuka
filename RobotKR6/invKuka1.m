function [theta1,theta2,theta3,theta4,theta5,theta6] = invKuka1(x,y,z)


syms th1 th2 th3 th4 th5 th6
% syms x y z

DH=[0,0,0,th1;-pi/2,260,0,th2;0,680,0,th3;-pi/2,-35,670,th4;-pi/2,0,0,th5;pi/2,0,115,th6];
[As,At]=DHm(DH);
sT01=As(1:4,1:4);
sT12=As(1+4:4+4,1:4);
sT23=As(1+8:4+8,1:4);
sT34=As(1+12:4+12,1:4);
sT45=As(1+16:4+16,1:4);
sT56=As(1+20:4+20,1:4);

T06=trasxyz(x,y,z)*rotx(0)*rotz(0);

%  se toma hasta p4
P04org=T06*[0;0;-115;1];

% Ecuaciones
theta1_1= atan2(P04org(2),P04org(1));
theta1_2 = atan2(-P04org(2),-P04org(1));
theta1=theta1_1;

K=(1/1360)*((P04org(1)/cos(theta1)-260)^2+P04org(3)^2-35^2-670^2-680^2);
A=(670^2+35^2)/K^2;
B=-2*35/K;
C=1-(670/K)^2;

cos3_1=(-B+sqrt(B^2-4*A*C))/(2*A);
cos3_2=(-B-sqrt(B^2-4*A*C))/(2*A);

sin3_1=(-1/(670))*K-35*cos3_1/670;
sin3_2=(-1/(670))*K-35*cos3_2/670;

theta3_1=atan2(sin3_1,cos3_1); 
theta3_2=atan2(sin3_2,cos3_2); 

theta3=theta3_1;

%  theta 2
A2=[35*cos(theta3)-670*cos(theta3),-35*cos(theta3)-670*sin(theta3)+680;35*cos(theta3)+670*sin(theta3)-680,35*sin(theta3)-670*cos(theta3)];
b2=[P04org(1)/cos(theta1)-260;P04org(3)];

sol2=(inv(A2)*b2);
sin2=sol2(1);
cos2=sol2(2);
theta2=atan2(sin2,cos2);


% 
T03=As(1:4,1:4)*As(1+4:4+4,1:4)*As(1+8:4+8,1:4);
th1=theta1;
th2=theta2;
th3=theta3;
T03=double(subs(T03));
P36org=(T03)\T06(:,4);

cos5=(P36org(2)-670)/115;
sin5=(sqrt(1-cos5^2));
theta5=atan2(sin5,cos5);

% 
cos4=(P36org(1)+35)/(115*sin5);

sin4=P36org(3)/(115*sin5);
% cos4=-sqrt(1-sin4^2);
% sin4=sqrt(1-cos4^2);
theta4=atan2(sin4,cos4);
    
% 
Aux=((T03)\T06);
cos6=-Aux(2,1)/sin5;
% sin6=sqrt(1-cos6^2);
sin6=Aux(2,2)/sin5;
% cos6=sqrt(1-sin6^2);
theta6=atan2(sin6,cos6);

% theta5=-2.1851;
% theta5=1.1349;


end

