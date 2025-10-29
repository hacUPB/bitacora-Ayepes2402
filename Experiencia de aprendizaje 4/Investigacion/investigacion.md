### Actividad 1  
**2. Realiza evaluaciones formativas. Dile a ChatGPT que te genere preguntas para verificar si entiendes cómo funciona el programa. Trata de verificar tus hipótesis usando el depurador y luego con las conclusiones del experimento responde la pregunta de ChatGPT. Continúa con este proceso hasta que estés seguro de que entiendes cómo funciona el programa.**

**¿Qué diferencia hay entre new Node(...) y declarar un Node en el stack? ¿Por qué en la lista se necesita new?**  
Cuando uso new creo el objeto en el heap, que es memoria dinámica y no se borra sola, y debo liberarla con delete. En cambio, si declaro el objeto normal, se guarda en el stack y desaparece solo cuando la función termina. En la lista se usa new porque necesito que los nodos vivan más tiempo y no se borren al salir de una función.

**¿Qué pasa con los nodos cuando presiono la tecla c? ¿Qué ocurriría si no existiera clear() o no se usara delete?**  
Cuando presiono c, la función clear() borra uno por uno todos los nodos con delete y así se libera la memoria. Si no existiera clear() o no se borraran, la memoria quedaría ocupada hasta que cierre el programa, y eso sería una fuga de memoria.

**¿Por qué en update se usan las variables prevX y prevY junto con tempX y tempY? ¿Qué pasaría si no estuvieran?**  
Se usan porque cada nodo debe copiar la posición que tenía el nodo anterior, y para eso hay que guardar el valor antes de sobreescribirlo. Si no estuvieran, se perderían las posiciones originales y todos los nodos quedarían en el mismo lugar, o sea que la serpiente no se vería moviéndose bien.

**¿Cómo puedo verificar que cada nodo sigue al anterior? ¿Qué pasa si agrego más nodos después del setup()?**  
Puedo usar el depurador para ver las posiciones de cada nodo en cada actualización, y ahí me doy cuenta de que sí siguen al anterior. Si agrego más nodos después del setup(), la serpiente se vuelve más larga y esos nuevos nodos también empiezan a moverse siguiendo al resto.

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
Mi reflexión sobre lo que probe es que gracias a probar el código con el depurador es muchisimo más sencillo entender cómo funciona el código ya que lo vas revisando por partes aunque sigue siendo un poco confuso para mi el uso de este.  

### Actividad 2

**1. Entendiendo la aplicación**: comienza explorando detenidamente cómo funciona el programa. Usa un un modelo del lenguaje como ChatGPT y el depurador para que verifiques las explicaciones que te propone ChatGPT. Puedes escribir el prompt: quiere entender de manera muy detallada el siguiente programa escrito en C++ y el openframeworks. Luego le das el código. Ve preguntando lo que no entiendas. recuerda ir usando al mismo tiempo el depurador de visual studio.  

**Parte 1: Stack (pila)**  
Estructuras principales:    
Node: es un nodo que guarda una posición (x, y) y un puntero next que apunta al siguiente nodo.  
Stack: es la clase de la pila, tiene un puntero top que siempre apunta al nodo de arriba de la pila.  
Métodos clave:  
push(x, y):  
Crea un nuevo nodo con new.  
Hace que ese nodo apunte al anterior top.  
Cambia top para que apunte al nuevo nodo.  
Así el nuevo siempre queda arriba de la pila.  

**pop():**
Guarda el nodo que está en top.  
Mueve top al siguiente nodo.  
Libera con delete el nodo que estaba antes.  
Así se elimina el último que entró.  

**clear():**
Llama a pop() en un ciclo hasta que no quede nada.
Se usa en el destructor para evitar fugas de memoria.

**display():**
Recorre los nodos desde top hacia abajo y dibuja un círculo en cada posición.

**Uso en ofApp:**  
Si presionas la tecla a, se hace un push en la posición del mouse → se apila un círculo.  
Si presionas la tecla d, se hace pop → se desapila el último círculo.  
En draw(), se dibujan todos los círculos que están en la pila.  

**Parte 2: Queue (cola)**
Estructuras principales:  
Node: es el mismo que en la pila.  
Queue: tiene dos punteros:  
front: apunta al primero en la cola.  
rear: apunta al último en la cola.  

**Métodos clave:**
enqueue(x, y):  
Crea un nuevo nodo con new.  
Si la cola está vacía (rear == nullptr), el nuevo nodo es tanto front como rear.  
Si no está vacía, rear->next apunta al nuevo nodo y rear se actualiza.  
Así el nuevo siempre queda al final.  

**dequeue():**
Guarda el nodo que está en front.  
Avanza front al siguiente nodo.  
Si front se vuelve nullptr, también rear se vuelve nullptr (cola vacía).   
Libera con delete el nodo eliminado.   

