## **Reto**

**Idea**  
Mi trabajo muestra un conjunto de luces/esferas que se mueven, cambian de color y reaccionan al teclado en tiempo real. Cada orbe se comporta diferente según el modo que elija el usuario, creando un efecto visual que parece tener vida propia. Cada tecla cambia el comportamiento del campo: al presionar L, los orbes brillan con más fuerza; con D, comienzan a moverse en trayectorias curvas como si danzaran; con S, se detienen suavemente; y con P, laten y vibran como si tuvieran un pulso.

.cpp
````cpp
#include "ofApp.h"

// Patron observer (El Subject avisa a los Observers)
void Subject::addObserver(Observer * obs) {
	observers.push_back(obs);
}

void Subject::notify(const std::string & event) {
	for (auto * o : observers)
		o->onNotify(event);
}


// Clase ORB (Observer que reacciona a eventos)
Orb::Orb(ofColor col) {
	pos = ofVec2f(ofRandomWidth(), ofRandomHeight());
	vel = ofVec2f(ofRandom(-1, 1), ofRandom(-1, 1));
	radius = ofRandom(6, 12);
	color = col;
	energy = 0.5;
	state = new SilenceState(); 
}

void Orb::update() {
	if (state) state->update(this); 
	pos += vel;

	if (pos.x < 0 || pos.x > ofGetWidth()) vel.x *= -1;
	if (pos.y < 0 || pos.y > ofGetHeight()) vel.y *= -1;
}

void Orb::draw() {
	ofSetColor(color, 200 + sin(ofGetElapsedTimef() * 2) * 55);
	ofDrawCircle(pos, radius + sin(ofGetElapsedTimef() * 3) * 1.5);
}


void Orb::onNotify(const std::string & event) {
	if (event == "light")
		setState(new LightState());
	else if (event == "dance")
		setState(new DanceState());
	else if (event == "silence")
		setState(new SilenceState());
	else if (event == "pulse")
		setState(new PulseState());
}


void Orb::setState(State * s) {
	if (state) delete state;
	state = s;
}

// Patrón State  (comportamiento diferente en cada clase)
void LightState::update(Orb * orb) {
	orb->color.setBrightness(255);
	orb->radius = 12 + ofRandom(0.5);
}

void DanceState::update(Orb * orb) {
	float t = ofGetElapsedTimef() * 2;
	orb->vel.x = cos(t + orb->pos.y * 0.01) * 2;
	orb->vel.y = sin(t + orb->pos.x * 0.01) * 2;
}

void SilenceState::update(Orb * orb) {
	orb->vel *= 0.9;
	orb->color.setBrightness(100);
}

void PulseState::update(Orb * orb) {
	orb->radius = 10 + sin(ofGetElapsedTimef() * 6) * 4;
	orb->color.setBrightness(200 + sin(ofGetElapsedTimef() * 8) * 55);
}


// Factory (creación de orbes según tipo)
Orb * OrbFactory::createOrb(const std::string & type) {
	if (type == "warm") return new Orb(ofColor(150, 0, 255));
	if (type == "cool") return new Orb(ofColor(0, 120, 255));
	return new Orb(ofColor(200));
}

void ofApp::setup() {
	ofBackground(0);
	for (int i = 0; i < 80; ++i) {
		std::string t = (i % 2 == 0) ? "warm" : "cool";
		Orb * orb = OrbFactory::createOrb(t);
		orbs.push_back(orb);
		addObserver(orb); 
	}
}

void ofApp::update() {
	for (auto * o : orbs)
		o->update();
}

void ofApp::draw() {
	for (auto * o : orbs)
		o->draw();
	ofSetColor(255);
	ofDrawBitmapString("L=Light | D=Dance | S=Silence | P=Pulse", 10, 20);
}

void ofApp::keyPressed(int key) {
	if (key == 'l') notify("light");
	if (key == 'd') notify("dance");
	if (key == 's') notify("silence");
	if (key == 'p') notify("pulse");
}
````
.h
````cpp
#pragma once
#include "ofMain.h"
#include <string>
#include <vector>


// Observer (Definición del sistema de notificación)
class Observer {
public:
	virtual void onNotify(const std::string & event) = 0;
};

class Subject {
public:
	void addObserver(Observer * obs);
	void notify(const std::string & event);

private:
	std::vector<Observer *> observers;
};


