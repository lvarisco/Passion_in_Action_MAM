# Lezione 3

## Invertire l'ordine degli elementi di un vettore

Per invertire l'ordine degli elementi di un vettore (o di una matrice) è possibile utilizzare un `indice`, oppure il comando `flip`.

```Matlab
indice=length(v):-1:1;
v=v(indice);
v=flip(v);
``` 
## Valutazione di un polinomio

Dati i coefficienti di un polinomio, il comando `polyval` valuta il polinomio stesso. È necessario fornire al comando un vettore contenente i coefficienti del polinomio (eventualmente 0), nell'ordine dal coefficiente del termine di grado massimo al coefficiente di grado minimo, e il range di valori tra cui calcolare il polinomio stesso.

```Matlab
cp=[a b c];
x=xA:n:xB; %Il range parte da xA e va fino ad xB con passo n
p=polyval(cp,x);
```

## Differenziazione di un polinomio

Il comando `polyder` restituisce i coefficienti della derivata del polinomio fornito in ingresso.

```Matlabd
polyder(v);
```

## Grafici

```Matlab
figure(1)
subplot(411)
plot(X1,Y1,'r','DisplayName','Name1') %X1 e Y1 sono vettori
hold on %per disegnare un'altra funzione sullo stesso grafico
plot(X2,Y2,'g','DisplayName','Name2')
grid on
xlabel('Unità di midura')
ylabel('Unità di misura')
```

## Risoluzione di sistemi non lineari

Il comando `fsolve` risolve sistemi di equazioni non lineari in più variabili.

```Matlab
x0=[c 0];
F=@(x) [x(1)*cos(alfa)+c*cos(gamma)-x(2)*cos(beta);
        x(1)*sin(alfa)+c*sin(gamma)-x(2)*sin(beta)];
sol=fsolve(F,x0);
a=sol(1);
b=sol(2);
```

## Calcolo del seno e del coseno

Per calcolare il seno o il coseno di angoli è possibile quattro comandi:
- il comando `cos` calcola il coseno di un angolo espresso in radianti
- il comando `sin` calcola il seno di un angolo espresso in radianti
- il comando `cosd` calcola il coseno di un angolo espresso in gradi
- il comando `sind` calcola il seno di un angolo espresso in gradi

```Matlab
c1=cos(2pi);
s1=sin(pi/2);
c2=cosd(45);
s2=sind(45);
```