/* Problema del viajante con restricciones*/

#Conjuntos:
set CIUDADES;

#Parámetros o constantes:
#Las distancias en km. de ir desde la ciudad i hasta la j.
param DISTANCIA{i in CIUDADES, j in CIUDADES: i<>j}; 

#Variables:
#U_i orden de secuencia en que la ciudad i es visitada (excluyendo el punto de partida).
var U{i in CIUDADES: i<>'0'} >=0, integer;

#Y_ij, bivalente que vale 1 si va desde la ciudad i hasta la j (i <> j).
var Y{i in CIUDADES, j in CIUDADES: i<>j} >= 0, binary;

# D: Distancia recorrida (en km).
var D >=0;

# DES_j : Vale 1 si descansan 2 dias en la ciudad j.
var DES{j in CIUDADES} >=0, binary;

# E: Cantidad de veces totales que se detienen a estirarse.
var E >=0;

# H : Vale 1 si compran la heladera.
var H >=0, binary;

# Agua: Precio de todas las botellas de agua.
var Agua >=0;

#Hidr1: Cantidad de veces que se detienen y se hidratan tomando un agua si compran
la heladera.
var Hidr0 >=0;

#Hidr0: Cantidad de veces que se detienen y se hidratan tomando un agua si no compran
la heladera.
var Hidr1 >=0;

# Hidr: Cantidad de veces que se detienen y se hidratan.
var Hidr >=0;

# K : Cantidad de Km recorridos hasta ciudad i.
var K{i in CIUDADES} >=0;

# XI_i : Vale 1 si la ciudad i está en el recorrido entre 0 y 10000 Km del viaje (si K_i <= 10000).
var XI{i in CIUDADES} >=0, binary;

# XII_i: Vale 1 si la ciudad $i$ está en el recorrido entre 10000 y 20000 Km del viaje(si 10000 <= K_i <= 20000).
var XII{i in CIUDADES} >=0, binary;

# XIII_i: Vale 1 si la ciudad $i$ está en el recorrido entre 20000 y 30000 Km del viaje(si 20000 <= K_i <= 30000).
var XIII{i in CIUDADES} >=0, binary;

# XIV_i : Vale 1 si la ciudad i está en el recorrido mayor a 30000 Km del viaje (si K_i >= 30000).
var XIV{i in CIUDADES} >=0, binary;

#A_ij, bivalente que vale 1 si si se pasó por la ciudad i antes que j(U_i<= U_j, i <> j).
var A{i in CIUDADES, j in CIUDADES: i<>j} >= 0, binary;

#V_ijk, bivalente que vale 1 si se hizo el viaje de i a j(i <> j) y además se pasó por j antes que k(es decir, A_jk = 1 y Y_ij = 1).
var A{i in CIUDADES, j in CIUDADES, k in CIUDADES: i<>j and j<>k} >= 0, binary;

#ANDI_i: Vale 1 si XI_i y DES_i valen 1(es decir, si la ciudad i está en el primer tramo del recorrido y descansaron 2 días en esa ciudad).
var ANDI{i in CIUDADES} >=0, binary;

#ANDII_i: Vale 1 si XII_i y DES_i valen 1(es decir, si la ciudad i está en el segundo tramo del recorrido y descansaron 2 días en esa ciudad).
var ANDII{i in CIUDADES} >=0, binary;

#ANDIII_i: Vale 1 si XII_i y DES_i valen 1(es decir, si la ciudad i está en el tercer tramo del recorrido y descansaron 2 días en esa ciudad).
var ANDIII{i in CIUDADES} >=0, binary;

#ANDIV_i: Vale 1 si XIV_i y DES_i valen 1(es decir, si la ciudad i está en el último tramo del recorrido y descansaron 2 días en esa ciudad).
var ANDIV{i in CIUDADES} >=0, binary;

# C1 : Cantidad de días que tardan en hacer el recorrido de 0 y 10000 Km.
var C1 >=0;

# C2: Cantidad de días que tardan en hacer el recorrido de 10000 y 20000 Km.
var C2 >=0;

# C3: Cantidad de días que tardan en hacer el recorrido de 20000 y 30000 Km.
var C3 >=0;

# C4 : Cantidad de días que tardan en hacer el recorrido desde 30000 Km.
var C4 >=0;

#Otras variables
var Habitaciones >=0;
var Nafta >=0;
var CostoAgua >=0;
var Comida >=0;

#FUNCIONAL
minimize z: Habitaciones + Nafta + CostoAgua + Comida; 

