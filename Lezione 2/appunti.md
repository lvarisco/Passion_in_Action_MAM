# Lezione 2

## Conditional statements

I conditional statements consentono di selezionare in fase di esecuzione quale blocco di codice eseguire. Il primo controllo e caratterizzato da un `if`, seguito da uno o più `else if` e/o da un `else` (eventualmente) e da un `end`.

```Matlab
if expression
	statements
ELSEIF expression
	statements
ELSE
	statements
END
```

## Indentature automatiche

Una volta scritte alcune righe di codice è possibile formattarle automaticamente con le corrette indentature con `ctrl` + `i`.

## Display array

Con il comando `disp` è possibile stampare nella command window un array senza il nome dell'array e informazioni aggiuntive come la sua lunghezza.

```Matlab
disp(['Text' variable])
```

## Warning dialog box

Il comando `warndlg` crea un pop up con un warning.

```Matlab
warndlg('Text')
```

## ciclo for

Il ciclo `for` permette di eseguire un numero di volte definito il blocco di codice contenuto in esso.
```Matlab
for ii=1:n
    statements
end
```

## num2str

Il comando `num2str` converte i numeri in caratteri.
```Matlab
num2str(variable)
```

## str2double

Il comando `str2double` converte i caratteri in numeri.
```Matlab
str2double(variable)
```

## length

Il comando `length` restituisce la lunghezza di un vettore.
```Matlab
length(vector)
```

## size

Il comando `size` restituisce la dimensione di una matrice.
```Matlab
size(matrix)
```

## Input dialog box

Il comando `inputdlg` crea una finestra di dialogo in cui l'utente può inserire degli input che verrano salvati in un cell array.
```Matlab
prompt={'Text_1', 'Text_2'}; %definisce le intestazioni degli input
dlgtitle='Title_box'; %definisce il titolo he verrà mostrato nel box
dims=[1 35]; %definisce le dimensioni minime e massime degli input
definput={'x','y'}; %definisce degli input preimpostati
answer=inputdlg(prompt,dlgtitle,dims,definput);
variable_1=answer{1};
variable_2=answer{2};
```

## Cell array

Un **cell array** è un tipo di dati con contenitori indicizzati denominati **celle**. Ogni cella può contonere qualsiasi tipo di dati (numeri, stringhe, ...).</br>Per accedere al contenuto di una cella bisogna racchiudere gli indici tra le `{}`, per esempio: `cell_array{1}`.

## Media o valore medio

Il comando `mean` restituisce il valore medio dei valori forniti in ingresso.
```Matlab
mean(vector(:,n))
```

## std

Il comando `std` restituisce la deviazione standard dei valori forniti in ingresso.</br>Lo scarto quadratico medio, o deviazione standard, è un indice di dispersione statistico, vale a dire una stima della variabilità di una popolazione di dati o di una variabile casuale. È uno dei modi per esprimere la dispersione dei dati intorno ad un indice di posizione.
```Matlab
std(vector(:,n));
```

## Tabelle

Il comando `table` definisce una tabella con le variabili date in ingresso.</br>È possibile scrivere una tabella excell con il comando `writetable` o leggere una tabella con il comando `readtable`.
```Matlab
T=table(variable_1,variable_2,variable_n);
writetable(T,'table.xls');
readtable(T,'table.xls');
```