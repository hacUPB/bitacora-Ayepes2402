1.Carga en D el valor 1978.
```
@1798
D=A
```
2.Guarda en la posición 100 de la RAM el número 69.
```
@69
D=A
@100
M=D
```
3.Guarda en la posición 200 de la RAM el contenido de la posición 24 de la RAM
```
@100
D=A
@24
M=D
D=M
@200
M=D
```
4.Lee lo que hay en la posición 100 de la RAM, resta 15 y guarda el resultado en la posición 100 de la RAM.
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
5.Suma el contenido de la posición 0 de la RAM, el contenido de la posición 1 de la RAM y con la constante 69. Guarda el resultado en la posición 2 de la RAM.
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
6.Si el valor almacenado en D es igual a 0 salta a la posición 100 de la ROM.
```
@100
D;JEQ
```
7.Si el valor almacenado en la posición 100 de la RAM es menor a 100 salta a la posición 20 de la ROM.
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
8.Considera el siguiente programa:
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
En esas posiciones porque es de 16 en adelante

9.Considera el siguiente programa:
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
Esto debido a que tal como se dijo en clase las variantes van de 16 en adelante.
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
10.Las posiciones de memoria RAM de 0 a 15 tienen los nombres simbólico R0 a R15. Escribe un programa en lenguaje ensamblador que guarde en R1 la operación 2 * R0.
```
@R0
D=M
@R1
M=D+D
```
11.Considera el siguiente programa:
```
i = 1000
LOOP:
if (i == 0) goto CONT
i = i - 1
goto LOOP
CONT:
```
La traducción a lenguaje ensamblador del programa anterior es:
```
// i = 1000
@1000
D=A
@i
M=D
(LOOP)
// if (i == 0) goto CONT
@i
D=M
@CONT
D;JEQ
// i = i - 1
@i
M=M-1
// goto LOOP
@LOOP
0;JMP
(CONT)
```
* ¿Qué hace este programa?  
Genera un loop el cual si i es diferente a 0 le resta 1 (compara el numero)  
* ¿En qué memoria está almacenada la variable i? ¿En qué dirección de esa memoria?  
La  variable se almacena en la memoria RAM y en la posicion 16
* ¿En qué memoria y en qué dirección de memoria está almacenado el comentario //`i = 1000?`  
Como son comentarios no estarian en ningun lado
* ¿Cuál es la primera instrucción del programa anterior? ¿En qué memoria y en qué dirección de memoria está almacenada esa instrucción?  
Posicionarse en el @1000, en la memoria ROM y en la direccion 0  
* ¿Qué son CONT y LOOP?  
CONT y LOOP son etiquetas 
Cont: es un contador  
LOOP: es un bucle con una condicion  
* ¿Cuál es la diferencia entre los símbolos `i` y `CONT`?  
La diferencia entre estos es que i es una constante (variable) y cont es un contador (etiqueta)

12.Cmplemente en ensamblador:
R4 = R1 + R2 + 69  
```
@1
D=M
@2
D=D+M
@69
D=D+A
```
13.Implementa en ensamblador:
```
if R0 >= 0 then R1 = 1
else R1 = –1

(LOOP)
goto LOOP
```
```
@R0
D=M
@0
D=D-A
@R1
D;JGE

//R0<0
@R!
M=-1
@LOOP
@;JMP

//SI R0 >=0
@R1
M=1
@LOOP
@;JMP
(LOOP)
```
14.Implementa en ensamblador:

R4 = RAM[R1]

``
@R4 = RAM[R1]
@R1
D=M
@R4
M=D
```
15.Implementa en ensamblador el siguiente problema. En la posición R0 está almacenada la dirección inicial de una región de memoria. En la posición R1 está almacenado el tamaño de la región de memoria. Almacena un -1 en esa región de memoria.  

```
(LOOP)
@R0
A=M
M=-1
@R1
M=M-1
D=M
@R0
M=M+1
@LOOP
D;JNE
```

16.Implementa en lenguaje ensamblador el siguiente programa:
```
int[] arr = new int[10];
int sum = 0;
for (int j = 0; j < 10; j++) {
    sum = sum + arr[j];
}
```
Lenguaje ensamblador:
```
@10
D=A
@arr
M=D
D=M
@sum
M=0
@j
M=0
(LOOP)
@j
A=D+M
D=M
@sum
M=M+1
@10
D=A
@j
D=D-M
@LOOP
D;JLE
(END)
@END
0;JMP
```
* ¿Qué hace este programa?
* ¿Cuál es la dirección base de arr en la memoria RAM?
* ¿Cuál es la dirección base de sum en la memoria RAM y por qué?
* ¿Cuál es la dirección base de j en la memoria RAM y por qué?

