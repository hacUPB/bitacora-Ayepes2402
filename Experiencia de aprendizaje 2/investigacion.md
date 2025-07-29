## Actividad 1

¿Qué es la entrada-salida mapeada a memoria?  
Es cuando una parte de la memoria del computador no se usa para datos normales, sino que está conectada a los dispositivos de entrada y salida. Entonces al leer o escribir en esas direcciones en realidad estamos leyendo el teclado o dibujando en la pantalla.  

¿Cómo se implementa en la plataforma Hack?  
La pantalla (@SCREEN) está mapeada desde la dirección 16384 hasta 24575. Cada palabra (16 bits) controla 16 pixeles en blanco/negro.  

El teclado (KBD) está en la dirección 24576. Si se presiona una tecla, esta dirección contiene su código y no hay ninguna tecla presionada, contiene 0.  

Investiga el funcionamiento del programa con el simulador.  
Lo que hace este programa es que si precionas la letra M este enciende los primeros 16 píxeles y si no es M los apaga.
