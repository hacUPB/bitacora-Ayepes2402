## Reto
````cpp
#include "ofApp.h"
#include "ofMain.h"

int main() {
	ofSetupOpenGL(1024, 768, OF_WINDOW);
	ofRunApp(new ofApp());
}
````
````cpp
#include "ofApp.h"

//--------------------------------------------------------------
void BaseParticle::update(float dt, const ofVec2f & gravity) {
	vel += gravity * dt;
	pos += vel * dt;
	age += dt;
	float t = ofClamp(age / life, 0.0f, 1.0f);
	color.a = 1.0f - t;
}

//--------------------------------------------------------------
void FadeParticle::draw() const {
	ofSetColor(color);
	ofDrawCircle(pos, ofMap(color.a, 0, 1, 0.5f, 3.5f));
}

//--------------------------------------------------------------
void SpiralParticle::update(float dt, const ofVec2f & gravity) {
	BaseParticle::update(dt, gravity);
	float angle = age * 5.0f;
	pos.x += cos(angle) * 0.5f;
	pos.y += sin(angle) * 0.5f;
}
void SpiralParticle::draw() const {
	ofSetColor(color);
	ofDrawRectangle(pos, ofMap(color.a, 0, 1, 0.5f, 3.5f),
		ofMap(color.a, 0, 1, 0.5f, 3.5f));
}

//--------------------------------------------------------------
Explosion::Explosion(ofVec2f origin_, int n,
	const ofFloatColor & baseColor,
	float speedMin, float speedMax)
	: finished(false) {
	particles.reserve(n);
	for (int i = 0; i < n; ++i) {
		float ang = ofRandom(0, TWO_PI);
		float mag = ofRandom(speedMin, speedMax);
		ofVec2f vel(cos(ang) * mag, sin(ang) * mag);
		float life = ofRandom(1.0f, 2.5f);

		float h = baseColor.getHue();
		float s = baseColor.getSaturation();
		float b = baseColor.getBrightness();
		ofFloatColor c;
		c.setHsb(ofClamp(h + ofRandom(-0.03, 0.03), 0, 1),
			ofClamp(s + ofRandom(-0.1, 0.1), 0, 1),
			ofClamp(b + ofRandom(-0.1, 0.1), 0, 1));
		c.a = 1.0f;

		if (ofRandom(1) < 0.5) {
			particles.push_back(std::make_unique<FadeParticle>(origin_, vel, c, life));
		} else {
			particles.push_back(std::make_unique<SpiralParticle>(origin_, vel, c, life));
		}
	}
}

//--------------------------------------------------------------
void Explosion::update(float dt, const ofVec2f & gravity) {
	finished = true;
	for (auto & p : particles) {
		if (!p->isDead()) {
			p->update(dt, gravity);
			finished = false;
		}
	}
}

//--------------------------------------------------------------
void Explosion::draw() {
	for (auto & p : particles) {
		if (!p->isDead()) {
			p->draw();
		}
	}
}

bool Explosion::isFinished() const { return finished; }

//--------------------------------------------------------------
void ofApp::setup() {
	ofSetWindowTitle("Fuegos Artificiales con Polimorfismo");
	ofBackground(0);
	ofSetFrameRate(60);

	gravity.set(0, 60);
	randomGravity = false;

	maxExplosions = 12;
	particlesPerExplosion = 120;
	baseColor.setHsb(ofRandom(0, 1), 0.9f, 1.0f);

	int nStars = 100;
	stars.resize(nStars);
	for (int i = 0; i < nStars; ++i) {
		stars[i].set(ofRandomWidth(), ofRandomHeight() * 0.6f);
	}
}

//--------------------------------------------------------------
void ofApp::spawnExplosion(int x, int y) {
	if ((int)stackExplosions.size() >= maxExplosions) {
		stackExplosions.erase(stackExplosions.begin());
	}
	stackExplosions.push_back(std::make_unique<Explosion>(
		ofVec2f(x, y), particlesPerExplosion, baseColor, 40, 250));
}

