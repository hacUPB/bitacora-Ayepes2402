//Actividad 03

//mover el contenido de la posición 200 a la 100 
```
@200  
D=M 
@100 
M=D 
 ```
Actividad 4:  
 ```
@16384  
D = A  
@16  
M = D 
 ```
//Sumarle 20 a la que ya está en el registro 16 
 ```
@16384  
D = A  
@16  
M = D 
A = 20 
D = A 
@16 
M= D + M 
 ```
// ahora escribe un programa en lenguaje ensamblador que guarde en la posición 32 de la RAM un 100 
 ```
@16384  
D = A  
@16  
M = D 
A = 20 
D = A 
@16 
M= D + M 
@100 
D=A 
@32 
M=D 
 ```
//En la posición 3 lo que tiene restarle 15 
```
@15 
D=A 
@3 
M=M-D 
 ```
//RAM[2] = RAM[0] + RAM[1] + 17 
 ```
@0 
D=M 
@1 
D=D+M 
@17 
D=D+A 
@2 
M=D 
```