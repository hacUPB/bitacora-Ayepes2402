## Reto  

Con lo que aprendiste en esta unidad vas a realizar una aplicación interactiva que utilice shaders.

**Lluvia de ideas**  

Mi idea fue hacer un mar. Quise que el plano se viera como si tuviera olas y se moviera como el agua. Para eso usé un vertex shader que mueve los vértices del plano para que se vea ondulado. Las olas cambian según la posición del mouse, así se puede interactuar con la escena. Una de las cosas que hice fue cambiar la imagen que venía en la actividad 4 y usar una diferente para darle mi propio estilo. Me basé en ese código y lo modifiqué para lograr este efecto de mar usando shaders en openFrameworks.

**Código**    
**shader.vert**
````cpp
#version 150

uniform mat4 modelViewProjectionMatrix;
uniform float mouseX;
uniform float mouseY;

in vec4 position;
in vec2 texcoord;

out vec2 texCoordVarying;

void main()
{
    float waveFreq = mouseX * 0.05;
    float waveAmp = mouseY * 0.05;

    float wave = sin(position.x * 0.05 + waveFreq) * (waveAmp * 0.4)
               + cos(position.y * 0.05 + waveFreq) * (waveAmp * 0.2);

    vec4 newPosition = position;
    newPosition.y += wave;

    texCoordVarying = texcoord;
    gl_Position = modelViewProjectionMatrix * newPosition;
}
````
**shader.frag**   
````cpp
#version 150

uniform sampler2D tex0;
uniform vec2 resolution;

in vec2 texCoordVarying;
out vec4 outputColor;

void main()
{
    vec2 uv = texCoordVarying / resolution;


    vec4 texColor = texture(tex0, uv);

    outputColor = texColor;
}
````
**ofApp.cpp**
````cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
	ofDisableArbTex();
	if(ofIsGLProgrammableRenderer()){
		shader.load("shadersGL3/shader");
	}else{
		shader.load("shadersGL2/shader");
	}

	if(img.load("img1.jpg")) {
		img.getTexture().setTextureWrap(GL_REPEAT, GL_REPEAT);
	}

	plane.set(800, 600, 10, 10);
	plane.mapTexCoords(0, 0, img.getWidth(), img.getHeight());
}


//--------------------------------------------------------------
void ofApp::update() {
	
}

//--------------------------------------------------------------
void ofApp::draw() {
	
  ofBackground(10, 20, 40);

	img.getTexture().bind();
	shader.begin();

	shader.setUniform1f("mouseX", ofGetMouseX());
	shader.setUniform1f("mouseY", ofGetMouseY());
	shader.setUniform2f("resolution", ofGetWidth(), ofGetHeight());

	ofPushMatrix();
	ofTranslate(ofGetWidth() / 2, ofGetHeight() / 2);
	plane.draw();
	ofPopMatrix();

	shader.end();
	img.getTexture().unbind();
	
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
	
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y){
	
}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
````

**Foto**  
![alt text](<../imagenes/Captura de pantalla 2025-10-28 153857.png>)

**Foto donde se ve que puse una nueva foto e los archivos**  
![alt text](<../imagenes/Captura de pantalla 2025-10-28 154812.png>)

[Video del programa funcionando](https://youtu.be/Co1o8V9daRU)
  
**Prueba en ofApp.cpp**   

En el archivo ofApp.cpp probé que todo funcionara bien. En la parte de setup() revisé que se cargara la imagen y el shader sin errores. En draw() probé enviar las variables del mouse al shader y vi que las olas se movían cuando movía el cursor. Con eso comprobé que la conexión entre el código C++ y los shaders funcionaba correctamente.

**Prueba del Vertex Shader**      

En el vertex shader probé que los vértices del plano se movieran como olas. Fui cambiando los valores de sin y cos para ver si el plano se deformaba. Cuando movía el mouse, las olas cambiaban de forma y altura, así comprobé que el shader estaba modificando bien los vértices según la posición del mouse.

**Prueba del Fragment Shader**       

En el fragment shader probé que mostraraa solo la textura original para que se viera más real. Revisé que no saliera negro ni con errores, y que la imagen se mostrara completa sobre el plano. Así confirmé que el fragment shader funcionaba bien.

**Prueba de la Aplicación Completa**    

Cuando tuve todo listo, probé la aplicación completa desde Visual Studio. Moví el mouse y vi cómo las olas del mar se movían en tiempo real. También revisé que la textura se viera bien y que no hubiera fallas. Grabé un video y tomé capturas para mostrar el resultado. Con eso comprobé que todo funcionaba como quería.

**Extra**  
**Que manda la CPU y la GPU**    
En este programa, la CPU se encarga de preparar todo lo que la GPU necesita para dibujar. La CPU carga la imagen, el shader y el plano, y luego le manda a la GPU los valores del mouse, el tamaño de la ventana y la textura de la imagen. También le envía las posiciones de los puntos del plano para que la GPU sepa cómo dibujarlo. Con esa información, la GPU usa los shaders para crear el efecto visual: en el vertex shader, mueve los puntos del plano como si fueran ondas según la posición del mouse, y en el fragment shader, pinta cada parte con los colores de la imagen. La GPU no le devuelve nada a la CPU, solo muestra el resultado en la pantalla.

**Resumen**  
La CPU le manda a la GPU la imagen, la posición del mouse y el tamaño de la ventana. La GPU usa eso para mover el plano con ondas y mostrar la imagen en pantalla. La GPU no le devuelve nada a la CPU, solo dibuja el resultado.

**Parte del código donde se hace eso**  
````cpp
img.getTexture().bind();          
shader.begin();                   

shader.setUniform1f("mouseX", ofGetMouseX());     
shader.setUniform1f("mouseY", ofGetMouseY());     
shader.setUniform2f("resolution", ofGetWidth(), ofGetHeight()); 

plane.draw();                     

shader.end();                     
img.getTexture().unbind();        
````

**Cambios en Y para que se vea oscuro dependiendo de la posición del mouse**  
````cpp
#version 150

uniform sampler2D tex0;
uniform vec2 resolution;
uniform float mouseY;   // se agregó para recibir coordenadas en y

in vec2 texCoordVarying;
out vec4 outputColor;

void main()
{
    vec2 uv = texCoordVarying / resolution;
    vec4 texColor = texture(tex0, uv);

 
    float darkFactor = 1.0 - (mouseY / resolution.y); //convierte la posición vertical del mouse en un número entre 0 y 1.
    texColor.rgb *= darkFactor; //oscurece o aclara la imagen

    outputColor = texColor;
}
````

**Fotos**  
![alt text](<../imagenes/Captura de pantalla 2025-10-29 163750.png>)    
![alt text](<../imagenes/Captura de pantalla 2025-10-29 163802.png>)