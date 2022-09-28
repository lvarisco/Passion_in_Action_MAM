clear
%load('dati')
base=[1 2 3 4];
altezza=[5 6 7 8];
area=zeros(size(base)); %size restituisce la dimensione di una matrice
for ii=1:length(base) %length restituisce la lunghezza di un vettore
    area(ii)=area_trinagolo(base(ii),altezza(ii));
end
%%
clear

%base=input('Assegna un valore per la base [m]');
%altezza=input('Assegna un valore per l'' altezza [m]');

prompt={'Base [m]', 'Altezza [m]'};
dlgtitle='Input';
dims=[1 35];
definput={'7','2'};
answer=inputdlg(prompt,dlgtitle,dims,definput);
base=str2double(answer{1});
altezza=str2double(answer{2});
area=area_trinagolo(base,altezza);
disp(['L''area del triangolo vale ' num2str(area) ' m^2']) %num2str serve per trasformare un numero in una stringa
