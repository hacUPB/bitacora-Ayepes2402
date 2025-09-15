### Sesión 1: la naturaleza de los objetos en C++  
### Introducción a los Objetos

Concepto: un objeto es una instancia de una clase que combina datos (atributos) y comportamiento (métodos).

Considera el siguiente caso de estudio:  
```cpp
class Particle {
public:
    float x, y;
    void move(float dx, float dy) {
        x += dx;
        y += dy;
    }
};
```
**¿Qué representa la clase Particle?**
representa la posicion y el movimiento de un objeto que combina los atributos y los métodos.  

**¿Cómo interactúan sus atributos y métodos?**   
El método de move ayuda a cambiar los atributos de la posición sumandoles 1.  

**Prompt para ChatGPT: explícame en detalle qué es un objeto en C++ y cómo se relaciona con una clase. Usa el ejemplo de una clase Particle con atributos x y y y un método move.**  
* Clase = definición/plantilla. Objeto = instancia concreta que ocupa memoria.  
* Un objeto contiene los datos (miembros) en memoria; los métodos no se duplican por objeto.  
* this es el puntero implícito que permite al método actuar sobre el objeto.  
* El layout suele poner los miembros en orden declarado (con padding); el compilador puede añadir un vptr si hay virtuales.   
* Tiempo de vida y forma de asignación (stack vs heap vs estático) determinan cuándo y cómo se crean/ destruyen los objetos.   
* Ten cuidado con inicialización (usa constructores o {}), copia/ movimiento y slicing cuando haya herencia.    

### Explorando la memoria
**Objetivo: entender cómo se almacenan los objetos en memoria.**    
Considera los siguientes pasos:  
Crear instancias:  
```
Particle p1;
Particle p2;
```

**Explorar la memoria usando punteros:**  
```
std::cout << "Dirección de p1: " << &p1 << std::endl;
std::cout << "Dirección de p2: " << &p2 << std::endl;
```
**Determinar el tamaño del objeto:**  
```
std::cout << "Tamaño de Particle: " << sizeof(Particle) << " bytes" << std::endl;
```

**Imprimir direcciones de atributos:**  
```
std::cout << "Dirección de p1.x: " << &(p1.x) << std::endl;
std::cout << "Dirección de p1.y: " << &(p1.y) << std::endl;
```  
### Reflexión Guiada:  
* **¿Los atributos están almacenados de forma contigua?**  
Sí, x y y quedan uno al lado del otro en memoria, solo puede haber un pequeño espacio de alineación.  

* **¿Qué indica el tamaño del objeto sobre su estructura interna?**  
Que solo guarda sus datos (x y y), los métodos no ocupan espacio en cada objeto.  

**Prompt para ChatGPT: ¿Cómo se almacenan los objetos en memoria en C++? Si tengo dos instancias de Particle, ¿Cómo se relacionan sus direcciones de memoria? ¿Los atributos están contiguos?**  
Se guardan como bloques de bytes que contienen solo sus datos.
Cada objeto (p1, p2) ocupa su propio bloque; sus direcciones son distintas y no se mezclan.
Dentro de cada objeto, los atributos (x, y) están uno junto al otro en memoria, con posible pequeño padding.  

### Análisis de diferencias  
**Objetivo: comparar cómo diferentes clases afectan el uso de memoria.**  

Considera los siguientes pasos:  
**Crear clases con diferentes atributos y métodos:**  
```cpp
class Simple {
public:
    int a;
};

class Complex {
public:
    int a, b, c;
    void method1() {}
    void method2() {}
};
```

**Compara los tamaños:**  
```cpp
std::cout << "Tamaño de Simple: " << sizeof(Simple) << " bytes" << std::endl;
std::cout << "Tamaño de Complex: " << sizeof(Complex) << " bytes" << std::endl;
```
**Agregar datos estáticos y dinámicos:**  
```cpp
class StaticData {
public:
    static int s;
    int a;
};

int StaticData::s = 0;

class DynamicData {
public:
    int* ptr;
    DynamicData() {
        ptr = new int[10];
    }
    ~DynamicData() {
        delete[] ptr;
    }
};
```  
**¿Cómo afectan los datos estáticos al tamaño de la instancia?**  
No lo cambian, la variable static vive en una zona global y es única para toda la clase, así que cada objeto solo cuenta el tamaño de sus miembros no estáticos.  

**¿Qué diferencias hay entre datos estáticos y dinámicos en términos de memoria?**
* **Estáticos:** un solo espacio compartido por todos los objetos; existe todo el programa.  
* **Dinámicos:** se piden con new y viven en el heap; cada objeto puede reservar su propio bloque y hay que liberarlo en el destructor.  

**Prompt para ChatGPT: explícame cómo el uso de variables estáticas y dinámicas en una clase afecta el tamaño de sus instancias. ¿Las variables estáticas ocupan espacio en cada objeto?**  
* Las variables estáticas no aumentan el tamaño de cada objeto, porque se guardan una sola vez en una zona global y todos los objetos comparten esa misma dirección.  
* Las variables dinámicas sí influyen: el puntero miembro (por ejemplo int* ptr) cuenta en el tamaño del objeto, y además cada objeto puede pedir memoria extra en el heap con new, que no se refleja en sizeof pero sí ocupa espacio fuera del objeto.  

### Reflexión

**Documenta en tu bitácora de aprendizaje:**  

**¿Qué es un objeto desde la perspectiva de la memoria?**  
Un objeto es un bloque de memoria que guarda solo los valores de sus atributos (y un posible puntero oculto si hay herencia o virtuales).  

**¿Cómo influyen los atributos y métodos en el tamaño y estructura del objeto?**  
Los atributos suman espacio al tamaño del objeto. Los métodos no ocupan espacio en cada uno. Las variables static no cuentan y los punteros solo pesan lo que mide el puntero, no lo que apuntan.  

**Conclusión: resumir los hallazgos y cómo esto impacta el diseño de clases.**  
El tamaño de una clase depende de sus miembros de datos, alineación y punteros internos, no de sus funciones. Al diseñar clases conviene elegir tipos y estructuras pensando en el espacio que ocuparán y en cómo administrar la memoria si se usan recursos dinámicos.  

![alt text](<Captura de pantalla 2025-09-15 171804.png>)