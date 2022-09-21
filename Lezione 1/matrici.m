clear
M= [1 2 3;4 5 6];
N=zeros(3,2);
N(1,1)=5;
N(:,2)=[3 3 3]; % i : identificano tutta la riga o tutta la colonna in base alla sua posizione
P=M'; %trasposizione matrice M
%% 
X1=N+P; % somma tra due matrici
X2=M*N; % prodotto matriciale --> una matrice deve essere n*m e una m*n
X3=N.*P; % prodotto punto a punto tra due matrici --> le matrici devono avere le stesse dimensioni