clc;
clear all;
close all;
syms ti

% syms k h1 h2 a b c alpha beta sigma theta rho

% [, (4*a*k-theta-rho)*b-a*alpha == 0, ];

% sola = solve(4*k*a^2-(2*theta+rho)*a-h1 == 0,a);
% a = sola(2,1)
% solb = solve((4*a*k-theta-rho)*b-a*alpha == 0,b);
% b = solb
% solc = solve(k*b^2-(alpha*b)/2-rho*c+sigma^2*a+alpha^2/(4*beta) == 0,c);
% c = solc

% sola = solve(4*k*a^2-rho*a-h2 == 0,a);
% a = sola(1,1)
% solb = solve((4*a*k-rho)*b-a*alpha == 0,b);
% b = solb
% solc = solve(k*b^2-(alpha*b)/2-rho*c+sigma^2*a+alpha^2/(4*beta) == 0,c);
% c = solc

x0 = 10;
rho = 0.01;
r = 2;
alpha_t = 10;
beta_t = 0.1;
theta = 0.01;
h1 = 2;
h2 = 3;
E(1,1) = 0;
t = 0:0.01:10;
t = t';

sim('SML_HJB_Inventory.slx');
% E = exp(-t(1,1)*rho)*(p(1,1)*(alpha_t-beta_t*p(1,1))-r*u(1,1)-h(1,1));
% Profit = int(E(ti),ti,[0 10]);
% E = vpa(Profit(length(P rofit),1));
% for i=1:length(u)
%     E = E+exp(-ti.*rho)*(p.*(alpha_t-beta_t*p)-r*u.^2-h);
% end

% for i = 1:length(t)-1 
%     tmpE = int(exp(-ti*rho)*(p(i+1,1)*(alpha_t-beta_t*p(i+1,1))-r*u(i+1,1)^2-h(i+1,1)),ti,[t(i,1) t(i+1,1)]);
%     E(i,1) = vpa(tmpE);
% end

% Es = int(exp(-ti*rho)*(ps(length(t),1)*(alpha_t-beta_t*ps(length(t),1))-r*us(length(t),1)^2-hs(length(t),1)),ti,[0 10]);
% Ed = int(exp(-ti*rho)*(pd(length(t),1)*(alpha_t-beta_t*pd(length(t),1))-r*ud(length(t),1)^2-hd(length(t),1)),ti,[0 10]);

% for i = 1:length(t)-1
%     E(i+1,1) = E(i,1) + exp(-t(i+1,1)*rho)*(p(i+1,1)*(alpha_t-beta_t*p(i+1,1))-r*u(i+1,1)^2-h(i+1,1))*0.01;
% end
% for i = 1:length(t)
%     Es(i,1) = exp(-t(i,1)*rho)*(ps(i,1)*(alpha_t-beta_t*ps(i,1))-r*us(i,1)^2-hs(i,1));
% end
% for i = 1:length(t)
%     Ed(i,1) = exp(-t(i,1)*rho)*(pd(i,1)*(alpha_t-beta_t*pd(i,1))-r*ud(i,1)^2-hd(i,1));
% end



figure(1)
plot(t,x,t,xs,'--',t,xd,':k');
xlabel('Time (s)');
ylabel('The inventory level');
legend('x^*','x_s^*','x_d^*'); 

figure(2)
plot(t,u,t,us,'--',t,ud,':k'); 
xlabel('Time (s)');
ylabel('The production rate');
legend({'u^*','u_s^*','u_d^*'},'Location','northwest');

figure(3)
plot(t,p,t,ps,'--',t,pd,':k');
xlabel('Time (s)');
ylabel('The price');
legend({'p^*','p_s^*','p_d^*'},'Location','northwest');

figure(4)
subplot(3,1,1);
plot(t,E);
xlabel('Time (s)');
ylabel('The profit E^*');

subplot(3,1,2);
plot(t,Es);
xlabel('Time (s)');
ylabel('The profit E_s');

subplot(3,1,3);
plot(t,Ed);
xlabel('Time (s)');
ylabel('The profit E_d');


