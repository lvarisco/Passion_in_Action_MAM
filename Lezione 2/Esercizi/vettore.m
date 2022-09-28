function v=vettore(l,p)
if p<=l
    v=zeros(1,l);
    v(1,p)=1;
else
    warndlg('Posizione non valida');
end