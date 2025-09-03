### Actividad 1  
**2. Realiza evaluaciones formativas. Dile a ChatGPT que te genere preguntas para verificar si entiendes cómo funciona el programa. Trata de verificar tus hipótesis usando el depurador y luego con las conclusiones del experimento responde la pregunta de ChatGPT. Continúa con este proceso hasta que estés seguro de que entiendes cómo funciona el programa.**

**¿Qué diferencia hay entre new Node(...) y declarar un Node en el stack? ¿Por qué en la lista se necesita new?**  
Cuando uso new creo el objeto en el heap, que es memoria dinámica y no se borra sola, yo debo liberarla con delete. En cambio, si declaro el objeto normal, se guarda en el stack y desaparece solo cuando la función termina. En la lista se usa new porque necesito que los nodos vivan más tiempo y no se borren al salir de una función.

**¿Qué pasa con los nodos cuando presiono la tecla c? ¿Qué ocurriría si no existiera clear() o no se usara delete?**  
Cuando presiono c, la función clear() borra uno por uno todos los nodos con delete y así se libera la memoria. Si no existiera clear() o no se borraran, la memoria quedaría ocupada hasta que cierre el programa, y eso sería una fuga de memoria.

**¿Por qué en update se usan las variables prevX y prevY junto con tempX y tempY? ¿Qué pasaría si no estuvieran?**  
Se usan porque cada nodo debe copiar la posición que tenía el nodo anterior, y para eso hay que guardar el valor antes de sobreescribirlo. Si no estuvieran, se perderían las posiciones originales y todos los nodos quedarían en el mismo lugar, o sea que la serpiente no se vería moviéndose bien.

**¿Cómo puedo verificar que cada nodo sigue al anterior? ¿Qué pasa si agrego más nodos después del setup()?**  
Puedo poner mensajes con ofLog() o usar el depurador para ver las posiciones de cada nodo en cada actualización, y ahí me doy cuenta de que sí siguen al anterior. Si agrego más nodos después del setup(), la serpiente se vuelve más larga y esos nuevos nodos también empiezan a moverse siguiendo al resto.

**¿Cómo saber si no hay fugas de memoria cuando termina el programa?**  
El destructor de la lista llama a clear(), y ahí se borran todos los nodos. Si pongo un mensaje en el destructor de Node, puedo ver que se imprimen todos al final, lo que significa que se liberaron bien y no quedaron fugas de memoria.

**3. ¿Qué es una lista enlazada y en qué se diferencia de un arreglo en cuanto a la forma en que los elementos están almacenados en la memoria?**  
Una lista enlazada es un conjunto de nodos que se conectan con punteros y pueden estar en distintas partes de la memoria y un arreglo guarda todos los elementos juntos, uno al lado del otro, en memoria.

**4. Al observar el código de una lista enlazada en C++, ¿Cómo crees que se vinculan los nodos entre sí? ¿Qué estructura se utiliza para lograr esta conexión?**  
En una lista enlazada, los nodos se conectan entre sí usando punteros. Cada nodo guarda un dato y un puntero llamado next que apunta al siguiente nodo en la lista. Gracias a esta estructura, los nodos pueden estar en distintas partes de la memoria pero siguen unidos como una cadena.

**5. ¿Cómo se gestiona la memoria en una lista enlazada? Investiga cómo se crea y se destruye un nodo en memoria utilizando el operador new y delete en C++.**  
En una lista enlazada cada nodo se crea en el heap usando new, y como no se borra solo, el programador debe liberar la memoria con delete cuando ya no se necesite.  

**Investiga cómo se crea y se destruye un nodo en memoria utilizando el operador new y delete en C++**  
En C++ un nodo de una lista enlazada se crea con new, que guarda el nodo en la memoria heap. Para borrarlo se usa delete, que libera esa memoria. Si no se hace, queda ocupada y se produce una fuga. En una lista, cada nodo se hace con new y al eliminarla se debe recorrer y borrarlos con delete.

**6. Considerando la estructura de una lista enlazada, ¿qué ventajas ofrece en comparación con un arreglo cuando se trata de insertar o eliminar elementos en posiciones intermedias?**  
La ventaja de una lista enlazada es que para insertar o eliminar un nodo en medio no hace falta mover todos los demás elementos, como pasa en un arreglo. Solo se cambian los punteros de los nodos que están alrededor y listo. Esto hace que esas operaciones sean más rápidas y eficientes en una lista que en un arreglo.

**7. En el código presentado, ¿Cómo se asegura que no haya fugas de memoria? ¿Qué papel juega el destructor en la clase LinkedList?**   
En el código no hay fugas de memoria porque la función clear() recorre todos los nodos y los borra con delete. El destructor de la clase LinkedList llama a clear() automáticamente cuando el objeto se destruye, asegurando que toda la memoria de los nodos se libere al final del programa.

**8. ¿Qué sucede en la memoria cuando se invoca el método clear() en una lista enlazada? Explica paso a paso cómo se liberan los recursos.**  
Cuando se llama a clear() en una lista enlazada, el programa recorre cada nodo, guarda el siguiente, borra el actual con delete para liberar la memoria y avanza al siguiente. Al final, head y tail quedan en nullptr y el tamaño en 0, dejando la lista vacía y sin fugas de memoria.

**9. Explica cómo cambia la estructura en memoria de una lista enlazada al agregar un nuevo nodo al final de la lista. ¿Cómo afecta esto al rendimiento de la lista enlazada?**  
Al agregar un nodo al final de una lista enlazada, se crea un nuevo nodo en el heap y el puntero next del último nodo existente se actualiza para que apunte a este nuevo nodo. Además, el puntero tail de la lista se mueve para apuntar al nodo recién agregado. Como no es necesario mover los demás nodos, la inserción al final es rápida y mantiene un buen rendimiento, incluso si la lista es larga.

