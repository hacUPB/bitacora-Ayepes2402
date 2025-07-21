### Actividad 01

* ¿Qué es un computador digital moderno?
  
Un computador digital moderno es un aparato que procesa la información usando ceros y unos, que es el lenguaje que entiende. Está hecho para seguir instrucciones llamadas programas, y gracias a eso puede realizar muchas tareas como crear documentos, buscar información en internet, ver películas o controlar impresoras y otros equipos.

  
* ¿Cuáles son sus partes?

Procesador (CPU): Es quien ejecuta las instrucciones.  
Memoria RAM: Guarda temporalmente los datos mientras se usan.  
Memoria ROM: Contiene informacion que solo se puede leer (No see borra como la RAM) 
Dispositivos de entrada: Sirven para darle informacion al computador
Dispositivos de salida: Reproducen la informacion que el computador procesa


### Actividad 02

* ¿Qué es entonces un programa?

Un programa es una serie de instrucciones que puede ser secuencial que se guarda en la memoria ram (Memoria de Acceso Aleatorio) y rom (Read-Only Memory).

  
* ¿Qué es un lenguaje ensamblador?

Es el lenguaje que traduce el lenguaje de maquina para los humanos.
  
* ¿Qué es lenguaje de máquina?

  Lenguaje compuesto por ceros y unos el cual seria el lenguaje de la maquina.

### Actividad 03
* ¿Qué son PC, D y A?

PC: Es el encargado de guardar la direccion de la siguiente instruccion.  
D: Guarda datos temporales.  
A: Guarda un numero o una direccion en la memoria.
  
* ¿Para qué los usa la CPU?

PC se usa para las instrucciones que van a estar mas adelante y asi poderse ejecutar en el orden correcto.  
D se usa para guardar valores mientras uno elige que hacer con ellos (operaciones, etc)
A se usa para guardar un numero o una direccion en la memoria.
  

* Mover el contenido de la posición 200 a la 100 
```
@200  
D=M 
@100 
M=D 
 ```
### Actividad 4:  
 ```
@16384  
D = A  
@16  
M = D 
 ```
* Sumarle 20 a la que ya está en el registro 16 
 ```
@16384  
D = A  
@16  
M = D 
A = 20 
D = A 
@16 
M= D + M 
 ```
* Ahora escribe un programa en lenguaje ensamblador que guarde en la posición 32 de la RAM un 100 
 ```
@16384  
D = A  
@16  
M = D 
A = 20 
D = A 
@16 
M= D + M 
@100 
D=A 
@32 
M=D 
 ```
* En la posición 3 lo que tiene restarle 15 
```
@15 
D=A 
@3 
M=M-D 
 ```
* RAM[2] = RAM[0] + RAM[1] + 17 
 ```
@0 
D=M 
@1 
D=D+M 
@17 
D=D+A 
@2 
M=D 
```
