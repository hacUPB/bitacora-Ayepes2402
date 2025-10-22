## Actividad 1  

**¿Qué son los vértices?**    
Son los puntos que forman las esquinas de una figura 3D.

**¿Con qué figura geométrica se dibuja en 3D?**    
Con triángulos.

**¿Qué es un shader?**     
Es un programa que le dice a la tarjeta gráfica cómo dibujar cosas.

**¿Cómo se le llaman a los grupos de píxeles de un mismo triángulo?**  
Fragmentos.

**¿Qué es un fragment shader?**  
Es el que decide el color de cada píxel del triángulo.

**¿Qué es un vertex shader?**  
Es el que calcula la posición de cada vértice en la pantalla.

**¿Al proceso de determinar qué pixels del display va a cubrir cada triángulo de una mesh se le llama?**   
Rasterización.

**¿Qué es el render pipeline?**     
Es el proceso que sigue la compu para transformar un modelo 3D en imagen.

**¿Hay alguna diferencia entre aplicar un color a una superficie de una mesh o aplicar una textura?**  
Sí, el color es uno solo y la textura es una imagen.

**¿Cuál es la diferencia entre una textura y un material?**  
La textura es una imagen y el material combina texturas y efectos de luz.

**¿Qué transformaciones se requieren para mover un vértice del 3D world al View Screen?**  
Transformación del mundo, vista y proyección.

**¿Al proceso de convertir los triángulos en fragmentos se le llama?**   
Rasterización.

**¿Qué es el framebuffer?**   
Es la memoria donde se guarda la imagen final antes de mostrarla.

**¿Para qué se usa el Z-buffer o depth buffer en el render pipeline?**   
Para saber qué objeto está más cerca y cuál se ve primero.

## Actividad 2

## Ejemplo 1  
Ahora ejecuta el código original. Analiza los resultados y responde:

**¿Cómo funciona?**
El código carga un shader y se lo pone a un rectángulo que ocupa toda la pantalla. En el draw() el shader se activa, se dibuja el rectángulo y luego se desactiva. Todo lo que se dibuje entre shader.begin() y shader.end() pasa por la tarjeta gráfica y cambia según el shader.

**¿Qué resultados obtuviste?**   
![alt text](<Captura de pantalla 2025-10-20 171343.png>)   

**Despues de cambiar el código en clase**  

![alt text](<Captura de pantalla 2025-10-20 173104.png>)

**¿Estás usando un vertex shader?**    
Sí, se está usando un vertex shader para calcular dónde va cada punto del modelo.

**¿Estás usando un fragment shader?**   
Sí, se está usando un fragment shader para decidir el color y la apariencia de cada píxel en la pantalla.

**Analiza el código de los shaders. ¿Qué hace cada uno?**    
El vertex shader se encarga de decirle al programa en qué parte van los puntos del rectángulo para que se dibuje bien.En cambio, el fragment shader es el que decide qué color va a tener cada parte del dibujo.

## Ejemplo 2  

**¿Cómo funciona?**  
Hace un plano 3D en el centro de la pantalla que se va deformando con el shader. El color cambia según dónde esté el mouse en X (de rosado a azul) y el plano gira cuando mueves el mouse en Y.

**¿Qué resultados obtuviste?**   

![alt text](<Captura de pantalla 2025-10-22 142833.png>)   

**¿Estás usando un vertex shader?**    
Sí, se está usando un vertex shader para los puntos del plano.

**¿Estás usando un fragment shader?**    
Sí, se está usando un fragment shader para los colores del plano.

**Analiza el código de los shaders. ¿Qué hace cada uno?**
El vertex shader mueve los puntos del plano para que se deforme y el fragment shader pone los colores, que van de rosado a azul según dónde esté el mouse.

## Ejemplo 3  

**¿Cómo funciona?**    
El programa pone un plano grande en la pantalla y le aplica un shader que cambia cuando mueves el mouse (dependiendo de hacia donde se mueve cambia de color entre rosado, morado y azul) Al moverlo se ve un efecto como si la imagen se deformara, parecido una burbuja.

**¿Qué resultados obtuviste?**    
![alt text](<Captura de pantalla 2025-10-22 144455.png>)   

**¿Estás usando un vertex shader?**   
Sí, se está usando un vertex shader para los puntos del plano y para deformarlo como una burbuja.

**¿Estás usando un fragment shader?**   
Sí, se está usando un fragment shader para los colores del plano y que cambien dependiendo de la posición del mouse en X.

**Analiza el código de los shaders. ¿Qué hace cada uno?**   
El vertex shader cambia la forma o posición del plano según los valores que recibe, como la posición del mouse y el fragment shader se encarga de pintar el color del plano, que pasa de magenta a azul dependiendo de dónde esté el cursor.

## Ejemplo 4  

**¿Cómo funciona?**    
Se carga una imagen de diamantes de colores sobre un plano y el shader se encarga de seguir el movimiento del mouse para poder mover el plano.

**¿Qué resultados obtuviste?**    
![alt text](<Captura de pantalla 2025-10-22 145837.png>)

**¿Estás usando un vertex shader?**   
Sí, se usa un vertex shader para mover los puntos del plano y ajustar cómo se ve con el mouse.

**¿Estás usando un fragment shader?**    
Sí, se usa un fragment shader para cambiar los colores y efectos de la imagen.

**Analiza el código de los shaders. ¿Qué hace cada uno?**   
El vertex shader acomoda el plano y la textura según el movimiento del mouse y el fragment shader pinta la imagen y le da los efectos visuales que se ven en pantalla.

## Ejemplo 5  

