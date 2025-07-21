### Actividad 01

* ¿Qué es un computador digital moderno?
  
Un computador digital moderno es un aparato que procesa la información usando ceros y unos, que es el lenguaje que entiende. Está hecho para seguir instrucciones llamadas programas, y gracias a eso puede realizar muchas tareas como crear documentos, buscar información en internet, ver películas o controlar impresoras y otros equipos.

  
* ¿Cuáles son sus partes?

Procesador (CPU): Es quien ejecuta las instrucciones.  
Memoria RAM: Guarda temporalmente los datos mientras se usan.  
Almacenamiento: Guarda programas, fotos, archivos, etc.  
Pantalla, teclado, mouse, etc.: Son los elementos para interactuar con el computador.


### Actividad 02

* ¿Qué es entonces un programa?

  
* ¿Qué es un lenguaje ensamblador?

  
* ¿Qué es lenguaje de máquina?

  

### Actividad 03
* ¿Qué son PC, D y A?

  
* ¿Para qué los usa la CPU?

  

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
a