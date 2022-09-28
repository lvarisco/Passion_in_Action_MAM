clear
load('Lez2.mat');
kk=1;
for ii=1:3
    exp(ii).xdata=data_mod(:,kk);
    exp(ii).xmean=mean(data_mod(:,kk));
    exp(ii).xstd=std(data_mod(:,kk));
    exp(ii).ydata=data_mod(:,kk+1);
    exp(ii).ymean=mean(data_mod(:,kk+1));
    exp(ii).ystd=std(data_mod(:,kk+1));
    exp(ii).nome=nomi{kk}(1:end-1); %prende solo i primi n-1 caratteri
    kk=kk+2;
end

MedieX=[exp.xmean]';
MedieY=[exp.ymean]';
StdX=[exp.xstd]';
StdY=[exp.ystd]';
Nome={exp.nome}';
T=table(Nome,MedieX,StdX,MedieY,StdY);
writetable(T,'struttura.xls');