#Costo por las habitaciones
s.t. costoHab :Habitaciones = 50 * sum{i in CIUDADES, j in CIUDADES: i<>j } Y[i,j] + 50 * sum{j in CIUDADES: i<>j } DES[i,j] ; 
      
#Nafta gastada según la cantidad de kilómetros hecho
s.t. costoNafta :Nafta = 2 * D ;

#Costo total del agua
s.t. costoAgua :costoAgua = 60 * H + Agua;

#Costo total por la comida
s.t. comida :Comida = 30 * C1 + 25 * C2 + 20 * C3 + 15 * C4 ;

#Distancia recorrida
s.t. cantDeKm :D = sum{i in CIUDADES, j in CIUDADES: i<>j } Y[i,j] * DISTANCIA[i,j]; 

#Secuencia para evitar subtours
s.t. orden{i in CIUDADES, j in CIUDADES: i<>j and i<>0 and j<>0}:
U[i] - U[j] + card(CIUDADES) * Y[i,j] <= card(CIUDADES) - 1;

#Se sale de todas las ciudades, pasando una vez por cada una:
s.t. saleDeI{i in CIUDADES} :sum{j in CIUDADES:i<>j} Y[i,j] = 1;

#Llegadas a todas las ciudades:
s.t. llegaAJ{j in CIUDADES}:sum{i in CIUDADES:i<>j} Y[i,j] = 1;

#Si viajaron mas de 250Km de corrido, descansan 2 dias en la ciudad. Siendo M un número suficientemente grande, cambiarlo por un valor para correrlo:
s.t. viajeMasDe250{j in CIUDADES}: 250 * DES[j] <= sum{i in CIUDADES:i<>j} Y[i,j] * DISTANCIA[i,j] <= (1 - DES[j] )250 + M* DES[j];

#Cantidad de veces que se detienen a hidratarse:
s.t. cantHidratacion:Hidr = Hidr0 + Hidr1;

#Cantidad de veces que se detienen a hidratarse si compran la heladera. Siendo M un número suficientemente grande:
s.t. hidraConHelad:0.1 * H <= Hidr1 <= H * M;

#Cantidad de veces que se detienen a hidratarse si no compran la heladera: Siendo M un número suficientemente grande:
s.t. hidraSinHelad:0.1 * (1 - H )<= Hidr0 <= (1 - H ) * M;

#Cada dos veces que se detienen a estirar, toman una botella de agua:
s.t. estirarse2veces:Hidr = E * 0.5;

#Precio de todas las botellas de agua:
s.t. precioAgua: Agua = 2 * Hidr1 + 3 * Hidr0;

#Definición A_ij (se visito i antes que j. Siendo $M$ un número suficientemente grande:
s.t. visitaIantesJ{i in CIUDADES, j in CIUDADES: i<>j}: -M*(1 - A[i,j]) <= U[j] - U[i] <= M * A[i,j];

#Definición V_ijk:
s.t. ciudDistA{i in CIUDADES, j in CIUDADES, k in CIUDADES: i<>j and j<>k} :2 * V[i,j,k]= A[i,j] + Y[i,j];

#Cantidad de Km recorridos hasta ciudad i, para todo k:
s.t. kmHastaI{k in CIUDADES}: K[k] = sum{i in CIUDADES, j in CIUDADES k in CIUDADES: i<>j and j<>k } V[i,j,k] * DISTANCIA[i,j];

#Definicion X_i. Para toda i ciudad:
s.t. xIguales1{i in CIUDADES}:XI[i] + XII[i] + XIII[i] + XIV[i] = 1;
s.t. xTramo1{i in CIUDADES}: (1 - XI[i] ) * 10000 <= K[i] <= XI[i] * 10000;
s.t. xTramo2{i in CIUDADES}: XII[i] * 10000 + (1 - XII[i] ) * 20000 <= K[i] <= XII[i] * 20000;
s.t. xTramo3{i in CIUDADES}: XIII[i] * 20000 + (1 - XIII[i] ) * 30000 <= K[i] <= XIII[i] * 30000;
s.t. xTramo4{i in CIUDADES}: XIV[i] * 30000 <= K[i];

#Cantidad de días que tardan en cada intervalo del recorrido, Siendo i las ciudades:
s.t. C1:C1 = sum{i in CIUDADES}: XI[i] + ANDI[i];  
s.t. C2:C2 = sum{i in CIUDADES}: XII[i] + ANDII[i]; 
s.t. C3:C3 = sum{i in CIUDADES}: XIII[i] + ANDIII[i]; 
s.t. C4:C4 = sum{i in CIUDADES}: XIV[i] + ANDIV[i]; 


end;
