clear
close all

load('data_stud.mat');

%% Dati
dt=1/20; %frequenza=20Hz
time=0:dt:(size(otto,1)-1)*dt;

%% STEP3.1
% sezione prossimale (SP) >> tra anca e ginocchio
SP = max(sqrt((otto(:,1)-otto(:,3)).^2+(otto(:,2)-otto(:,4)).^2));
% sezione distale (SD) >> tra ginocchio e caviglia
SD = max(sqrt((otto(:,3)-otto(:,5)).^2+(otto(:,4)-otto(:,6)).^2));

%% STEP3.2
O_A = [otto(:,5)-otto(:,3) otto(:,6)-otto(:,4)]; %(O-A)
B_A = [otto(:,1)-otto(:,3) otto(:,2)-otto(:,4)]; %(B-A)
for ii=1:size(O_A,1)
    ps=O_A(ii,1)*B_A(ii,1)+O_A(ii,2)*B_A(ii,2); %prodotto scalare tra i due vettori (O-A) e (B-A)
    pm=(sqrt(O_A(ii,1).^2+O_A(ii,2).^2))*(sqrt(B_A(ii,1).^2+B_A(ii,2).^2)); %prodotto dei moduli
    teta(ii,1)=rad2deg(acos(ps/pm)); %formula inversa del prodotto scalare tra due vettori
end
ROM=[min(teta) max(teta)];
delta_ROM=ROM(2)-ROM(1);

figure(1)
plot(time,teta)
xlabel('t [s]')
ylabel('teta [°]')
title('Range of motion')

%% STEP3.3
for ii=1:(size(otto,1)-1)
    dp(ii,1)=(otto(ii+1,1)-otto(ii,1))/dt;
end
for ii=1:(size(dp,1)-1)
    dpp(ii,1)=(dp(ii+1,1)-dp(ii,1))/dt;
end

figure(2)
subplot(211)
plot(time(1:end-1),dp,'b')
grid on
ylabel('v [mm/s]')
title('Velocità dell''anca')
hold on
subplot(212)
plot(time(1:end-2),dpp,'r')
grid on
xlabel('t [s]')
ylabel('a [mm/s^2]')
title('Accelerazione dell''anca')

%% STEP3.4
a=SD;
b=SP;
%d=mean(otto(:,2)-otto(:,6));
%Calcolo degli angoli alfa e beta
%for ii=1:size(otto,1)
    %alfa(ii,1)=rad2deg(atan((otto(ii,4)-otto(ii,6))/(otto(ii,3)-otto(ii,5))));
    %beta(ii,1)=360-rad2deg(atan((otto(ii,2)-otto(ii,4)-d)/(otto(ii,1)-otto(ii,3))));
%end

%c = altezza media seggiolino
c = mean(otto(:,2)-otto(:,6));
%d = lunghezza anca-caviglia lungo x
d = otto(:,1)-otto(:,5);

% trovo alpha e beta
for i = 1: length(d)
    fun = @(x) [a*cos(x(1))+b*cos(x(2))-d(i);...
        a*sin(x(1))-b*sin(x(2))-c];
    x0 = [0.1; 0.1];
    
    res = fsolve(fun,x0);
    
    alfa(i) = res(1)*180/pi;
    phi(i) = res(2)*180/pi;
    
end

beta = 360-phi;

%Calcolo delle velocità angolari delle due aste tramite chiusura cinematica
for ii=1:length(dp)
    x0=[dp(ii);
        0];
    A=[-a*sind(alfa(ii)) -b*sind(beta(ii));
        a*cosd(alfa(ii)) b*cosd(beta(ii))];
    x=inv(A)*x0;
    alfap(ii,1)=x(1);
    betap(ii,1)=x(2);
end
%Calcolo delle accelerazioni angolari delle due aste tramite chiusura cinematica
for ii=1:length(dpp)
    x0=[dpp(ii)+a*alfap(ii).^2*cosd(alfa(ii))+b*betap(ii).^2*cosd(beta(ii));
        a*alfap(ii).^2*sind(alfa(ii))+b*betap(ii).^2*sind(beta(ii))];
    A=[-a*sind(alfa(ii)) -b*sind(beta(ii));
        a*cosd(alfa(ii)) b*cosd(beta(ii))];
    x=inv(A)*x0;
    alfapp(ii,1)=x(1);
    betapp(ii,1)=x(2);
end
figure(3)
subplot(211)
plot(time(1:end-1),alfap,'b')
hold on
plot(time(1:end-1),betap,'r')
legend("vel angolare stinco","vel angolare coscia")
grid on
xlabel('t [s]')
ylabel('w [rad/s]')
title('Velocità angolari di stico e coscia')
subplot(212)
plot(time(1:end-2),alfapp,'b')
hold on
plot(time(1:end-2),betapp,'r')
legend("acc angolare stinco","acc angolare coscia")
grid on
xlabel('t [s]')
ylabel('wp [rad/s^2]')
title('Accelerazioni angolari di stico e coscia')
%Calcolo della velocità (teorica) del ginocchio tramite Th. di Rivals
for ii=1:length(dp)
    vA_t(ii,1)=-alfap(ii)*a*sind(alfa(ii));
    vA_t(ii,2)=alfap(ii)*a*cosd(alfa(ii));
end
%Calcolo dell'accelerazione (teorica) del ginocchio tramite Th. di Rivals
for ii=1:length(dpp)
    aA_t(ii,1)=-alfapp(ii)*a*sind(alfa(ii))-alfap(ii).^2*a*cosd(alfa(ii));
    aA_t(ii,2)=alfapp(ii)*a*cosd(alfa(ii))-alfap(ii).^2*a*sind(alfa(ii));
end

%% STEP3.5
for ii=1:(size(otto,1)-1)
    Ap(ii,1)=(otto(ii+1,3)-otto(ii,3))/dt;
    Ap(ii,2)=(otto(ii+1,4)-otto(ii,4))/dt;
end
for ii=1:(size(Ap,1)-1)
    App(ii,1)=(Ap(ii+1,1)-Ap(ii,1))/dt;
    App(ii,2)=(Ap(ii+1,2)-Ap(ii,2))/dt;
end
figure (4)
plot(time(1:end-1),vA_t(:,1),'b')
hold on
plot(time(1:end-1),Ap(:,1),'r')
legend('Teorico','Sperimentale')
grid on
xlabel('t [s]')
ylabel('vel [m/s]')
title('Velocità del ginocchio lungo x')

figure(5)
plot(time(1:end-1),vA_t(:,2),'b')
hold on
plot(time(1:end-1),Ap(:,2),'r')
legend('Teorico','Sperimentale')
grid on
xlabel('t [s]')
ylabel('vel [m/s]')
title('Velocità del ginocchio lungo y')

figure(6)
plot(time(1:end-2),aA_t(:,1),'b')
hold on
plot(time(1:end-2),App(:,1),'r')
legend('Teorico','Sperimentale')
grid on
xlabel('t [s]')
ylabel('acc [m/s^2]')
title('Accelerazione del ginocchio lungo x')

figure(7)
plot(time(1:end-2),aA_t(:,2),'b')
hold on
plot(time(1:end-2),App(:,2),'r')
legend('Teorico','Sperimentale')
grid on
xlabel('t [s]')
ylabel('acc [m/s^2]')
title('Accelerazione del ginocchio lungo y')

%%