I=0:0.05:6*2*pi;
x=500+100*real(exp(1i.*I));
y=450+100*imag(exp(1i.*I));
z=linspace(400,900,length(I));


for i=1:length(I)
   [theta1(i), theta2(i),theta3(i),theta4(i),theta5(i),theta6(i)]=invKuka1(x(i),y(i),z(i));
    
end

ttheta1=timeseries(theta1,linspace(1,10,length(I)));
ttheta2=timeseries(theta2,linspace(1,10,length(I)));
ttheta3=timeseries(theta3,linspace(1,10,length(I)));
ttheta4=timeseries(theta4,linspace(1,10,length(I)));
ttheta5=timeseries(theta5,linspace(1,10,length(I)));
ttheta6=timeseries(theta6,linspace(1,10,length(I)));