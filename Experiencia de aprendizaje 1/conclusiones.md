//complementarlas mas
### Reto 1  
Lo que hice fue guardar el número 1798 en el registro D. Primero usé @1798 para poner ese valor en el registro A, y luego con D=A pasé ese número al registro D. Así ya tengo guardado ese dato en D.  

### Reto 2  
Primero puse el 69 en el registro A con @69, luego lo pasé al registro D con D=A. Después usé @100 para ir a la dirección 100 de la RAM y finalmente con M=D guardé ahí el número 69. 

### Reto 3  
Primero guardé el número 100 en la posición 24 de la RAM. Luego tomé ese valor (el 100) con D=M y lo guardé en la posición 200.  

### Reto 4  
Primero guardé el número 25 en la posición 100 de la RAM. Luego, con @15 y D=A, puse el número 15 en el registro D. Después, con @100 y M=M-D, resté 15 al valor que estaba en la posición 100, y el resultado  se volvió a guardar en esa misma posición. Así que al final, la posición 100 tiene el valor 10.  

### Reto 5  
En este ejercicio sumé lo que hay en la posición 0 de la RAM con lo que hay en la posición 1, y a eso le sumé el número 69. Primero guardé el valor de la posición 0 en D, luego le sumé el valor de la posición 1. Después, con @69 y D=D+A, le sumé la constante 69. Por último, guardé el resultado en la posición 2 de la RAM.  

### Reto 6  
Primero usé @100 para indicar la dirección a la que quiero saltar, y luego D;JEQ para que el salto ocurra solo si D es igual a cero.  

### Reto 7  
Primero guardé el número 50 en la posición 100 de la RAM. Luego comparé ese valor con 100 restando 100 - RAM[100], y como el resultado fue negativo (porque 50 es menor que 100), se hizo el salto a la posición 20 de la ROM con D;JLT    

### Reto 10
En este programa lo que hice fue tomar el valor que está en R0 y guardarlo en el registro D. Luego, con M=D+D, quise guardar el doble de ese valor en R1 para asi generar la operacion de 2 * R0  

### Reto 11  











