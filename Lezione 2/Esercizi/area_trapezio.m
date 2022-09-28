function area=area_trapezio(B,b,h)
if B>0 && b>0 && h>0
    area=(B+b)*h/2;
else
    area=NaN;
    warndlg('Dati in input non validi');
end