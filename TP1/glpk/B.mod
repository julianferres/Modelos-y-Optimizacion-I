#Resolución Parte B-Contenido del archivo 1.mod
/*Declaración de variables*/
var A >= 0;
var B >= 0;
var C >= 0;

/*Definición del funcional*/
maximize z: 50*A+40*B+30*C;


/*Restricciones*/
/*Procesamiento de cada equipo*/
s.t. procEq1: 0.8*A+0.8*B+0.3*C <= 160;
s.t. procEq2: 0.6*A+1.2*B <= 180;
s.t. procEq3: 0.6*A+1*B+0.6*C <= 110;

/* Demandas maximas y minimas */
s.t. demMaxA: A<= 100;
s.t. demMaxB: B<= 100;
s.t. demMaxC: B>= 80;

end;
