**Actividad 3**
Intento de actividad en palabras  
Paso 1: Primero miro la parte del teclado. Si la tecla que está en memoria no es la d, entonces me voy para la parte donde se borra la pantalla.  
Paso 2: Para empezar a borrar, me voy a la dirección de la pantalla (@16348)  
Paso 3: Esa dirección la guardo en una variable para ir avanzando de a una.  
Paso 4: Luego en un ciclo voy poniendo cero en donde esté parado, eso hace que se apague todo ese bloque de puntos.  
Paso 5: Después de poner cero le sumo uno para pasar a lo que sigue, como si fuera la siguiente parte de la pantalla.  
Paso 6: Repito lo mismo hasta que llego casi al final (24576) y ahí ya paro y vuelvo al inicio.  


**Actividad 4**
Traté de hacerlo de la misma manera que con la d pero teniendo en cuenta que e es @101 y que tendria el @clear.  

no funcionó y fue porque se me olvidó poner (clear_loop) y (clear) aunque al ponerlo sigue sin funcionar (no dibuja).  
Despues descubri que no me dibujaba porque me faltó un (LOOP) al inicio, despues de poner el (LOOP) empezó a dibujar, el problema es que no borra.
```
(LOOP) //Faltaba este
@24576
D=M
@100
D=D-A       
@draw
D;JEQ       
```
Pensé que el error era que el @clear estaba en minusculas y tenía que ser en mayusculas pero eso dañó todo el progreso que logré y ya no dibujaba
```
@24576
D=M
@101
D=D-A
@CLEAR //lo cambié a mayusculas y se dañó todo, ya no dibujaba
D;JEQ       
@LOOP
0;JMP
```
Regresé el @clear a minuscula y cambié mejor el (clear) a minusculas y funcionó
```
(clear)
    @SCREEN
    D=A
    @addr
    M=D 
```
En conclusión, gran parte de los problemas fue por no prestar atencion a detalles como poner el (LOOP) para cerrarlo, poner el (clear) y (CLEAR_LOOP) para que borre y tener mucho cuidado a la hora de escribir las eetiquetas porque tienen que coincidir en si estan en mayusculas o minusculas.