# Lezione 1

## Variabile i

Con la variabile `i` si indica la varibile immaginaria. Nel momento in cui si dichiara `i` attribuendogli un altro valore essa viene sovrascritta e non rappresenterà più l'unità immaginaria.

## Variabile pi

Alla variabile `pi` è associato il valore del pi greco. Nel momento in cui si dichiara `pi` attribuendogli un altro valore, questo valore viene sovrascritto a quello del pi greco.

## Clear

Con il comando `clear` è possibile cancellare tutte le variabili all'interno del workspace. È buona norma inserire un comando `clear` all'inizio di ogni script.

## Function

Il comando `function` serve a creare una nuova function. Esso va inserito all'inizio dello script, seguito dal nome della varibile di output, l'=', il nome della funtion e le variabili di input poste tra `()` e separate dalla `,`.</br>La function, se eseguita direttamente con il tato `run`, produce un errore, essa, infatti, deve essere eseguita nella command window oppure richiamata in un altro script inserendo i dati di input.</br>N.B.: se la function è richiamata in un altro script, tale script e lo script contente la function (che deve avere lo stesso nome della function) devono essere salvati nella stessa cartella.

## Debug

## Sezione

È possibile dividere uno script in sezioni andando ad inserire `%%`. Dividendo uno script in sezioni è possibile eseguire una sola sezione alla volta. Le sezioni, quindi, possono essere molto utili anche nel processo di debug.

## Matrici

È possibile inizializzare una matrice andando ad inserire i valori della stessa all'interno di `[]`, separando i valori di colonne diversa con uno spazio e le diverse righe con un `;`.
```
M= [a b c;d e f];
```
</br>

È possibile anche inizializzare una matrice nulla tramite il comando `zeros()`, inserendo nelle `()` il numero di righe e il numero di colonne separati da una `,`. Se all'interno delle `()` si inserisce un solo valore verrà creata una matrice quadrata nulla.
```
N=zeros(g,h);
P=zeros(j);
```
</br>
Una volta inizializzata una matrice si possono cambiare dei valori al suo interno.
```
N(1,1)=5;
N(:,2)=[3 3 3]; % i : identificano tutta la riga o tutta la colonna in base alla sua posizione
```
</br>
Tra due matrici diverse (che rispettano i prerequisiti perchè si possa effettivamente effettuare una tale operazione tra esse) si possono effetture delle operazioni.
```
X1=N+P; % somma tra due matrici
X2=M*N; % prodotto matriciale --> una matrice deve essere n*m e una m*n
X3=N.*P; % prodotto punto a punto tra due matrici --> le matrici devono avere le stesse dimensioni
```
## Save

Con il comando `save` è possibile salvare i dati presenti nel `Workspace` in un file.
```
save('filename') % salva tutti i dati presenti nel workspace in un file denominato 'filename'
save('filename','a') % salva solamente la variabile 'a' presente nel workspace in un file denominato 'filename'
```

## Load

Con il comando `load` è possibile caricare i dati presenti in un file.
```
load('filename') % carica tutti i dati presenti nel file denominato 'filename'
```
