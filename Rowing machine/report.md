# Rowing machine

## Descrizione del sistema

La rowing machine (vogatore, in italiano),  è un attrezzo chiamato anche remoergometro che riproduce il gesto che il canottiere compie in canoa o in barca e permette di allenare tutto il corpo (stimola fino all’80% dei muscoli di chi lo esegue).</br>

Prima di effettuare un esercizio con il vogatore, bisogna bloccare i piedi con le apposite cinghie sulla base di appoggio. La posizione di partenza (Figura A) si assume piegando le ginocchia finché il corpo non si trova vicino alle barre montate sulla parte frontale della macchina e si afferrano le barre con entrambe le mani. L’esercizio (vogata) consiste poi nel coordinare gambe e le braccia, mentre si spingono i piedi sulla pedana di appoggio, sfruttando la forza dei muscoli delle gambe (Figura B). Nello svolgimento di questo progetto, per semplificare l’analisi, so è considerato solamente il moto delle gambe.

![Vogatore](./img/vogatore.png)

## Set-up sperimentale

Per raccogliere informazioni sulla cinematica del movimento durante la vogata, utilizziamo il sistema ottico Polaris Vicra, che si avvale della ricostruzione tridimensionale della posizione di marker retroriflettenti passivi ([dettagli](.././Lezione%204/appunti.md#polaris-vicra)). Il Polaris Vicra, in particolare, si avvale dell’utilizzo di gruppi di marker passivi (tools) che permettono, grazie ad una geometria pre-definita, un riconoscimento automatico del tool all’interno dell’immagine acquisita dalle telecamere. I tool devono essere posizionati in punti strategici utili per la ricostruzione del movimento di interesse. In questo caso, i 3 tool sono stati posizionati in corrispondenza di:
- anca
- ginocchio
- caviglia

![Marker](./img/marker.png)

## Dati sperimentali

I dati raccolti sperimentlmente sono stati inseriti nel file  `data_stud.mat`, suddivisi in dieci matrici (numerate dalla `zero` alla `nove`).</br>
Ogni matrice è composta da N righe (dove N è il numero di campioni della serie temporale) e 6 colonne:
|Anca x|Anca y|Ginocchio x|Ginocchio y|Caviglia x|Caviglia y|
|------|------|-----------|-----------|----------|----------|
|Coordinate x marker anca|Coordinate y marker anca|Coordinate x marker ginocchio|Coordinate y marker ginocchio|Coordinate x marker caviglia|Coordinate y marker caviglia|

**N.B.**: i dati sono stati raccolti con una frequenza di **20Hz** e e coordinate sono espresse in **[mm]**.

## Schema cinematico

### Rappresentazione grafica

![Schema cinematico](./img/schema.png)

### Gradi di libertà

Il sistema è composto da **due corpi rigidi**, caratterizzati ciascuno da 3 GDL, per un totale di **6 GDL**.</br>
La cerinera a terra (in corrispondenza della caviglia), toglie 2 GDL, poichè consente la sola rotazione della prima asta.</br>
La cerniera mobile tra le due aste (in corrispondenza del ginocchio), toglie 2 GDL, poichè vincola le due aste a muoversi solidalmente.</br>
Il carrello (in corrispondenza dell'anca), tolgie 1 GDL, poichè consente la rotazione, ma limita la traslazione in una sola direzione.</br>
**Il sistema presenta quindi 1 GDL**.

## Analisi cinematica

### Lunghezza delle sezioni prossimale e distale

### Range of motion

### Velocità e accelerazione dell'anca

### Risoluzione teorica del cinematismo

### Confronto tra risoluzione teorica e dati sperimentali

