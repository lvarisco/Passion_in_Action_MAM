clear
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esercizio asta appoggiata
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Costanti
alfa=0;
beta=(180-45)/180*pi; % [rad]
c=0.7;% [m]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input atto di moto considerato
gamma=(180-30)/180*pi;
vA=5; % [m/s]
aA=0.3; % [m/s^2]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Posizione
x0=[c 0];
F=@(x) [x(1)*cos(alfa)+c*cos(gamma)-x(2)*cos(beta);
        x(1)*sin(alfa)+c*sin(gamma)-x(2)*sin(beta)];
sol=fsolve(F,x0);
a=sol(1);
b=sol(2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Velocità
ap=vA;
AA=[cos(beta) c*sin(gamma);
    sin(beta) -c*cos(gamma)];
BB=[ap*cos(alfa);
    ap*sin(alfa)];
xp=inv(AA)*BB;
bp=xp(1);
gammap=xp(2);

disp(['La velocità del punto B vale: ' num2str(bp) 'm/s']);
disp(['La velocità angolare dell''asta vale: ' num2str(gammap) 'rad/s']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Accelerazione
app=aA;
AA=[cos(beta) c*sin(gamma);
    sin(beta) -c*cos(gamma)];
BBp=[app*cos(alfa)-gammap^2*c*cos(gamma);
    app*sin(alfa)-gammap^2*c*sin(gamma)];
xpp=inv(AA)*BBp;
bpp=xpp(1);
gammapp=xpp(2);

disp(['L''accelerazione del punto B vale: ' num2str(bpp) 'm/s^2']);
disp(['L''accelerazione angolare dell'' asta vale: ' num2str(gammapp) 'rad/s^2']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Legge di moto (acc di A costante)
dt=0.001; %s
tmax=0.08;
tempo=0:dt:tmax;
vAtime=vA+aA*tempo;
sAtime=a+vA*tempo+0.5*aA*tempo.^2; %N.B.: il tempo è un vettore

% Inizializzo variabili
btime=zeros(size(tempo));
gammatime=zeros(size(tempo));
bptime=zeros(size(tempo));
gammapptime=zeros(size(tempo));
bpptime=zeros(size(tempo));
gammapptime=zeros(size(tempo));

% Aassegno istante t=0
btime(1)=b;
gammatime(1)=gamma;
bptime(1)=bp;
gammaptime(1)=gammap;
bpptime(1)=bpp;
gammapptime(1)=gammapp;