// State (Definición de los estados del Orb)
class Orb;

class State {
public:
	virtual void update(Orb * orb) = 0;
	virtual ~State() = default;
};


// Clase Orb (el "objeto" que cambia según su estado)
class Orb : public Observer {
public:
	Orb(ofColor col);
	void update();
	void draw();

	
	void onNotify(const std::string & event) override;

	
	void setState(State * s);

	ofVec2f pos, vel;
	float radius;
	ofColor color;
	float energy;

private:
	State * state;
};


// Estados del Orb (implementan el patrón State)
class LightState : public State {
public:
	void update(Orb * orb) override;
};
class DanceState : public State {
public:
	void update(Orb * orb) override;
};
class SilenceState : public State {
public:
	void update(Orb * orb) override;
};
class PulseState : public State {
public:
	void update(Orb * orb) override;
};


// Patrón Factory (crea orbes de diferentes tipos)
class OrbFactory {
public:
	static Orb * createOrb(const std::string & type);
};

class ofApp : public ofBaseApp, public Subject { 
public:
	void setup();
	void update();
	void draw();
	void keyPressed(int key);

private:
	std::vector<Orb *> orbs;
};
````

En mi código, el patrón **Observer** permite que cuando presiono una tecla, todos los orbes reciban el mensaje al mismo tiempo y cambien su comportamiento juntos. El patrón **Factory** se usa para crear los orbes con diferentes colores sin tener que escribir el mismo código muchas veces. Y el patrón **State** hace que cada orbe pueda cambiar su forma de moverse, brillar o detenerse según el modo que se active, mostrando comportamientos distintos sin cambiar su estructura.

**Pantalla inicial**  

![alt text](<Captura de pantalla 2025-10-06 170521.png>)


En esta imagen se ve la pantalla inicial con los orbes morados y azules en movimiento suave. Aún no se ha presionado ninguna tecla, mostrando el estado inicial del programa.

**Estado Light (Se iluminan)**

![alt text](<Captura de pantalla 2025-10-06 171648.png>)


En esta imagen se muestra el estado Light del patrón **State**, que se activa al presionar la tecla L. Las partículas cambian a tonos morados y azules, mostrando un efecto visual más suave y luminoso. Esto evidencia cómo el programa modifica su comportamiento dependiendo del estado activo. En ese momento también participa el patrón **Observer**, porque cuando presionas la tecla L, el sistema notifica a todas las partículas que deben cambiar su comportamiento al estado Light.

**Estado Dance (Se mueven)**

![alt text](<Captura de pantalla 2025-10-06 171902.png>)


En esta imagen se observa el estado Dance del patrón **State**, que se activa al presionar la tecla D. Las partículas se mueven de forma más rápida y dinámica, mostrando un comportamiento más animado. Esto demuestra cómo el programa cambia sus acciones según el estado que el usuario elija. En ese momento también participa el patrón **Observer**, porque cuando presionas la tecla D, el sistema notifica a todas las partículas que deben cambiar su comportamiento al estado Dance.

**Estado Silence (Paran de moverse)**

![alt text](<Captura de pantalla 2025-10-06 172114.png>)


En esta imagen se observa el estado Silence del patrón **State**, que se activa al presionar la tecla S. Las partículas se mueven lentamente y con suavidad, representando un ambiente tranquilo. En ese momento también participa el patrón **Observer**, porque cuando presionas la tecla S, el sistema notifica a todas las partículas que deben cambiar su comportamiento al estado Silence.

**Estado Pulse (Palpitan)**

![alt text](<Captura de pantalla 2025-10-06 172345.png>)


En esta imagen se observa el estado Pulse del patrón **State**, que se activa al presionar la tecla P. Las partículas cambian su tamaño de forma rítmica, creando un efecto de pulsación. Aquí también participa el patrón **Observer**, ya que todas las partículas reciben la notificación del cambio de estado y reaccionan al mismo tiempo al modo Pulse.

**Rendimiento del programa**

![alt text](<Captura de pantalla 2025-10-06 172928.png>)


En esta imagen se muestra la ejecución del programa en el estado Pulse mientras se realiza una prueba de rendimiento en Visual Studio. Se observa que la aplicación mantiene un uso estable de memoria y CPU, lo que demuestra que el programa funciona correctamente y de manera eficiente.

## Video  

[Experimento](https://youtu.be/pmdNXkp0uKw)

