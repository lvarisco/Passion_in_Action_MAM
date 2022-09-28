clear
Nome=["Giuseppe" "Mario" "Giuseppe"]';
Cognome=["Verdi" "Rossi" "Bianchi"]';
Telefono=[516 452 789]';
Data=["10/10/1813" "15/12/2000" "24/06/1983"]';
if length(Nome)==length(Cognome) && length(Nome)==length(Telefono) && length(Nome)==length(Data)
    T=table(Nome, Cognome, Telefono, Data);
    writetable(T,'tabella.xls');
    for ii=1:length(Nome)
        s(ii).nome=Nome(ii);
        s(ii).cognome=Cognome(ii);
        s(ii).telefono=Telefono(ii);
        s(ii).data=Data(ii);
    end
end