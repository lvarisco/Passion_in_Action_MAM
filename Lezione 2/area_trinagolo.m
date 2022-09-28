function area=area_trinagolo(base, altezza)
if base<0 || altezza<0 % || --> or ; && --> and
    area=NaN; % NaN = Not a Number
    disp('Il valore di ingresso non è valido'); % scrive qualcosa sulla command window
    warndlg('Il valore di ingresso non è valido'); % crea un pop up con un warning
    %return % serve solo nel caso in cui ci fosse solo l'if
else % oppure else if
    pippo=base*altezza;
    area=pippo/2;
end