//Escribe un programa en lenguaje ensamblador que sume los primeros 100 números naturales.

int i = 1;
int sum = 0;
While (i <= 100){
   sum += i;
   i++;
}

//lenguaje ensamblador  

@i
M=1         
@sum
M=0         
@limit
M=100       

(LOOP)
@i
D=M         
@limit
D=D-M       
@END
D;JGT       

@i
D=M         
@sum
M=M+D       

@i
M=M+1       

@LOOP
0;JMP       

(END)
@END
0;JMP       


//Transforma el programa en alto nivel anterior para que utilice un ciclo for en vez de un ciclo while.

int sum = 0;
for (int i = 1; i <= 100; i++) {
    sum += i;
}

//Escribe un programa en lenguaje ensamblador que implemente el programa anterior.

@sum
M=0 

@i
M=1

@limit
M=100 

(FOR_LOOP)
@i
D=M
@limit
D=D-M
@END
D;JGT

@i
D=M
@sum
M=M+D

@i
M=M+1

@FOR_LOOP
0;JMP 

(END)
@END
0;JMP

//Traduce este programa a lenguaje ensamblador:
int a = 10;
int *p;
p = &a;
*p = 20;

//Lenguaje ensamblador
@10 
D=A 
@var
M=D
@var
D=A
@punt
M=D
@20
D=A
@punt
A=M
M=D

//Traduce este programa a lenguaje ensamblador:
int a = 10;
int b = 5;
int *p;
p = &a;
b = *p;

//Lenguaje ensamblador 
@10
D=A 
@var1
M=D
@5
D=A 
@var2
M=D
@var1
A=D
@punt 
M=D 
@punt 
A=M
D=M
@var2 
M=D 

//Considera que el punto de entrada del siguiente programa es la función main, es decir, el programa inicia llamando la función main. Vas a proponer una posible traducción a lenguaje ensamblador de la función suma, cómo llamar a suma y cómo regresar a std::cout << "El valor de c es: " << c << std::endl; una vez suma termine.
#include <iostream>

int suma(int a, int b) {
   int var = a + b;
   return var;
}


int main() {
   int c = suma(6, 9);
   std::cout << "El valor de c es: " << c << std::endl;
   return 0;
}

//lenguaje ensamblador 

(MAIN) 
@suma 
0:JMP
(volver)
(END)
@END
0:JMP


(suma)
@volver 
0:JMP

