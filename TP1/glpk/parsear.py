# Crea el archivo datos_x_ciudades.dat con los datos para glpk.
# Se necesita el archivo distancia_ciudad_a_ciudad.txt.
# Se ejecuta con:
# 	python3 parser.py

X = 13 # cantidad de ciudades
M = 1000000 # cte M
eps = 0.000000000000001 #cte epsilon


data = open("distancia_ciudad_a_ciudad.txt", 'r');
data_str = data.read();
data_list = data_str.split()

data_file = open("datos_x_ciudades.dat", 'w')

data_file.write("data;\n")
data_file.write("param M := " + str(M) + ";\n")
data_file.write("param eps := " + str(eps) + ";\n\n")

matrix = []
for i in range(0, len(data_list), 48):
	matrix.append(data_list[i:i+48]);

data_file.write("set CIUDADES:= ")
for i in range(X):
	data_file.write(str(i) + ' ');
data_file.write(";\n")

data_file.write("param DISTANCIA :")
for i in range(X):
	data_file.write(str(i) + ' ');
data_file.write(":=\n\n")

for i in range(0, X, 1):
	row_list = matrix[i][0:X]
	for j, elem in enumerate(row_list):
		if float(elem) == 0:
			row_list[j] = '.'
	row_str = ' '.join(row_list)
	data_file.write(' ' + str(i) +  " " + row_str + '\n');
	# no es para nada optimizado..
data_file.write(";\n\n")

data_file.write("end;\n")

data_file.close()

print("Se creo el archivo datos_x_ciudades.dat con", X, "ciudades.")

