%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esercizio minimum jerk
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear 
close all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Condizioni iniziali e finali
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xA=0;
tA=0;
xB=67.5; %% [cm]
tB=1.3; %% [s]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% matrice dei coefficienti ridotta
AA=[tB^3 tB^4 tB^5;
    3*tB^2 4*tB^3 5*tB^4;
    6*tB 12*tB^2 20*tB^3];
bb=[xB 0 0]';

a=inv(AA)*bb;

atot=[0 0 0 a'];
indice=length(atot):-1:1;
atot=atot(indice);
%atot=flip(atot);
t=tA:0.001:tB;
x=polyval(atot,t);
atotp=polyder(atot); %coefficienti della derivata prima
xp=polyval(atotp,t); %velocità
atotpp=polyder(atotp); %coefficienti della derivata seconda
xpp=polyval(atotpp,t); %accelerazione
atotppp=polyder(atotpp); %coefficienti della derivata terza
xppp=polyval(atotppp,t); %jerk

load('datiExp.mat');
tin=t_wind(1); %t_wind non parte da 0

figure(1)
subplot(411)
plot(t+tin,x/100,'r','DisplayName','Teorico')
hold on
plot(t_wind,S_wind,'g','DisplayName','Sperimentale')
grid on
ylabel('S [m]')
subplot(412)
plot(t+tin,xp/100,'r','DisplayName','Teorico')
hold on
plot(t_wind,V_wind,'g','DisplayName','Sperimentale')
grid on
ylabel('V [m/s]')
subplot(413)
plot(t+tin,xpp/100,'r','DisplayName','Teorico')
hold on
plot(t_wind,Acc_wind,'g','DisplayName','Sperimentale')
grid on
ylabel('A [m/s^2]')
subplot(414)
plot(t+tin,xppp/100,'r','DisplayName','Teorico')
hold on
plot(t_wind,Jerk_wind,'g','DisplayName','Sperimentale')
grid on
ylabel('Jerk [m/s^2]')
xlabel('Tempo [s]')