%Wstepne czyszczenie%
clear all;
close all;
clc;

%Wybor problemu, oraz wczytanie wszystkich danych potrzebnych do symulacji%
%oraz analizy%
m = input('Enter a number from 1 to 5 to select a problem: ');
switch m
    case 1
        A = [-2.98 0.93 0 -0.034 ; -0.99 -0.21 0.035 -0.0011 ; 0 0 0 1 ; 0.39 -5.555 0 -1.89];
        B = [-0.032 ; 0 ; 0 ; -1.6];
        C = [0 0 1 0 ; 0 0 0 1];
        D = [0 ; 0];
        
        Q=eye(4);
        R=1;
        
        BB=eye(4);
        
        QN = eye(2); 
        RN = eye(2);
        
        Initial_conditions = [-1 1 0.5 -0.5];
        
        disp('Problem AC17');
    case 2
        A = [-0.0649 0.0787 0.1705 -0.5616 ; 0.0386 -0.939 4.2277 0.0198 ; 0.1121 -0.4254 -0.7968 0 ; 0 0 1 0];
        B = [-0.9454 0.5313 ; -8.6476 -10.769 ; 19.0824 -2.8959 ; 0 0];
        C = [1 0 0 0 ; 0 0 0 1];
        D = [0 0 ; 0 0];
        
        Q=eye(4);
        R = diag([1 1]);
        
        BB=eye(4);
        
        QN = eye(2); 
        RN = eye(2);

        Initial_conditions = [-1 1 0.5 -0.5];
        
        disp('Problem HE2');
    case 3
        A = [1.38 -0.2077 6.715 -5.676 ; -0.5814 -4.29 0 0.675 ; 1.067 4.273 -6.654 5.893 ; 0.048 4.273 1.343 -2.104];
        B = [0 0 ; 5.679 0 ; 1.136 -3.146 ; 1.136 0];
        C = [1 0 1 -1 ; 0 1 0 0 ; 0 0 1 -1];
        D = [0 0 ; 0 0 ; 0 0];
        
        Q=eye(4);
        R = diag([1 1]);
        
        BB=eye(4);
        
        QN = eye(2); 
        RN = eye(3);

        Initial_conditions = [-1 1 0.5 -0.5];
        
        disp('Problem REA1');
    case 4
        A = [-4 2 1 ; 3 -2 5 ; -7 0 3];
        B = [1 0 ; 1 0 ; 0 1];
        C = [0 1 0 ; 0 0 1];
        D = [0 0 ; 0 0];
        
        Q=eye(3);
        R = diag([1 1]);
        
        BB=eye(3);
        
        QN = eye(2); 
        RN = eye(2);

        Initial_conditions = [1 -1 0.5];
        
        disp('Problem DIS2');
    case 5
        A = [0 0 1 0 0 ; 0 -0.154 -0.0042 1.54 0 ; 0 0.249 -1 -5.2 0 ; 0.0386 -0.996 -0.0003 -0.117 0 ; 0 0.5 0 0 -0.5];
        B = [0 0 ; -0.744 -0.032 ; 0.337 -1.12 ; 0.02 0 ; 0 0];
        C = [0 1 0 0 -1 ; 0 0 1 0 0 ; 0 0 0 1 0 ; 1 0 0 0 0];
        D = [0 0 ; 0 0 ; 0 0 ; 0 0];
        
        Q=eye(5);
        R = diag([1 1]);
        
        BB=eye(5);
        
        QN = eye(2); 
        RN = eye(4);
        
        Initial_conditions = [-1 1 0.5 -0.5 1];
        
        disp('Problem AC17');
    otherwise
        disp('Wrong value. Program will end now.')
end

m = input('Enter a number from 1 to 3 to select noise gain: ');
switch m
    case 1
        Noise_Gain = 0.25;
        disp('Noise gain = 0.25');
    case 2
        Noise_Gain = 1;
        disp('Noise gain = 1');
    case 3
        Noise_Gain = 2;
        disp('Noise gain = 2');
    otherwise
        disp('Wrong value. Program will end now.')
end