**¿Cómo funciona?**   
Carga dos imágenes: una es la original que tiene como unos diamantes de colores y la otra sirve como máscara. Después, se usa un shader que mezcla ambas para crear un efecto tipo “masking”.

**¿Qué resultados obtuviste?**  
![alt text](<Captura de pantalla 2025-10-22 162623.png>)

**¿Estás usando un vertex shader?**  
Sí, se usa un vertex shader el cual sirve para organizar los puntos de la imagen y mandarlos al siguiente paso del dibujo.

**¿Estás usando un fragment shader?**  
Sí, se usa un fragment shader ya que este se encarga de pintar los píxeles y mezclar la imagen normal con la máscara.

**Analiza el código de los shaders. ¿Qué hace cada uno?**  
El vertex shader acomoda la forma de la imagen y el fragment shader combina los colores de las dos imágenes para crear el efecto de máscara, mostrando solo las partes que deja ver la máscara.

## Ejemplo 6  

**¿Cómo funciona?**   
El programa usa una cámara, un video y una imagen, y los mezcla usando una máscara que se mueve con el mouse. El shader se encarga de combinar todo y mostrar el resultado final dentro de un recuadro.

**¿Qué resultados obtuviste?**  
![alt text](<Captura de pantalla 2025-10-22 163309.png>)

**¿Estás usando un vertex shader?**  
Sí, se usa vertex shader para manejar la posición de los vértices, o sea, cómo se dibujan las formas en la pantalla.

**¿Estás usando un fragment shader?**  
Sí, se usa fragment shader ya que este es el que pinta los colores finales de cada píxel y mezcla las texturas (imagen, video y cámara) según la máscara.

**Analiza el código de los shaders. ¿Qué hace cada uno?**  
El vertex shader prepara la forma y tamaño de la imagen en pantalla y el fragment shader mezcla los colores de las tres fuentes (cámara, video e imagen) aplicando la máscara para crear el efecto visual final.

## Ejemplo 7  

**¿Cómo funciona?**   
El programa deja pintar con una brocha en la pantalla, y lo que pintas se usa como una máscara. Un shader mezcla varias imágenes y solo se ven las partes donde dibujas. También puedes borrar o cambiar el tamaño del pincel.

**¿Qué resultados obtuviste?**  
![alt text](<Captura de pantalla 2025-10-22 163732.png>)

**Despues de usar T**    
![alt text](<Captura de pantalla 2025-10-22 163740.png>)

**¿Estás usando un vertex shader?**  
Sí, se usa vortex shader para ordenar los puntos donde se dibujan las imágenes en la pantalla.

**¿Estás usando un fragment shader?**  
Sí, se usa el fragment shader ya que este es el que pinta los colores y mezcla las texturas según la parte que pintas con la máscara.

**Analiza el código de los shaders. ¿Qué hace cada uno?**  
El vertex shader acomoda la forma donde se dibuja todo y el fragment shader mezcla las imágenes y crea el efecto final que se ve cuando pintas.

## Ejemplo 8  

**¿Cómo funciona?**   
El programa crea una imagen en blanco y negro con ruido que cambia con el tiempo y con el movimiento del mouse. Esa imagen se pone como textura en un plano 3D que gira cuando mueves el mouse.

**¿Qué resultados obtuviste?**   
![alt text](<Captura de pantalla 2025-10-22 164125.png>)

**¿Estás usando un vertex shader?**    
Sí, se usa vertex shader para mover y girar los puntos del plano en el espacio 3D.

**¿Estás usando un fragment shader?**  
Sí, se usa fragment shader ya que este es el que pinta los colores y muestra la textura del ruido en la superficie.

**Analiza el código de los shaders. ¿Qué hace cada uno?**  
El vertex shader acomoda la forma y el giro del plano y el fragment shader pinta los píxeles con la textura que cambia, creando el efecto de movimiento.

## Ejemplo 9  

**¿Cómo funciona?**   
El programa carga una imagen y le pone un efecto de desenfoque. Usa dos shaders: uno desenfoca a lo ancho y el otro a lo alto. El nivel de blur cambia cuando mueves el mouse.

**¿Qué resultados obtuviste?**  
![alt text](<Captura de pantalla 2025-10-22 164539.png>)

**Despues de mover el mouse**  
![alt text](<Captura de pantalla 2025-10-22 164533-1.png>)

**¿Estás usando un vertex shader?**  
Sí, usa vertex shader pero solo sirve para colocar bien la imagen en la pantalla.

**¿Estás usando un fragment shader?**  
Sí, usa fragment shader es el que realmente hace el desenfoque, mezclando los colores de los píxeles para que se vea borroso.

**Analiza el código de los shaders. ¿Qué hace cada uno?**  
El shaderBlurX desenfoca de forma horizontal y el shaderBlurY de forma vertical. Juntos hacen que la imagen quede desenfocada en todas las direcciones.

* **shaderBlurX:** aplica el desenfoque en el eje X, o sea, de izquierda a derecha. Toma varios píxeles vecinos en esa dirección y los mezcla para que se vea borroso horizontalmente.  

* **shaderBlurY:** hace lo mismo pero en el eje Y, o sea, de arriba a abajo. Mezcla los píxeles en vertical.

## Actividad 3  
Ahora vas a pasar información personalizada de tu programa a los shaders. Vas a leer con detenimiento el tutorial Adding Uniforms.

**¿Qué es un uniform?**   
Una variable global y constante (está en el draw) que se está mandando desde la CPU a la GPU.

**¿Cómo funciona el código de aplicación, los shaders y cómo se comunican estos?**

Modifica el código de la actividad para cambiar el color de cada uno de los píxeles de la pantalla personalizando el fragment shader.