**clear():**  
Llama a dequeue() en un ciclo hasta vaciar la cola.

**display():**  
Recorre desde front hasta rear y dibuja un círculo en cada posición.

**Uso en ofApp:**
Si presionas la tecla a, se hace enqueue en la posición del mouse → se agrega un círculo al final.  
Si presionas la tecla d, se hace dequeue → se elimina el primer círculo en la cola.  
En draw(), se dibujan todos los círculos de la cola.  

**Diferencia clave entre Stack y Queue**

Stack (pila) → LIFO (Last In, First Out): el último en entrar es el primero en salir.  
Queue (cola) → FIFO (First In, First Out): el primero en entrar es el primero en salir.  

**2. Realiza evaluaciones formativas**. Dile a ChatGPT que te genere preguntas para verificar si entiendes cómo funciona el programa. Trata de verificar tus hipótesis usando el depurador y luego con las conclusiones del experimento responde la pregunta de ChatGPT. Continúa con este proceso hasta que estés seguro de que entiendes cómo funciona el programa.  

**Si haces push(100,100) en una pila vacía, ¿qué valor tiene circleStack.top->next?**  
Cuando el stack está vacío, el nuevo nodo no tiene nadie debajo, así que su next se queda en nullptr (ya que no apunta a ningun otro lado.)

**Si haces push(A), push(B), push(C) en ese orden, ¿qué nodo queda en circleStack.top?**  
El nodo C, el stack funciona como último en entrar, primero en salir por lo tanto C es el último en entrar y se convierte en el top.

**Después de esos 3 push, si llamas una vez a pop(), ¿qué nodo se libera de memoria?**  
Se libera el nodo C porque estaba en el top por lo tanto el top pasa a apuntar a B.

**Si sigues haciendo pop() hasta vaciar la pila, ¿qué pasa con circleStack.top?**  
circleStack.top vuelve a nullptr, sí el stack queda vacío y ya no hay nodos en memoria.  

**Si haces enqueue(100,100) en una cola vacía, ¿qué ocurre con front y rear?**  
ambos (front y rear) apuntan al mismo nodo debido a que ese único nodo es el primero y el último.

**Si haces enqueue(A), enqueue(B), enqueue(C) en ese orden, ¿qué nodo queda en front y cuál en rear?**   

* front = A (el primero en entrar).  
* rear = C (el último en entrar).  

**Si desencolas todos los nodos, ¿qué pasa con front y rear?**   
Ambos vuelven a nullptr. Eso indica que la cola está vacía y que no hay memoria asignada.

**3. Pruebas:** pregunta a ChatGPT cómo podrías probar las partes del programa y el programa completo. Luego realiza las pruebas y verifica si los resultados coinciden con tus expectativas.  

**Preguntas de reflexión para el stack:**

**1. ¿Cómo se gestiona la memoria en una implementación manual de un stack en C++? Reflexiona sobre cómo el uso de new y delete en la creación y destrucción de nodos afecta el rendimiento y la seguridad de tu programa.**  
En el stack cada vez que hago push se crea un nodo con new y ocupa memoria. Esa memoria se libera con delete cuando uso pop o clear. Si no libero los nodos, la memoria se va llenando y el programa se vuelve más lento o puede fallar.

**2. ¿Por qué es importante liberar la memoria cuando se desapila un nodo en un stack? Considera las consecuencias de no liberar memoria en términos de fugas de memoria y cómo esto puede impactar aplicaciones de largo tiempo de ejecución.**  
Porque si no libero el nodo, queda ocupado en la memoria sin usarse y eso causa fugas que dañan el rendimiento del programa.

**3. ¿Qué diferencias existen entre usar un stack de la STL (std::stack) y crear un stack manualmente? Explora cómo la abstracción que proporciona la STL puede simplificar la implementación, pero también cómo una implementación manual ofrece mayor control sobre la gestión de recursos.**  
El std::stack es más fácil y seguro porque gestiona la memoria solo. El stack manual da más control, pero también más riesgo de errores de puntero y fugas.

**4. ¿Cómo afecta la estructura de un stack al orden de acceso y eliminación de elementos? Analiza cómo la naturaleza LIFO (Last In, First Out) del stack influye en los tipos de problemas que esta estructura de datos puede resolver eficientemente.**  
El stack es LIFO: el último en entrar es el primero en salir. Esto sirve para problemas donde hay que deshacer pasos o volver atrás.

**5. ¿Cómo podrías modificar el stack para almacenar tipos de datos más complejos (e.g., objetos con múltiples atributos) sin causar problemas de memoria? Reflexiona sobre cómo gestionar adecuadamente la memoria para objetos más complejos y cómo esto afectaría tu implementación actual.**  
Podría cambiar el nodo para que guarde objetos más grandes o estructuras. Pero hay que tener cuidado de liberar bien la memoria de cada objeto al hacer pop o clear.

