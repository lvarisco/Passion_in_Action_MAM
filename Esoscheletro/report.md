# Esoscheletro

## Descrizione del sistema
ARMEO Spring è un esoscheletro passivo antigravitario per la riabilitazione dell’arto superiore prodotto da Hocoma (https://www.hocoma.com/solutions/armeo-spring/).</br>
Prima di iniziare un esercizio riabilitativo, si deve adattare manualmente il compenso antigravitario fornito da un meccanismo di molle. Sono poi presenti una gran numero di esercizi che si possono fare muovendosi sul piano o nello spazio tridimensionale e accoppiati con giochi interattivi su schermo.</br>
Nello svolgimento di questo progetto, per semplificare l’analisi, si è considerato un movimento di flesso-estensione della spalla svolto nel piano sagittale, bloccando il grado di libertà relativo alla flesso-estensione del gomito.

## Set-up sperimentale
Per raccogliere informazioni sulla cinematica del movimento, si è utilizzato il sistema ottico Polaris Vicra (https://www.ndigital.com/products/polaris-vicra/) che si avvale della ricostruzione tridimensionale della posizione di marker retroriflettenti passivi. Il Polaris Vicra, in particolare, si avvale dell’utilizzo di gruppi di marker passivi (tools), che permettono, grazie ad una geometria predefinita, un riconoscimento automatico del tool all’interno dell’immagine acquisita dalle telecamere.</br>
I tool devono essere posizionati in punti strategici utili per la ricostruzione del movimento di interesse. In questo caso, si sono posizionati 5 tool in corrispondenza dei punti indicati nella figura seguente.
<div align="center"><img src="./img/marker.png"/></div>

## Dati sperimentali
I dati raccolti sperimentlmente sono stati inseriti nel file  `data_stud.mat`, suddivisi in dieci matrici (numerate da `zero` a `nove`).</br>
Ogni matrice è composta da N righe (dove N è il numero di campioni della serie temporale) e 8 colonne:
|M1_x|M1_y|M3_x|M3_y|M4_x|M4_y|M5_x|M5_y|
|----|----|----|----|----|----|----|----|
|Coordinate x marker M1|Coordinate y marker M1|Coordinate x marker M3|Coordinate y marker M3|Coordinate x marker M4|Coordinate y marker M4|Coordinate x marker M5|Coordinate y marker M5|

**N.B.**: i dati sono stati raccolti con una frequenza di **20Hz** e e coordinate sono espresse in **[mm]**.</br></br>
Poichè le misurazioni sperimentali non sono contraddistinte da precisione assoluta, ma presentano degli errori di misurazione, i calcoli svolti su base teorica differiranno da quelli svolti sulla base dei dati sperimentali.

## Schema cinematico

### Rappresentazione grafica
<div align="center"><img src="./img/schema.gif" width="50%"/></div>

### Gradi di libertà
Il sistema è composto da **tre corpi rigidi** (sarebbero quattro, ma consideriamo un movimento solidale dei tratti M2-M4 ed M4-M5), caratterizzati ciascuno da 3 GDL, per un totale di **9 GDL**.</br>
Le **cerinere a terra** (in corrispondenza di M1 ed M2), **tolgono 2 GDL ciascuna**, poichè consentono la sola rotazione delle due aste incernierate.</br>
Le **cerniere mobili** tra le due aste (in corrispondenza di M3 ed M4), **tolgono 2 GDL ciascuna**, poichè vincolano le due aste incernierate a muoversi solidalmente.</br>
**Il sistema presenta quindi 1 GDL**.

## Analisi cinematica

### Storia temporale del marker M2
È possibile calcolare le coordinate del marker M2 per ogni istante di campionamento sapendo che la coordinata x risulta la stessa del marker M1, mentre la coordinata y è la coordinata y del marker M1 diminuita di 24mm.

### Lunghezze M1-M2, M1-M3, M2-M4 e M3-M4
Conoscendo la posizione dei punti istante per istante e applicando il teorema di Pitagora, è possibile ricavare la lunghezza dei segmenti.</br>
Tutte le misurazioni reali presentano degli errori di misurazione, per questo motivo, calcolando la lunghezza dei segmenti per ogni istante di tempo, risulteranno valori più o meno diversi in base alla dimensione dell'errore. In generale si potrebbero selezionare tre diversi valori di lunghezza: il valore minimo, il valore medio o il valore massimo tra i valori calcolati.

### Traiettoria sperimentale dei punti acquisiti
Plottando le posizioni dei punti relative a tutti gli istanti di tempo campionati si ottengono le traiettorie dei vari marker.
<div align="center"><img src="./img/traiettorie_marker.jpg" width="50%"/></div>
Si può notare come i marker M1 ed M2 risultino, con un'ottima approssimazione, fermi. Nella realtà, infatti, tali marker sono stati applicati in corrispondenza delle due cerniere a cui è agganciato il supporto per il braccio, che risultano macroscopicamente fermi. I marker M3 ed M4 percorrono due archi di circonferenza centrati rispettivamente in corrispondenza dei marker M1 ed M2. La traiettoria del marker M5, invece, risulta approsimativamente un arco di circonferenza, ma è visibilmente diversa. Questo è dovuto al movimento effettivo che è stato svolto durante il campionamento. Si evince, quindi, che il soggetto non è stato in grado di mantenere perfettamente fermo l'avambraccio rispetto al braccio.

### Posizione e traiettoria dei baricentri G1 e G2
Servendosi delle tabelle antropometriche, è possibile calcolare la posizione dei barecentri G1 e G2, realitivi rispettivamente alle aste M2-M4 ed M4-M5.
<div align="center"><img src="./img/traiettorie_baricentri.jpg" width="50%"/></div>
Si può notare come le traiettorie risultino simili, rispettivamente, alle traiettorie dei punti M4 ed M5, anche se ricalcano approssimativamente due archi di circonferenza con raggi inferiori, poichè i baricentri si trovano ad una distanza inferiore dal centro di rotazione rispetto ai due marker.

### Range of motion della spalla
Per calcolare il range of motion della spalla si può definire l'angolo (), che il segmento M2M4 (il braccio) forma con la verticale, istante per istante. Per effettuare questa operazione è possibile ricorrere al prodotto scalare. Si selezionano infine i valori massimo e minimo di  e se ne fa la differenza.
<div align="center"><img src="./img/rom.jpg" width="50%"/></div>

### Velocità e accelerazione di M4
Poichè la velocità risulta essere la derivata della posizione e l'accelerazione la derivata della velocità, conoscendo la posizione del marker M4 per ogni istante di tempo, è possibile ricavare i valori della velocità e dell'acelerazione di tale punto sfruttando la definizione di derivata.
<div align="center"><img src="./img/vel_acc_M4.jpg" width="50%"/></div>

### Risoluzione del cinematismo
Conoscendo velocità e accelerazione del marker M4 è possibile risolvere il cinematismo mediante il metodo della chiusura cinematica.
<div align="center"><img src="./img/vel_acc_angolari_M3.jpg" width="50%"/></div>
Poiché braccio e avambraccio si muovono solidalmente, la velocità e l'accelerazione angolare dei due tratti sono le medesime.
<div align="center"><img src="./img/vel_acc_angolari_M5.jpg" width="50%"/></div>

### Confronto teorico-sperimentale di velocità e accelerazione angolari di M5
Conoscendo velocità e accelerazione di M5 è possibile ricavare la velocità e l'accelerazione angolare di M5 (rispetto al suo centro di rotazione M2) mediante il rapporto tra velocità lineare e lunghezza del segmento M2M5 e derivando la velocità trovata per ricavare l'accelerazione.
<div align="center"><img src="./img/confronto_vel_M5.jpg" width="50%"/></div>
Dalla figura si può vedere come le due curve presentano un andamento simile, anche se presentano due ampiezze diverse. Queste differenze sono dovute all'errore dovuto all'incapacità del soggetto di mantenere perfettamente fermo l'avambraccio rispetto al braccio durante il campionamento dei dati.
<div align="center"><img src="./img/confronto_acc_M5.jpg" width="50%"/></div>
Le stesse considerazione fatte per le velocità angolari risultano valide anche per le accelerazioni.

## Analisi dinamica

### Coppia muscolare con supporto antigravitario

### Coppia muscolare senza supporto antigravitario
