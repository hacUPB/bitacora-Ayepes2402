### Activav 1  
**¿Cuál es el resultado que se obtiene al ejecutar este programa?**    
El resultado que se obtiene al poner este código es que aparece un cuadrado negro en el cual hay un círculo blanco de radio 20 que se mueve dependiendo de dónde muevas el cursor del mouse.

### Actividad 2  
**¿Qué fue lo que incluimos en el archivo .h?**  
 En este archivo se guarda la estructura básica de la aplicación poniendo las funciones principales (setup(), update(), draw(), mouseMoved() y mousePressed()) para que así el programa funcione cuando se mueva el mouse y cuando se haga click.

**¿Cómo funciona la aplicación?**  
Se crea un cuadrado negro en el cual cuando mueves el mouse se traza una linea con concirculos blancos que va desapareciendo mientras avanza pero cuando se da click estos cambiarian a otro color.

**¿Qué hace la función mouseMoved?**  
 sirve para que el programa detecte la posición actual del puntero y pueda usarla para mover y crear la línea con los circulos.

**¿Qué hace la función mousePressed?**  
Sirve para cuando hacemos clic con el mouse el programa detecte qué botón presionamos y en qué posición para así realizar la acción de cambiar de color.

**¿Qué hace la función setup?**  
Sirve para configurar todo lo que se necesita antes de que empiece a funcionar, como establecer colores, tamaños, posiciones iniciales o cargar recursos.

**¿Qué hace la función update?**  
Sirve para cambiar o actualizar lo que pasa con los circulos antes de dibujarlos, por ejemplo, moverlos o modificar sus posiciones para que en la pantalla se vean en movimiento.  

**¿Qué hace la función draw?**  
Se encarga de dibujar en la pantalla los los circulos con su respectivo color y en su posicion actual.

### Actividad 3  
Decidí cambiar la partícula a una elipse y puse sus posiciones correspondientes en los vértices. Aprendí que debo poner números diferentes o si no aparecerá ninguna figura.  
```cpp
ofDrawEllipse(pos.x -10, pos.y -10 , pos.x -50, pos.y -30);
```

También cambié para que la elipse cambie de color cada vez que se mueva  
```cpp
particleColor = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
```
### Actividad 5​
¿Cuál es la definición de un puntero?  
variable que almacena la dirección de memoria de otra variable en lugar de almacenar directamente un valor.  

¿Dónde está el puntero?  
Está en "ofMain.h"

¿Cómo se inicializa el puntero?

```cpp
vector<Sphere*> spheres;
        Sphere* selectedSphere;
```

¿Para qué se está usando el puntero?  
guarda la direccion de memoria de la esfera y tambien se usa para poder agarrar la esfera.

¿Qué es exactamente lo que está almacenado en el puntero?  
almacena la direccion del punto.

### Actividad 6
El error que pude notar es que a la hora de agarrar una de las esferas no es posible soltarla, haciendo así que no se pueda agarrar alguna otra de las que están allí.
```cpp
void mouseReleased(int x, int y, int button);
```
```cpp
void ofApp::mouseReleased(int x, int y, int button){
    if(button == OF_MOUSE_BUTTON_LEFT){
        selectedSphere = nullptr;
    }
}
```
En el código puse un puntero para que cuando haga clic en una esfera se pueda mover junto con el mouse. El problema era que la esfera quedaba pegada al cursor todo el tiempo, entonces agregué la función mouseReleased. Ahí lo que hago es que, cuando suelto el botón izquierdo, selectedSphere vuelve a nullptr (valor de un puntero nulo) y así la esfera deja de moverse cuando ya no tengo presionado el mouse.

### Actividad 07
**¿Qué sucede cuando presionas la tecla “c”?**  
Cuando presiono “c”, el programa crea una esfera en el heap y te da la posición.

**¿Qué sucede cuando presionas la tecla “c”?**  
Se crea una esfera en el heap y su puntero se guarda en el vector, así el programa la puede seguir dibujando en la pantalla (se muestra una esfera en la pantalla mientras que en el otro no).

**¿Por qué ocurre esto?**
Porque en el heap la esfera no se borra cuando termina la función, entonces el puntero sigue siendo válido.

### Actividad 08  
**Ideas despues de tu explicación:** New es variable que se crea en heap en la misma memoria ram, se pueden correr mientras el codigo está corriendo (duran toda la aplicación)  
Global es para datos permanentes y compartidos durante toda la ejecución. (está por fuera de todas las funciones).   
Stack es para variables locales rápidas y temporales.  

```cpp
#pragma once
#include "ofMain.h"

static ofRectangle globalRect(50, 50, 100, 100);

class ofApp : public ofBaseApp{
public:
    void setup();
    void update();
    void draw();
    void exit(); 

    ofRectangle* heapRect;
    ofPoint* heapCircleCenter; 
};
```
```cpp
#include "ofApp.h"


void ofApp::setup(){
    heapRect = new ofRectangle(200, 50, 100, 100);
    heapCircleCenter = new ofPoint(500, 100); 
}


void ofApp::update(){

}

void ofApp::draw(){

    ofSetColor(255, 0, 0);
    ofDrawRectangle(globalRect);


    ofSetColor(0, 255, 0);
    ofDrawRectangle(*heapRect);


    ofRectangle stackRect(350, 50, 100, 100);
    ofSetColor(0, 0, 255);
    ofDrawRectangle(stackRect);

    ofSetColor(255, 255, 0);
    ofDrawCircle(*heapCircleCenter, 50);

    
    ofSetColor(255);
    ofDrawBitmapString("Global (rojo)", 50, 40);
    ofDrawBitmapString("Heap Rect (verde)", 200, 40);
    ofDrawBitmapString("Stack (azul)", 350, 40);
    ofDrawBitmapString("Heap Circulo (amarillo)", 500, 40);
}


void ofApp::exit(){
    delete heapRect;
    delete heapCircleCenter; 
    heapRect = nullptr;
    heapCircleCenter = nullptr;
}
```
**¿Cuándo debo crear objetos en el heap y cuándo en memoria global?**  
Los objetos en memoria global los usaría cuando quiero que estén disponibles en todo el programa y siempre existan, pero debo tener cuidado porque ocupan memoria todo el tiempo. Los objetos en el heap los usaría cuando necesito crearlos o borrarlos mientras el programa corre, ya que ahí puedo manejarlos de forma dinámica con new y delete. Los objetos en el stack los usaría cuando solo los necesito dentro de una función y se borran solos al terminar esa función.

### Actividad 09
**¿Qué sucede cuando presionas la tecla “f”?**
Se eliminan los circulos creados al dar click.

**Analiza detalladamente esta parte del código:**
Esa parte del código se asegura de que el vector no esté vacío y, en caso de tener elementos, libera la memoria del último objeto creado en el heap con delete y luego elimina el puntero del vector con pop_back().





