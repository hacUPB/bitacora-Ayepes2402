## Actividad 3
Intento de actividad en palabras  

Paso 1: Primero miro la parte del teclado. Si la tecla que está en memoria no es la d, entonces me voy para la parte donde se borra la pantalla.  
Paso 2: Para empezar a borrar, me voy a la dirección de la pantalla (@16348)  
Paso 3: Esa dirección la guardo en una variable para ir avanzando de a una.  
Paso 4: Luego en un ciclo voy poniendo cero en donde esté parado, eso hace que se apague todo ese bloque de puntos.  
Paso 5: Después de poner cero le sumo uno para pasar a lo que sigue, como si fuera la siguiente parte de la pantalla.  
Paso 6: Repito lo mismo hasta que llego casi al final (24576) y ahí ya paro y vuelvo al inicio.  

## Actividad 4

¿Qué es la entrada-salida mapeada a memoria?  
Es cuando una parte de la memoria del computador no se usa para datos normales, sino que está conectada a los dispositivos de entrada y salida. Entonces al leer o escribir en esas direcciones en realidad estamos leyendo el teclado o dibujando en la pantalla.  

¿Cómo se implementa en la plataforma Hack?  
La pantalla (@SCREEN) está mapeada desde la dirección 16384 hasta 24575. Cada palabra (16 bits) controla 16 pixeles en blanco/negro.  

El teclado (KBD) está en la dirección 24576. Si se presiona una tecla, esta dirección contiene su código y no hay ninguna tecla presionada, contiene 0.  

Investiga el funcionamiento del programa con el simulador.  
Lo que hace este programa es que si precionas la letra M este enciende los primeros 16 píxeles y si no es M los apaga.