**Preguntas de autoevaluación:**

**1. ¿Puedo explicar detalladamente cómo funciona el proceso de apilar y desapilar nodos en un stack, incluyendo la gestión de memoria?**  
Sí, En push creo un nodo con new y lo pongo como top. En pop elimino el nodo de top con delete y top pasa al siguiente.

**2. ¿Soy capaz de identificar y corregir una fuga de memoria en una implementación de stack manual?**  
Sí, Si un nodo no se borra al hacer pop o clear, reviso el código y agrego delete para liberar la memoria.

**3. ¿Puedo modificar el stack para que incluya una función que busque un elemento específico, sin alterar el orden de los elementos apilados?**   
Sí, Puedo recorrer los nodos desde top con un puntero y comparar valores sin cambiar nada del stack.

**4. ¿Entiendo cómo la estructura LIFO del stack afecta el flujo de datos y puedo dar ejemplos de problemas que se resuelvan mejor con un stack?**
Sí, LIFO significa que el último en entrar es el primero en salir. Sirve en cosas como deshacer acciones o revisar expresiones matemáticas.

**5. ¿Puedo implementar y depurar un stack para tipos de datos más complejos, asegurándome de que no haya fugas de memoria ni errores de puntero?**
Me falta mejorar un poco más con ese tema pero de a poco voy aprendiendo a depurar mejor pero se que debo cuidar que cada nodo y sus datos se liberen bien con delete y probar el código para evitar errores de puntero.

**Preguntas de reflexión para la queue:**

**1. ¿Cómo se maneja la memoria en una implementación manual de una queue en C++? Reflexiona sobre cómo se gestionan los nodos al encolar y desencolar elementos y las implicaciones en términos de eficiencia y seguridad.**  
Cada vez que encolo con enqueue se crea un nodo con new, y al desencolar con dequeue ese nodo se libera con delete. Así se evita acumular memoria usada.

**2. ¿Qué desafíos específicos presenta la implementación de una queue en comparación con un stack en términos de gestión de memoria? Considera las diferencias en el manejo de punteros front y rear, y cómo estos afectan el proceso de encolado y desencolado.**  
En la queue hay que cuidar dos punteros: front y rear. Si se manejan mal, se pueden perder nodos o dejar memoria sin liberar.

**3. ¿Cómo afecta la estructura FIFO (First In, First Out) de una queue a su uso en diferentes tipos de problemas? Analiza cómo la estructura FIFO influye en la resolución de problemas donde el orden de procesamiento es crucial, como en sistemas de colas de espera.**  
La queue es FIFO: el primero en entrar es el primero en salir. Esto sirve en casos como filas de espera o tareas que se procesan en orden.

**4. ¿Cómo podrías implementar una queue circular y cuál sería su ventaja respecto a una queue lineal en términos de uso de memoria? Reflexiona sobre cómo una queue circular puede mejorar la eficiencia en ciertos contextos y qué cambios serían necesarios en la implementación.**  
En una queue circular los nodos se reutilizan en un arreglo circular. La ventaja es que se aprovecha mejor la memoria sin tener que mover nodos.

**5. ¿Qué problemas podrían surgir si no se gestionan correctamente los punteros front y rear en una queue, y cómo podrías evitarlos? Considera posibles errores como la pérdida de referencias a nodos y cómo una gestión cuidadosa de los punteros puede prevenir estos problemas.**  
Se puede perder acceso a los nodos o quedar memoria ocupada sin liberar. Para evitarlo hay que actualizar siempre bien front y rear.

**Preguntas de autoevaluación:**

**1. ¿Puedo explicar claramente el proceso de encolar y desencolar nodos en una queue, incluyendo la gestión de memoria?**  
Sí, En enqueue creo un nodo con new y lo pongo al final (rear). En dequeue borro el nodo de front con delete y avanzo el puntero.

**2. ¿Soy capaz de identificar y corregir problemas relacionados con la gestión de los punteros front y rear en una queue?**  
Sí, Si la cola queda vacía, reviso que tanto front como rear se vuelvan nullptr para no perder control de la memoria.

**3. ¿Puedo modificar la queue para implementar una queue circular, entendiendo cómo esto afectaría la gestión de memoria?**  
Sí, Haciendo que rear->next apunte a front. Así los nodos se reutilizan y se aprovecha mejor la memoria.

**4. ¿Entiendo cómo la estructura FIFO de una queue afecta el flujo de datos y puedo dar ejemplos de problemas que se resuelvan mejor con una queue?**  
Sí, FIFO es primero en entrar, primero en salir. Sirve para manejar filas de espera o procesos en orden.

**5. ¿Puedo implementar y depurar una queue para tipos de datos más complejos, asegurándome de que no haya fugas de memoria ni errores de puntero?**  
Sí, Hay que liberar cada nodo con delete al hacer dequeue o clear, y probar bien el código para evitar errores de puntero.
