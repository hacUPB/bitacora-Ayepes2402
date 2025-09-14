**Preguntas para guiar el proceso**
1. **Exploración creativa:** ¿Qué tipo de efecto visual quieres lograr? ¿Cómo pueden ayudarte las diferentes estructuras de datos a lograr ese efecto?  

**Fuegos artificiales:** arreglo de partículas y pila para manejar explosiones que aparecen y desaparecen.   

El efecto visual que quiero lograr es un show de fuegos artificiales que explotan en el cielo y se dispersan en muchas direcciones con colores llamativos. Para organizar esto, **usaría un arreglo de partículas**, ya que cada explosión genera varias al mismo tiempo. También usaría una **pila de explosiones**, donde voy guardando las que aparecen y eliminando las que ya se apagaron. Así puedo controlar de forma ordenada cómo nacen y desaparecen los fuegos artificiales, aunque en la pantalla parezca un espectáculo caótico.

**Nota 1:** Se usa pila porque la última explosión creada será la primera en revisarse y eliminarse cuando termine.  

**Nota 2:** los puntitos estarian todos juntos en un arreglo.

2. **Gestión de memoria:** ¿Qué consideraciones debes tener en cuenta al gestionar dinámicamente la memoria de los objetos? ¿Cómo asegurar que no haya fugas de memoria?   
Hay que tener cuidado de liberar esa memoria cuando ya no se usa. Si no se hace, la memoria se va llenando poco a poco y el programa se vuelve lento o incluso se puede cerrar solo. Para evitar fugas de memoria, cada vez que una explosión termina, borro todas sus partículas usando delate y libero el espacio que ocupaban. También debo revisar que los punteros no queden apuntando a nada (reviso si termina en nullptr), porque eso puede causar errores. Así me aseguro de que el programa use solo la memoria necesaria y funcione de manera fluida.

3. **Interacción y dinamismo:** ¿Cómo puedes hacer que la interacción del usuario influya en múltiples estructuras de datos simultáneamente para crear un efecto visual coherente y dinámico?   
La interacción del usuario hace que los fuegos artificiales cambien en tiempo real. Por ejemplo, al hacer clic se agrega una nueva explosión a la pila y tambien podria hacer que cuando use una tecla cambie el color de los fuegos artificiales.

4. **Optimización:** ¿Qué técnicas puedes implementar para optimizar la gestión de memoria y el rendimiento de tu aplicación mientras mantienes una experiencia visual rica y fluida?  
Para que el programa sea rápido y no consuma mucha memoria, libero las partículas cuando ya no sirven, pongo un límite a las explosiones activas y evito crear más de las necesarias. Así la obra se ve fluida y ordenada.  

**Nota:** Las partículas se crean con new[] cuando aparece la explosión, y se liberan con delete[] cuando desaparece.

