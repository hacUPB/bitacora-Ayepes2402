### Reto 1
- **¿Cómo están implementadas las variables `i` y `sum`?**  
Las variables están implementadas como nombres simbólicos que el ensamblador traduce a direcciones específicas de la memoria RAM

- **¿En qué direcciones de memoria están estas variables?**
i está en RAM[16]  
sum está en RAM[17]  
limit está en RAM[18]  


- **¿Cómo está implementado el ciclo `while`?**  
El ciclo se implementa usando una etiqueta (LOOP), una comparación entre i y limit, y un salto condicional a (END) si i supera a limit. Si no, ejecuta el cuerpo del ciclo y luego salta de nuevo a (LOOP). Así se repite mientras i <= limit.

- **¿Cómo se implementa la variable `i`?**
Como posición de memoria con nombre

- **¿En qué parte de la memoria se almacena la variable `i`?**
Se almacena en la dirección RAM[16], ya que es la primera variable usada en el programa.

- **Después de todo lo que has hecho, ¿Qué es entonces una variable?**
Una variable es un nombre que representa una posición en la memoria donde se guarda un valor que puede cambiar durante la ejecución del programa.

- **¿Qué es la dirección de una variable?**
Es el número de la posición en la memoria RAM donde se encuentra almacenada la variable.

- **¿Qué es el contenido de una variable?**
Es el valor que está guardado en la dirección de memoria de la variable.

**RAE 2**  
Para comprobar el correcto funcionamiento del programa, primero realicé pruebas por partes. Verifiqué que las variables se inicializaran correctamente observando en el simulador que i empezaba en 1, sum en 0 y limit en 100, ubicadas en las direcciones RAM[16], RAM[17] y RAM[18] respectivamente. Luego, paso a paso, confirmé que la variable i se incrementaba en cada ciclo, y que el valor acumulado en sum aumentaba correctamente con el valor actual de i. También observé que, al llegar a 101, el programa salía del ciclo gracias a la condición i > limit, saltando a la etiqueta (END). Finalmente, probé el programa completo en ejecución continua, y al finalizar revisé que el valor almacenado en la variable sum fuera 5050, lo que demuestra que la suma del 1 al 100 se realizó correctamente.

### Reto 2  
**RAE 2**  
Verifiqué en el simulador que las variables i, sum y limit se inicializaran correctamente. Luego, observé paso a paso que i se incrementaba y que sum acumulaba su valor en cada iteración. También comprobé que el ciclo terminaba cuando i superaba a 100. Al ejecutar todo el programa, el valor final de sum fue 5050, lo que confirmó que el código funciona correctamente.

### Reto 3  
**RAE 2**  
Verifiqué que sum iniciara en 0, i en 1 y limit en 100. Observé que i se incrementaba y su valor se sumaba correctamente a sum en cada ciclo. El programa se detuvo cuando i superó 100. Al final, el resultado en sum fue 5050, lo que confirmó que funcionó correctamente.

### Reto 4
**RAE 2**  
Ahora vamos a acercarnos al concepto de puntero. Un puntero es una variable que almacena la dirección de memoria de otra variable. Observa el siguiente programa escrito en C++:
    ```asm
    cpp
    int var = 10;
    int *punt;
    punt = &var;
    *punt = 20;
    ```
El programa anterior modifica el contenido de la variable `var` por medio de la variable `punt`. `punt` es un puntero porque almacena la dirección de memoria de la variable `var` . En este caso el valor de la variable `var`  será 20 luego de ejecutar `*punt = 20;`. Ahora analiza:
    
- ¿Cómo se declara un puntero en C++?   
    `int *punt;`. `punt` es una variable que almacenará la dirección de un variable que almacena enteros.

- ¿Cómo se define un puntero en C++?   
`punt = &var;`. Definir el puntero es inicializar el valor del puntero, es decir, guardar la dirección de una variable. En este caso `punt` contendrá la dirección de `var` .

- ¿Cómo se almacena en C++ la dirección de memoria de una variable?   
Con el operador `&`. `punt = &var;` 

- ¿Cómo se escribe el contenido de la variable a la que apunta un puntero?  
Con el operador . `punt = 20;`. En este caso como `punt` contiene la dirección de `var`  entonces `punt` a la izquierda del igual indica que quieres actualizar el valor de la variable `var` .

### Reto 5
**RAE 2**
Primero observé que al inicio el valor 10 se asignara correctamente a la variable var. Luego, comprobé que la variable punt almacenara una dirección de memoria, correspondiente a la ubicación de var. Más adelante, me aseguré de que el acceso indirecto mediante @punt y A=M permitiera modificar el contenido de var desde esa dirección. Finalmente, al seguir la ejecución paso a paso en el simulador, confirmé que el valor de var cambiaba de 10 a 20 gracias a la manipulación indirecta con el puntero, lo cual demostraba que el comportamiento esperado se cumplía correctamente.

### Reto 6 y 7
**RAE 2**
Para hacer este ejercicio primero tuve que comprender mejor como funciona el puntero, lo primero que hice fue crear la var1 y var2 y les di sus valores, luego creé el puntero para que tome la direccion de var1 y asi luego desligarlo y lograr que ahora var2 valga 10.

### Reto 8  
Vas a parar un momento y tratarás de recodar de memoria lo siguiente. Luego verifica con un compañero o con el profesor.

- ¿Qué hace esto `int *pvar;`?  
Este lo que hace es que crea un puntero.

- ¿Qué hace esto `pvar = var;`?  
No creo que haga algo porque le falta la &.

- ¿Qué hace esto `var2 = *pvar`?  
Esto hace que la var2 valga lo que está en la posición del puntero (el puntero se desliga).

- ¿Qué hace esto `pvar = &var3`?
Sirve para que el puntero almacene la dirección de la variable.

### Reto 9  
**RAE 2**
Primero se crea las funciones (MAIN) y (suma), dentro de main se salta para (suma) y dentro de este se haría la operacion y al hacer la operacion salta a (volver) que es una nueva función que fue creada para darle continuidad al proceso y evitar que así se entre en un bucle entre (suma) y (main)