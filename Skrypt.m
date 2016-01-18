clear all

A = [-2.98 0.93 0 -0.034; -0.99 -0.21 0.035 -0.0011; 0 0 0 1; 0.39 -5.555 0 -1.89];
B = [-0.032; 0 ; 0 ;-1.6];
G = zeros(4,1);
C = [0 0 1 0;0 0 0 1];
D = [0;0];
H = [0;0];

Q=eye(4);
R=1;
N=0;
BB=eye(4);
% SYS=ss(A,[B G],C,[D H]);
sys=ss(A,[B BB],C,0);
QN = eye(2); %wartosc ozekiwana w2
RN = eye(2);
% RN = [1225 -2135 ; -2135 3721]; %wartosc oczekiwana v2
% NN = 0; %wartsc oczekiwana wv
[est,L,P]=kalman(sys,QN,RN);
SYS = ss(A, B, C, D);
%funkcja Kalman i lqr
% [KEST,L,P] = kalman(SYS,QN,RN);
[K,S,E] = lqr(A,B,Q,R,N);
RSYS=reg(SYS,K,L);
% %transmitancja obiektu
% sys = ss(A, B, C, D);
% Gp = tf(sys);
% %charakterystyka fazowa obiektu
% figure();
% nyquist(Gp);
% 
% % %charakterystyka fazowa obiektu z regulatorem
% % %Ao = KEST(1).a - L*C - B*K;
% % Ao = A - L*C - B*K;
% % Bo = L;
% % Co = K;
% % 
% % sys = ss(Ao, Bo, Co, 0);
% % Go = tf(sys);
% 
% %rysowanie Nyquist - do analizy 
% figure()
% for i=0.1:0.1:1
%     Gw = i*Gp * Go;
%     nyquist(Gw);
%     hold on;
% end