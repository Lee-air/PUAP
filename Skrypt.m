%Zaladowanie danych poszczegolnych problemow do analizy%
Problems;

%Synteza regulatora LQ%
SYS = ss(A, B, C, D);
Gp=tf(SYS);
[K,S,E] = lqr(SYS,Q,R);

%Rysowanie charakterystyki amplitudowo-fazowej obiektu%
figure(1);
nyquist(Gp);
title('Charakterystyka amplitudowo-fazowa obiektu');

%Synteza filtru Kalmana%
sys=ss(A,[B Disturbance_Gain*BB],C,0);
[est,L,P]=kalman(sys,QN,RN);

%Synteza regulatora LQG%
RSYS=reg(SYS,K,L);
Gr=tf(RSYS);

%Rysowanie charakterystyki amplitudowo-fazowej ukladu%
figure(2);
Gw = Gp * Gr;
nyquist(Gw);
title('Charakterystyka amplitudowo-fazowa ukladu');

%Uruchomienie symulacji%
sim('LQG_Regulator');

%Koncowe czyszczenie ekranu%
clc;