clear
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esercizio leg press
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Costanti
gamma=30; %[°]
a=0.45;%[m]
b=0.43;%[m]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input atto di moto considerato
alfa=pi/2; %[rad]
beta=0;
w=-0.5;
wp=-1.2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Velocità
alfap=w;
x0=[a*alfap*sin(alfa);
    -a*alfap*cos(alfa)];
A=[-b*sind(beta) -cosd(gamma);
    b*cosd(beta) -sind(gamma)];
X=inv(A)*x0;
betap=X(1);
dp=X(2);
disp(['La velocità del piede di biella vale: ' num2str(dp) 'm/s^2']);
disp(['La velocità angolare della biella vale: ' num2str(betap) 'rad/s^2']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Accelerazione
alfapp=wp;
x0=[a*alfapp*sin(alfa)+a*alfap^2*cos(alfa)+b*betap^2*cos(beta);
    a*alfapp*cos(alfa)-a*alfap^2*sin(alfa)-b*betap^2*sin(beta)];
A=[-b*sind(beta) -cosd(gamma);
    -b*cosd(beta) sind(gamma)];
X=inv(A)*x0;
betapp=X(1);
dpp=X(2);
disp(['L''accelerazione del piede di biella vale: ' num2str(dpp) 'm/s^2']);
disp(['L''accelerazione angolare della biella vale: ' num2str(betapp) 'rad/s^2']);