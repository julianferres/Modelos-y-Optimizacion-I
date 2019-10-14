#Resolución Parte B-Contenido del archivo B.mod
/*Declaración de variables*/
var Mgold >= 0;
var Msilv >= 0;
var Sgold >= 0;
var Ssilv >= 0;
var P>=0;
var Pgold>=0;
var Psilv>=0;
var Ingresos>=0;
var Egresos>=0;

/*Definición del funcional*/
maximize z: Ingresos-Egresos;

/*Restricciones*/

/*Equivalencia entre metros y pases*/
s.t. pasesMetrosG1: Sgold<=Mgold;
s.t. pasesMetrosG2: Sgold>=Mgold;
s.t. pasesMetrosS1: Ssilv<=2*Msilv;
s.t. pasesMetrosS2: Ssilv>=2*Msilv;

/*Metros totales disponibles*/
s.t. metrosTotales: Mgold+Msilv<=8000;

/*100 pases Gold minimos (por regalo al dueño)*/
s.t. minGold: Sgold>=100;

/*pases Silver minimos (reserva + ayuntamiento)*/
s.t. minSilver: Ssilv>=502;

/*Paquetes de merchandasing*/
s.t. Ptotales1: P>=Pgold+Psilv;
s.t. Ptotales2: P<=Pgold+Psilv;

/* Cantidad maxima de paquetes */
s.t. Pmax: P<=800;

/*Demanda minima de Psilv*/
s.t. demMinSilv: 20*Psilv>=Ssilv;

/*Demanda minima de Pgold*/
s.t. demMinGold: 8*Pgold>=Sgold;

/*Ingresos*/
s.t. ing1: 1500*Sgold+700*Ssilv>=Ingresos;
s.t. ing2: 1500*Sgold+700*Ssilv<=Ingresos;

/*Egresos*/
s.t. egr1: 800*P+700*2+1500*100<=Egresos;
s.t. egr2: 800*P+700*2+1500*100>=Egresos;


end;
