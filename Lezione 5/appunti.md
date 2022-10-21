# Lezione 5

## try e catch

In un ciclo è possibile inserire il comando `try`. L'azione o le azioni inserite nel `try` verranno eseguito solo nei casi in cui ci saranno le condizioni per eseguirle, altrimenti non verranno eseguite senza generare alcun errore. Alle azioni inserite nel `try` possono essere contrapposte altre azioni oppurtanemtne inserite nel `catch`.
```Matlab
for ii=1:n
	try
		statements;
	end
	catch
		statements;
	end
end

```

## delete

Il comando `delete` permette di cancellare un elemento plottato in una figura. Risulta utile nel momento in cui si utilizza un ciclo per plottare un oggetto che si sposta nel riferimento cartesiano.
```Matlab
delete(h)
```

## line

Il comando `line` consente di disegnare una retta.
```Matlab
line([x0 x],[y0 y]); %coordinate dell'origine e componenti x e y della retta

```

## quiver

Il comando `quiver` consente di disegnare un vettore.
```Matlab
quiver(x0,y0,x,y,s); %punto di origine, componenti del vettore, scalatura

```

## Realizzazione di un video

```Matlab
hfig=figure;
writeObj=VideoWriter('name.avi');
writeObj.FrameRate=10; %parametro arbitrario
open(writeObj)
for kk=1:n
    try
        delete(h1)
    end
    h1=line([0 x(ii)],[0 y(ii)]);
    set(h1,'color','k','linewidth',1)
    axis equal
    axis off
    frame=getframe(hfig); % catturo frame della figura
    writeVideo(writeObj,frame) % scrivo frame su oggetto video
    pause(0.1) %parametro arbitrario
end
close(writeObj)
```