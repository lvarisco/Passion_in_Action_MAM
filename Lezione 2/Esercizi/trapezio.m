clear
B=5;
b=4;
h=2;
if B>0 && b>0 && h>0
    area=(B+b)*h/2;
else
    area=NaN;
    warndlg('Dati in input non validi');
end