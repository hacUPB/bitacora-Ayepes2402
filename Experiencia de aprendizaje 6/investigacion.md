## Sesión 2: análisis de un caso de estudio    

**¿Qué hace el patrón observer en este caso?**  
En este caso sirve para que la aplicación principal pueda avisar a todas las partículas al mismo tiempo cuando ocurre un evento, como presionar una tecla. Así, cada partícula recibe la notificación y cambia su comportamiento sin que la aplicación tenga que modificar una por una.

**¿Qué hace el patrón factory en este caso?**  
En este caso se encarga de crear las partículas según el tipo que se necesite, como estrellas, planetas o estrellas fugaces. Gracias a la fábrica, no es necesario repetir el mismo código para configurar cada partícula, sino que simplemente se pide el tipo y se obtiene ya lista con su color, tamaño y velocidad.

**¿Qué hace el patrón state en este caso?**  
En este caso se usa para que cada partícula pueda cambiar su comportamiento según el estado en el que se encuentre. Por ejemplo, en estado Normal se mueve con su velocidad inicial, en Attract se acerca al mouse, en Repel se aleja, y en Stop se queda quieta.

**Experimenta con el código y realiza algunas modificaciones para entender mejor su funcionamiento. Por ejemplo:**

**Adiciona un nuevo tipo de partícula.**  
En el particle factory agregé este código (pone su tamaño, color y velocidad):  
````cpp
else if (type == "comet") { 
        particle->size = ofRandom(6, 10); 
        particle->color = ofColor(255, 255, 100); 
        particle->velocity *= 5; 
    }
````
Y en el setup este otro (crea 5 cometas):  
````cpp
for (int i = 0; i < 5; ++i) { 
        Particle* p = ParticleFactory::createParticle("comet");
        particles.push_back(p);
        addObserver(p);
    }
````
![alt text](<Captura de pantalla 2025-10-01 164017.png>)

**Adiciona un nuevo estadoy modifica el comportamiento de las partículas.**   
````cpp
class FastState : public State {
public:
    void update(Particle* particle) override;
};

void FastState::update(Particle* particle) {
    particle->position += particle->velocity * 5;
}
````
````cpp
else if (event == "fast") {
    setState(new FastState());
}
````
````cpp
else if (key == 'f') {
    notify("fast");
}
````
El nuevo estado FastState hace que las partículas se muevan con mucha más velocidad que en el modo normal, recorriendo más distancia en menos tiempo y dando la sensación de rapidez.

**Crea otros eventos para notificar a las partículas.**  
````cpp
else if (key == 'f') {
    notify("fast");
}
````
````cpp
else if (event == "fast") {
    setState(new FastState());
}
````