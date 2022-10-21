clear
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esercizio asta appoggiata
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Costanti
alfa=0;
beta=(180-45)/180*pi; % [rad]
c=0.7;% [m]

%% Input atto di moto considerato
gamma=(180-30)/180*pi;
vA=5; % [m/s]
aA=0.3; % [m/s^2]

%% Posizione
x0=[c 0];
F=@(x) [x(1)*cos(alfa)+c*cos(gamma)-x(2)*cos(beta);
        x(1)*sin(alfa)+c*sin(gamma)-x(2)*sin(beta)];
sol=fsolve(F,x0);
a=sol(1);
b=sol(2);

%% Velocità
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

%% Accelerazione
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

%% Legge di moto (acc di A costante)
dt=0.001; %s
tmax=0.08;
tempo=0:dt:tmax;
vAtime=vA+aA*tempo;
sAtime=a+vA*tempo+0.5*aA*tempo.^2; %N.B.: il tempo è un vettore

%% Inizializzo variabili
btime=zeros(size(tempo));
gammatime=zeros(size(tempo));
bptime=zeros(size(tempo));
gammapptime=zeros(size(tempo));
bpptime=zeros(size(tempo));
gammapptime=zeros(size(tempo));

%% Aassegno istante t=0
btime(1)=b;
gammatime(1)=gamma;
bptime(1)=bp;
gammaptime(1)=gammap;
bpptime(1)=bpp;
gammapptime(1)=gammapp;

%% ciclo legge di moto (dal secondo istante temporale)
%%% a(t) (INPUT) - alfa costante
%%% b(t)         - beta costante
%%% c costante   - gamma (t)

for kk=2:length(tempo)
    % Posizione
    x0=[gammatime(kk-1) btime(kk-1)];
    F=@(x) [sAtime(kk)*cos(alfa)+c*cos(x(1))-x(2)*cos(beta);
        sAtime(kk)*sin(alfa)+c*sin(x(1))-x(2)*sin(beta)];
    sol=fsolve(F,x0);
    gammatime(kk)=sol(1);
    btime(kk)=sol(2);

    % Velocità
    ap=vAtime(kk);
    AA=[cos(beta) c*sin(gammatime(kk));
        sin(beta) -c*cos(gammatime(kk))];
    BB=[ap*cos(alfa);
        ap*sin(alfa)];
    xp=inv(AA)*BB;
    bptime(kk)=xp(1);
    gammaptime(kk)=xp(2);

    % Accelerazione
    app=aA;
    AA=[cos(beta) c*sin(gamma);
        sin(beta) -c*cos(gamma)];
    BBp=[app*cos(alfa)-gammaptime(kk)^2*c*cos(gammatime(kk));
        app*sin(alfa)-gammaptime(kk)^2*c*sin(gammatime(kk))];
    xpp=inv(AA)*BBp;
    bpptime(kk)=xpp(1);
    gammapptime(kk)=xpp(2);
end

%% rappresentazione temporale delle storie temporale
figure
subplot(321)
plot(tempo, btime)
grid on
title('Punto B')
ylabel('Spostamento  b [m]')
subplot(322)
plot(tempo, gammatime*180/pi)
grid on
title('Asta')
ylabel('\gamma [°]')
%% velocità
subplot(323)
hh=plot(tempo, bptime)
grid on
ylabel('v_b [m/s]')
subplot(324)
plot(tempo, gammaptime)
grid on
ylabel('$\dot{\gamma}$ [rad/s]','Interpreter','latex')
%% accelerazione
subplot(325)
plot(tempo, bpptime)
grid on
ylabel('v_b [m/s]')
xlabel('Tempo [s]')
subplot(326)
plot(tempo, gammapptime)
grid on
ylabel('$\ddot{\gamma}$ [rad/s]','Interpreter','latex')
xlabel('Tempo [s]')

%% rappresentazione grafica dell'asta
hfig=figure(200);
writeObj=VideoWriter('asta.avi');
writeObj.FrameRate=10;
open(writeObj)
for kk=1:length(tempo)
    try
        delete(h3)
    end
    % piani di scorrimento
    h1=line([0 1],[0 0]);
    set(h1,'color','k','linewidth',1)
    h2=line([0 cos(beta)],[0 sin(beta)]);
    set(h2,'color','k','linewidth',1)
    %asta
    h3=line([sAtime(kk) btime(kk)*cos(beta)],[0 btime(kk)*sin(beta)]);
    set(h3,'color','r','linewidth',2)
    axis equal
    axis off
    frame=getframe(hfig); % catturo frame della figura
    writeVideo(writeObj,frame) % scrivo frame su oggetto video
    pause(0.1)
end
close(writeObj)

%% rappresentare vettorialmente delle grandezze (atto di moto t=0)
vtr=vA*exp(1i*alfa);
vb=bp*exp(1i*beta);
vrel=gammap*c*exp(1i*(gamma+pi/2));
figure
hh1=quiver(0,0,real(vtr),imag(vtr),0); %punto di origine, componenti del vettore, scalatura
set(hh1,'color','g')
text(0,0,'V_{tr}','color','g')
hold on
hh2=quiver(real(vtr),imag(vtr),real(vrel),imag(vrel),0);
set(hh2,'color','r')
text(real(vtr),imag(vtr),'V_{rel}','color','r')
hold on
hh3=quiver(0,0,real(vb),imag(vb),0);
set(hh3,'color','b')
text(0,0,'V_{B}','color','b')

%% calcolo velocità del punto G
vtr2=[real(vtr),imag(vtr),0];
omega=[0 0 gammap];
GA=[c/2*cos(gamma),c/2*sin(gamma),0];
Vg=vtr2+cross(omega,GA);

%% 
figure
h1=line([0 1],[0 0]);
    set(h1,'color','k','linewidth',1)
    h2=line([0 cos(beta)],[0 sin(beta)]);
    set(h2,'color','k','linewidth',1)
    %asta
    h3=line([sAtime(kk) btime(kk)*cos(beta)],[0 btime(kk)*sin(beta)]);
    set(h3,'color','r','linewidth',2)
    hold on
    plot(a+c/2*cos(gamma),c/2*sin(gamma), 'k0')
    quiver(a+c/2*cos(gamma),c/2*sin(gamma),Vg(1),Vg(2),0.1)