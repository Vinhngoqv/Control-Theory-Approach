clc
clear all;
close all;

% Parameter
t = 10;         %Time for operation controller
a = 3;
b = 3;
c = 2; 
Ini = [1.2; 1.2; 1.2];
pert_a = 0.05; %0.1*sin(2*t);
pert_b = 0.1; %0.2*cos(5*t);    
pert_c = 0.1; %0.2*sin(2*t);
delta_1 = 0.1; %0.15*sin(0.5*t);   
delta_2 = 0.02; %0.2*cos(7*t); 
delta_3 = 0.2; %0.3*sin(3*t);
theta_1 = 0.1;
theta_2 = 0.2;
theta_3 = 0.2;  
p_1 = 0.1;
p_2 = 0.2;
p_3 = 0.3;
k1 = 90;
k2 = 150;
k3 = 80;
lamda1 = 0.5;
lamda2 = 0.5;
lamda3 = 0.5;
gamma1 = 0.1;        
gamma2 = 0.05; 
gamma3 = 0.05; 
alpha1 = 0.025;
alpha2 = 0.025; 
alpha3 = 0.025;

sim('SMCLotkaVolterraModel.slx');
figure(1);
subplot(3,1,1);
plot(tout(1:2001,1),xd,'r');
% yline(1.2,'r');
hold on;
plot(tout(1:2001,1),x,'--r');
xlabel('t');
ylabel('x');

subplot(3,1,2);
plot(tout(1:2001,1),yd,'b');
% yline(1.15,'b');
hold on;
plot(tout(1:2001,1),y,'--b');
xlabel('t');
ylabel('y');

subplot(3,1,3);
plot(tout(1:2001,1),zd,'g');
% yline(1.4,'g');
hold on;
plot(tout(1:2001,1),z,'--g');
xlabel('t');
ylabel('z');
saveas(gcf,'plot\Synchronization.png');

figure(2);
plot3(x,y,z);  
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');

figure(3);
subplot(1,3,1);
plot(tout(1000:2001,1),e1(1000:2001,1),'--r');
xlabel('t');
ylabel('error(x)');

subplot(1,3,2);
plot(tout(1000:2001,1),e2(1000:2001,1),'--b');
xlabel('t');
ylabel('error(y)');

subplot(1,3,3);
plot(tout(1000:2001,1),e3(1000:2001,1),'--g');
xlabel('t');
ylabel('error(z)');
saveas(gcf,'plot\Error.png');
% figure(4);
% subplot(3,1,1);
% plot(tout(1:2001,1),xd,'r');
% hold on;
% % plot(tout(1:2001,1),x,'--r');
% xlabel('t');
% ylabel('x');
% 
% subplot(3,1,2);
% plot(tout(1:2001,1),yd,'b');
% hold on;
% % plot(tout(1:2001,1),y,'--b');
% xlabel('t');
% ylabel('y');
% 
% subplot(3,1,3);
% plot(tout(1:2001,1),zd,'g');
% hold on;
% % plot(tout(1:2001,1),z,'--g');
% xlabel('t');
% ylabel('z');
% saveas(gcf,'plot\PortOperationModel.png');
% 
% figure(5);
% plot3(xd,yd,zd);  
% xlabel('x(t)');
% ylabel('y(t)');
% zlabel('z(t)');
% saveas(gcf,'plot\PortOperationModel3d.png');