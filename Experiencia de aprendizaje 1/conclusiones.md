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
En este programa lo que hice fue tomar el valor que está en R0 y guardarlo en el registro D. Luego, con M=D+D, quise guardar el doble de ese valor en R1 para asi generar la operacion de 2 * R0.   

### Reto 11  
Primero inicialicé la variable i con el valor 1000 usando @1000, D=A y luego @i seguido de M=D. Después comencé un bucle con LOOP donde cada vez reviso si i ya llegó a 0. Para eso cargo i en D y uso D;JEQ para saltar a CONT si ya es igual a 0. Si no, le resto 1 a i con M=M-1 y vuelvo al inicio del bucle con @LOOP y 0;JMP.  

### Reto 12  
En este programa lo que hice fue sumar el contenido de R1 con el de R2, y después le sumé la constante 69. Para eso usé @1 y D=M para guardar R1 en D, luego le sumé R2 con D=D+M, y después la constante 69 con D=D+A. Al final, guardé todo el resultado en R4 con M=D. De esta forma, R4 queda con el valor total de R1 + R2 + 69.  

### Reto 13  
En este programa lo que intenté hacer fue verificar si el valor que está en R0 es mayor o igual a 0. Primero cargué R0 en D con @R0 y D=M, luego usé @0 y D=D-A para comparar con cero. Después, con D;JGE quise que saltara si el número era mayor o igual a 0. Si no se cumple, el programa guarda -1 en R1, y si sí se cumple, guarda 1 en R1. Al final puse un bucle infinito con (LOOP).  

### Reto 14  
Primero usé @R1 y A=M para moverme a esa dirección, luego con D=M tomé el valor que hay ahí, y por último lo guardé en R4 con @R4 y M=D. Así logré que R4 tenga el mismo contenido que hay en la dirección guardada en R1.  

### Reto 15  
lo que quise hacer fue guardar -1 en una región de memoria, comenzando desde la dirección que está en R0, y repitiéndolo tantas veces como indica el valor de R1. Usé LOOP para que en cada vuelta intente guardar -1 en la posición apuntada por R0. Luego le resté 1 a R1 para ir contando cuántas posiciones faltan, y sumé 1 a R0 para avanzar a la siguiente dirección. El ciclo se repite mientras R1 no sea cero usando D;JNE.  

### Reto 16  
En este programa empecé el arreglo con un tamaño de 10, y también creé una variable sum que empieza en 0, y otra variable j que decidi usar como contador.  
Dentro del bucle (LOOP), traté de acceder a arr[j] sumando j con la dirección base del arreglo, y luego sumar ese valor a sum. Después aumenté j para seguir al siguiente elemento. El ciclo se repite mientras j < 10. 

### Reto 17 
En este programa lo que hice fue comparar si el valor que hay en D es igual a 7. Para eso le resté 7 con D=D-A, y luego usé D;JEQ para que salte a la posición 69 si el resultado es cero.  

### Reto 18
Este ejercicio permite comprender cómo una imagen puede representarse en memoria binaria y cómo traducirla a instrucciones concretas en un sistema computacional simple, cada instrucción escribe una porción de la imagen en la RAM de video. Esto conecta conceptos de memoria gráfica, direcciones de memoria, y manipulación de bits.  

### Reto 19  

### Reto 20  