**10. Analiza una situación en la que utilizar una lista enlazada sería más ventajoso que utilizar un arreglo. Justifica tu respuesta considerando la gestión de memoria y las operaciones de inserción y eliminación.**  
Una lista enlazada es más ventajosa cuando necesitamos agregar o eliminar elementos frecuentemente en posiciones intermedias o al inicio, porque solo se cambian los punteros de los nodos y no hay que mover todos los elementos, como ocurre en un arreglo. Además, la lista enlazada usa memoria dinámica, reservando solo lo que se necesita, mientras que un arreglo requiere un espacio fijo o costoso de redimensionar, lo que puede desperdiciar memoria o hacer más lentas las operaciones.

**11. Después de estudiar el manejo de memoria en listas enlazadas, ¿Cómo aplicarías este conocimiento para diseñar una estructura de datos personalizada para una aplicación creativa? ¿Qué aspectos considerarías para asegurar la eficiencia y evitar fugas de memoria?**  
Podría usar listas enlazadas para crear estructuras dinámicas como un sistema de partículas o un historial de acciones que se pueda modificar fácilmente. Para ser eficiente, usaría punteros como head y tail para insertar o eliminar sin mover todos los elementos. Para evitar fugas, liberaría cada nodo con delete y usaría destructores que limpien toda la estructura al final.

**12. Reflexiona sobre las diferencias en la gestión de memoria entre C++ y un lenguaje con recolección de basura automática como C#. ¿Qué ventajas y desafíos encuentras en la gestión explícita de memoria en C++ al trabajar con estructuras de datos?**  
En C++ la memoria se gestiona de forma explícita: uno crea objetos con new y debe liberarlos con delete.  
En C#, la recolección de basura se encarga de liberar la memoria automáticamente.  

La ventaja de C++ es que se tiene control total sobre cuándo y cómo se usa la memoria, lo que puede mejorar el rendimiento y reducir el uso innecesario. El desafío es que hay que ser cuidadoso para no olvidar liberar memoria ni borrar un mismo objeto dos veces, porque eso puede causar fugas o errores difíciles de detectar. Esto requiere disciplina al diseñar estructuras de datos dinámicas como listas enlazadas o árboles.

**13. Imagina que estás optimizando una pieza de arte generativo que usa listas enlazadas para representar elementos en movimiento. ¿Qué consideraciones tomarías en cuenta para garantizar que la gestión de la memoria sea eficiente y que no ocurran fugas de memoria?**  
Para que la memoria sea eficiente, me aseguraría de crear cada nodo con new solo cuando sea necesario y borrarlo con delete cuando el elemento ya no se use. Usaría destructores y funciones como clear() para liberar todos los nodos al final o cuando reinicie la escena. También vigilaría que los punteros como head y tail siempre se actualicen correctamente y los pondría en nullptr después de borrar nodos para evitar punteros colgantes y fugas de memoria.

**14. Pruebas: pregunta a ChatGPT cómo podrías probar las partes del programa y el programa completo. Luego realiza las pruebas y verifica si los resultados coinciden con tus expectativas.**  

### Actividad 2

1. **Entendiendo la aplicación**: comienza explorando detenidamente cómo funciona el programa. Usa un un modelo del lenguaje como ChatGPT y el depurador para que verifiques las explicaciones que te propone ChatGPT. Puedes escribir el prompt: quiere entender de manera muy detallada el siguiente programa escrito en C++ y el openframeworks. Luego le das el código. Ve preguntando lo que no entiendas. recuerda ir usando al mismo tiempo el depurador de visual studio.
2. **Realiza evaluaciones formativas**. Dile a ChatGPT que te genere preguntas para verificar si entiendes cómo funciona el programa. Trata de verificar tus hipótesis usando el depurador y luego con las conclusiones del experimento responde la pregunta de ChatGPT. Continúa con este proceso hasta que estés seguro de que entiendes cómo funciona el programa.
3. **Pruebas:** pregunta a ChatGPT cómo podrías probar las partes del programa y el programa completo. Luego realiza las pruebas y verifica si los resultados coinciden con tus expectativas.

Preguntas de reflexión para el stack:

1. ¿Cómo se gestiona la memoria en una implementación manual de un stack en C++? Reflexiona sobre cómo el uso de new y delete en la creación y destrucción de nodos afecta el rendimiento y la seguridad de tu programa.
2. ¿Por qué es importante liberar la memoria cuando se desapila un nodo en un stack? Considera las consecuencias de no liberar memoria en términos de fugas de memoria y cómo esto puede impactar aplicaciones de largo tiempo de ejecución.
3. ¿Qué diferencias existen entre usar un stack de la STL (std::stack) y crear un stack manualmente? Explora cómo la abstracción que proporciona la STL puede simplificar la implementación, pero también cómo una implementación manual ofrece mayor control sobre la gestión de recursos.
4. ¿Cómo afecta la estructura de un stack al orden de acceso y eliminación de elementos? Analiza cómo la naturaleza LIFO (Last In, First Out) del stack influye en los tipos de problemas que esta estructura de datos puede resolver eficientemente.
5. ¿Cómo podrías modificar el stack para almacenar tipos de datos más complejos (e.g., objetos con múltiples atributos) sin causar problemas de memoria? Reflexiona sobre cómo gestionar adecuadamente la memoria para objetos más complejos y cómo esto afectaría tu implementación actual.