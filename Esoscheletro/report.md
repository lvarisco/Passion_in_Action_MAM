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
Il sistema è composto da **tre corpi rigidi** (sarebbero quattro, ma consideriamo un movimento solidale dei tratti M2M4 ed M4M5), caratterizzati ciascuno da 3 GDL, per un totale di **9 GDL**.</br>
Le **cerinere a terra** (in corrispondenza di M1 ed M2), **tolgono 2 GDL ciascuna**, poichè consentono la sola rotazione delle due aste incernierate.</br>
Le **cerniere mobili** tra le due aste (in corrispondenza di M3 ed M4), **tolgono 2 GDL ciascuna**, poichè vincolano le due aste incernierate a muoversi solidalmente.</br>
**Il sistema presenta quindi 1 GDL**.

## Analisi cinematica
