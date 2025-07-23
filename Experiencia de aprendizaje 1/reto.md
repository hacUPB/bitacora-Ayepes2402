//Carga en D el valor 1978.
```
@1798
D=A
```
//Guarda en la posición 100 de la RAM el número 69.
```
@69
D=A
@100
M=D
```
//Guarda en la posición 200 de la RAM el contenido de la posición 24 de la RAM
```
@100
D=A
@24
M=D
D=M
@200
M=D
```
//Lee lo que hay en la posición 100 de la RAM, resta 15 y guarda el resultado en la posición 100 de la RAM.
```
@25
D=A
@100
M=D
@15
D=A
@100
M=M-D
```
//Suma el contenido de la posición 0 de la RAM, el contenido de la posición 1 de la RAM y con la constante 69. Guarda el resultado en la posición 2 de la RAM.
```
@0
D=M
@1
D=D+M
@69
D=D+A
@2
M=D
```
//Si el valor almacenado en D es igual a 0 salta a la posición 100 de la ROM.
```
@100
D;JMP
```
//Si el valor almacenado en la posición 100 de la RAM es menor a 100 salta a la posición 20 de la ROM.
```
@50
D=A
@100
M=D
@100
D=D-A
@20
D;JLT
```
//Considera el siguiente programa:
```
@var1
D = M
@var2
D = D + M
@var3
M = D
```
* ¿Qué hace este programa?  
lo que hizo el prograba fue que sumo la variable 1 y 2 y lo puso en 3  
* En qué posición de la memoria está `var1`, `var2` y `var3`? ¿Por qué en esas posiciones?  
var1 estaria en la posicion 16  
var2 estaria en la posicion 17  
var3 seria en la posicion 18  

///Considera el siguiente programa:
```
i = 1
sum = 0
sum = sum + i
i = i + 1
```
//La traducción a lenguaje ensamblador del programa anterior es:
```
// i = 1
@i
M=1
// sum = 0
@sum
M=0
// sum = sum + i
@i
D=M
@sum
M=D+M
// i = i + 1
@i
D=M+1
@i
M=D
```
* ¿Qué hace este programa?  
Lo que hace este programa es que i empiece en 1 y sum en 0, luego suma el valor de i a sum y i incrementa 1  
* ¿En qué parte de la memoria RAM está la variable `i` y `sum`? ¿Por qué en esas posiciones?  
La posicion de i es 16  
La posicion de SUM es 17  
* Optimiza esta parte del código para que use solo dos instrucciones:
```
// i = i + 1
@i
D=M+1
@i
M=D
```
```
@i
M=M+1
```