//--------------------------------------------------------------
void ofApp::update() {
	float dt = ofGetLastFrameTime();
	ofVec2f g = gravity;
	if (randomGravity) {
		g.y = gravity.y + ofRandom(-30, 30);
		g.x = ofRandom(-10, 10);
	}

	for (auto & e : stackExplosions) {
		e->update(dt, g);
	}
	cleanupFinishedExplosions();
}

//--------------------------------------------------------------
void ofApp::cleanupFinishedExplosions() {
	stackExplosions.erase(
		std::remove_if(stackExplosions.begin(), stackExplosions.end(),
			[](const std::unique_ptr<Explosion> & e) { return e->isFinished(); }),
		stackExplosions.end());
}

//--------------------------------------------------------------
void ofApp::draw() {
	ofSetColor(255);
	for (auto & s : stars) {
		ofDrawCircle(s.x, s.y, 1.1f);
	}

	for (auto & e : stackExplosions) {
		e->draw();
	}

	ofSetColor(255);
	string info = "Click: explosion | C: color | G: gravedad aleatoria | R: limpiar";
	ofDrawBitmapStringHighlight(info, 10, ofGetHeight() - 20);
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {
	spawnExplosion(x, y);
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
	if (key == 'c' || key == 'C') {
		baseColor.setHsb(ofRandom(0, 1), 0.9f, 1.0f);
	} else if (key == 'g' || key == 'G') {
		randomGravity = !randomGravity;
	} else if (key == 'r' || key == 'R') {
		stackExplosions.clear();
	}
}

void ofApp::exit() {
	stackExplosions.clear();
	stars.clear();
}
````
````cpp
#pragma once
#include "ofMain.h"

class BaseParticle {
public:
	ofVec2f pos;
	ofVec2f vel;
	ofFloatColor color;
	float life;
	float age;

	BaseParticle(const ofVec2f & p, const ofVec2f & v,
		const ofFloatColor & c, float l)
		: pos(p)
		, vel(v)
		, color(c)
		, life(l)
		, age(0) { }

	virtual ~BaseParticle() = default;

	virtual void update(float dt, const ofVec2f & gravity);
	virtual void draw() const = 0; 
	bool isDead() const { return age >= life; }
};

class FadeParticle : public BaseParticle {
public:
	using BaseParticle::BaseParticle; 
	void draw() const override;
};

class SpiralParticle : public BaseParticle {
public:
	using BaseParticle::BaseParticle;
	void update(float dt, const ofVec2f & gravity) override;
	void draw() const override;
};

class Explosion {
public:
	Explosion(ofVec2f origin_, int n, const ofFloatColor & baseColor,
		float speedMin, float speedMax);
	void update(float dt, const ofVec2f & gravity);
	void draw();
	bool isFinished() const;

private:
	std::vector<std::unique_ptr<BaseParticle>> particles;
	bool finished;
};

class ofApp : public ofBaseApp {
public:
	void setup();
	void update();
	void draw();
	void keyPressed(int key);
	void mousePressed(int x, int y, int button);
	void exit(); 

private:
	std::vector<std::unique_ptr<Explosion>> stackExplosions;
	std::vector<ofVec2f> stars;

	ofVec2f gravity;
	int maxExplosions;
	int particlesPerExplosion;
	ofFloatColor baseColor;
	bool randomGravity;

	void spawnExplosion(int x, int y);
	void cleanupFinishedExplosions();
};
````
**Evidencia de Programación Orientada a Objetos en el proyecto de arte generativo**    

**Herencia:**     
La clase base BaseParticle define atributos y métodos comunes a todas las partículas:   
`````cpp
class BaseParticle {
public:
    virtual void update(float dt, const ofVec2f &gravity);
    virtual void draw() const = 0;
    ...
};
````
Las subclases FadeParticle y SpiralParticle heredan de esta clase y agregan su propio comportamiento:    
````cpp
class FadeParticle : public BaseParticle { ... };
class SpiralParticle : public BaseParticle { ... };
`````
Esto muestra que ambas “hijas” reutilizan y amplían el código de la clase “madre”.    

**Polimorfismo:**
En la clase Explosion se usa un vector de punteros a la clase base, pero se almacenan objetos de las dos subclases:    
````cpp
std::vector<std::unique_ptr<BaseParticle>> particles;
...
if (ofRandom(1) < 0.5) {
    particles.push_back(std::make_unique<FadeParticle>(...));
} else {
    particles.push_back(std::make_unique<SpiralParticle>(...));
}
````
Cuando se recorre este vector, las llamadas como p->update(dt, gravity); y p->draw(); ejecutan automáticamente la versión correspondiente de cada subclase, sin que el código tenga que distinguir el tipo concreto.    

**Encapsulamiento**  
Las propiedades internas de clases como Explosion y ofApp están declaradas en la sección private, evitando el acceso directo desde fuera:   
````cpp
class Explosion {
private:
    std::vector<std::unique_ptr<BaseParticle>> particles;
    bool finished;
    ...
};
````
Solo se puede modificar o consultar este estado mediante los métodos públicos (update, draw, isFinished), protegiendo la información y manteniendo una interfaz clara.  

En resumen, en el proyecto se ve herencia porque FadeParticle y SpiralParticle heredan de BaseParticle. Hay polimorfismo cuando todas las partículas se guardan en un vector de BaseParticle y cada una ejecuta su propio update() y draw() según su tipo. El encapsulamiento aparece al mantener las variables internas privadas y solo accesibles mediante métodos públicos, protegiendo los datos.  

**Experimentación**   
![alt text](<Captura de pantalla 2025-09-24 170158.png>)   


En la imagen se observa la aplicación corriendo mientras el Performance Profiler de Visual Studio registra el uso de CPU y memoria.  

![alt text](<Captura de pantalla 2025-09-24 170452.png>)   


En esta imagen se aprecia cómo el programa responde a la interacción del usuario. Se generaron múltiples explosiones haciendo clic en diferentes puntos   

![alt text](<Captura de pantalla 2025-09-24 170651.png>) ![alt text](<Captura de pantalla 2025-09-24 170452-1.png>)    


En esta imagen se aprecia cómo se cambió el color presionando la tecla C    


![alt text](<Captura de pantalla 2025-09-24 170925.png>)    


En esta imagen se evidencia cómo se usa la g para cambiar la gravedad    


[Experimento](https://youtu.be/og_yUmwKJOs)


En el video se muestra cómo funciona cada tecla   

## Reflexión y ajuste Final   
**¿Cómo influyó el entendimiento de los mecanismos internos de OOP en el proyecto? ¿Qué desafíos enfrentaste y cómo los superaste? ¿Qué aprendiste sobre el equilibrio entre diseño y eficiencia?**   
Entender cómo funciona la programación orientada a objetos por dentro me ayudó a organizar mejor el proyecto de fuegos artificiales. Saber que las clases base usan vtables para los métodos virtuales me permitió usar herencia y polimorfismo sin miedo a errores de memoria. El mayor reto fue lograr que el programa fuera rápido mientras usaba varias subclases de partículas; al principio consumía más memoria, pero con punteros inteligentes y limpiando los objetos terminados lo solucioné. Aprendí que un buen diseño de clases hace el código más claro y fácil de cambiar, pero también hay que cuidar la eficiencia para que la aplicación corra fluida.  

**Conclusión:** En las pruebas pude comprobar que el programa funciona bien y responde rápido, incluso cuando hay muchas explosiones en pantalla. Al cambiar color, gravedad y al hacer clic para crear más partículas no se notó lentitud. Esto me demostró que la forma en que usé herencia, polimorfismo y punteros inteligentes es eficiente y mantiene el código ordenado, confirmando que el diseño orientado a objetos fue una buena elección.  