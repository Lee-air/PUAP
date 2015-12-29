clear all

A = [-2.98 0.93 0 -0.034; -0.99 -0.21 0.035 -0.0011; 0 0 0 1; 0.39 -5.555 0 -1.89];
B = [-0.032; 0 ; 0 ;-1.6];
C = [0 0 1 0;0 0 0 1];
D = 0;

Q=eye(2)
R=1
N=0


QN = 1; %wartosc ozekiwana w2
RN = [1225 -2135; -2135 3721]; %wartosc oczekiwana v2
NN = 0; %wartsc oczekiwana wv


%funkcja Kalman
[KEST,L,P] = kalman(SYS,RN,QN, NN) %zly system ma byc system obserwatora
[K,S,E] = lqr(A,B,Q,R,N);

%transmitancja obiektu
sys = ss(A, B, C, D);
Gp = tf(sys);
%charakterystyka fazowa obiektu
figure();
nyquist(Gp);

%charakterystyka fazowa obiektu z regulatorem
%Ao = KEST(1).a - L*C - B*K;
Ao = A - L*C - B*K;
Bo = L;
Co = K;

sys = ss(Ao, Bo, Co, 0);
Go = tf(sys);

%rysowanie Nyquist - do analizy 
figure()
for i=0.1:0.1:1
    Gw = i*Gp * Go;
    nyquist(Gw);
    hold on;
end