clc;
clear;
close all;

La = 2.3;       % H
Ra = 0.9;       % Ohm
J  = 2.3e-3;    % kg.m²
b  = 5.29e-3;   % N.m.s/rad
Jl = 0.0479958; % kg.m²
bl = 0.0529;    % N.m.s/rad
Ke = 0.011446;  % V.s/rad
Kt = 0.3913;    % N.m/A
Jeq = J+Jl;
Beq = b+bl;

%%
% G  = tf(Kt,[La*Jeq, La*Beq+Ra*Jeq, Ra*Beq+Kt*Ke])       % w(s)/Vt(s)
% 
% Gd = tf(-[La,Ra],[La*Jeq, La*Beq+Ra*Jeq, Ra*Beq+Kt*Ke]) % w(s)/Tl(s)
% 
% figure;
% t=linspace(0,15,1001);
% % aplicada entrada degrau nas duas FT
% y = step(G,t); yd = step(Gd,t);
% plot(t,y, 'LineWidth',2); hold on;
% plot(t,yd,'LineWidth',2);
% % config. plot
% xlim([0,15]); grid on; set(gca,'GridLineStyle','--')
% legend({'$\omega(s)/V_t(s)$','$\omega(s)/\tau_L(s)$'},...
%     'Interpreter','latex','Location','east');
%%
% % matrizes
%A = [-Ra/La, -Ke/La; Kt/Jeq, -Beq/Jeq];
%B = [1/La; 0];
%C = [0, 1];
% sistema em espaço de estados
% sys = ss(A,B,C,0)
% 
% % polos
% pol = pole(sys)
% % zeros
% zer = zero(sys)
% 
% Mc = [B, A*B] % matriz de controlabilidade
% 
% dMc = det(Mc) % diferente de 0
% 
%Mo = [C; C*A]  % matriz de observabilidade
% 
% dMo = det(Mo)  % diferente de 0
% 
% alf = A^2 + 5*A + 6.25*eye(2)
% 
% K = [0,1]/Mc*alf
% 
% sys_mf = ss(A-B*K, B, C, 0); % malha fechada
% % simula a resposta ao degrau
% figure;
% t = linspace(0, 5, 1001);
% y_mf = step(sys_mf, t);
% plot(t,y_mf,'LineWidth',2); 
% grid on; set(gca,'GridLineStyle','--');
% xlabel('tempo (s)'); ylabel('\omega (rad/s)');

%%
% 
% alf = A^2 + 40*A + 400*eye(2)
% 
% L = alf/Mo*[0;1]