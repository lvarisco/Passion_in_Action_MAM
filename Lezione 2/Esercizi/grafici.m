clear
load('Lez2.mat');
kk=1;
for ii=1:3
    exp(ii).xdata=data_mod(:,kk);
    exp(ii).ydata=data_mod(:,kk+1);
    kk=kk+2;
end

t1=0;
t2=0;

for ii=1:length(exp(ii).xdata)
    t2=t2+0.05;
end
t=t1:0.05:t2;

figure(1)
subplot(211)
plot(t,exp(1).xdata)
hold on
plot(t,exp(2).xdata)
hold on
plot(t,exp(3).xdata)
grid on
ylabel('X [m]')

subplot(212)
plot(t,exp(1).ydata)
hold on
plot(t,exp(2).ydata)
hold on
plot(t,exp(3).ydata)
grid on
ylabel('Y [m]')
xlabel('Tempo [s]')