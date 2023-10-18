clc 
clear all;
close all;

a = 3;
b = 3;
c = 2;
Ini = [1.2; 1.2; 1.2];
sim('PortOperationModel.slx');
figure(1);
subplot(3,1,1);
plot(tout,x,'r');
xlabel('t');
ylabel('x');

subplot(3,1,2);
plot(tout,y,'b');
xlabel('t');
ylabel('y');

subplot(3,1,3);
plot(tout,z,'g');
xlabel('t');
ylabel('z');

figure(2);
plot3(x,y,z);  
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');

