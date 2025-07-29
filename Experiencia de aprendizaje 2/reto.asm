//Actividad 3

//Intento de actividad en palabras
//Paso 1: Primero miro la parte del teclado. Si la tecla que está en memoria no es la d, entonces me voy para la parte donde se borra la pantalla.
//Paso 2: Para empezar a borrar, me voy a la dirección de la pantalla (@16348)
//Paso 3: Esa dirección la guardo en una variable para ir avanzando de a una.
//Paso 4: Luego en un ciclo voy poniendo cero en donde esté parado, eso hace que se apague todo ese bloque de puntos.
//Paso 5: Después de poner cero le sumo uno para pasar a lo que sigue, como si fuera la siguiente parte de la pantalla.
//Paso 6: Repito lo mismo hasta que llego casi al final (24576) y ahí ya paro y vuelvo al inicio.

//Resultado bueno despues del intento
(LOOP)
@24576
D=M
@100
D=D-A       
@draw
D;JEQ  
@CLEAR
@0
D=M
(CLEAR)
    @SCREEN
    D=A
    @addr
    M=D 

(CLEAR_LOOP)
    @addr
    A=M
    M=0  

    @addr
    M=M+1 

    @addr
    D=M
    @24576
    D=A-D
    @CLEAR_LOOP
    D;JGT

    @LOOP
    0;JMP

(draw)
	// put bitmap location value in R12
	// put code return address in R13
	@SCREEN
	D=A
	@R12
	AD=D+M
	// row 8
	@31806 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	@31133 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	@31807 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	M=1
	// row 11
	D=A // D holds previous addr
	@31
	AD=D+A
	@385 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	M=1
	// row 12
	D=A // D holds previous addr
	@31
	AD=D+A
	@32509 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	M=1
	// row 13
	D=A // D holds previous addr
	@31
	AD=D+A
	@32762 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@32756 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	@16360 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 16
	D=A // D holds previous addr
	@32
	AD=D+A
	@24624 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 17
	D=A // D holds previous addr
	@32
	AD=D+A
	@12384 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 18
	D=A // D holds previous addr
	@32
	AD=D+A
	@6592 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 19
	D=A // D holds previous addr
	@32
	AD=D+A
	@1792 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// return
	@LOOP
	0;JMP

//Actividad 4
//Trataria de hacerlo de la misma manera que con la d pero teniendo en cuenta que e es @101 y que tendria el @clear. pdt: no funcionó y no tengo idea de por que, este solo dejó de funcionar (ya no dibuja)

@24576
D=M
@100
D=D-A       
@draw
D;JEQ       

// Verifica si se presionó la tecla "e" (101)
@24576
D=M
@101
D=D-A
@clear
D;JEQ       

@LOOP
0;JMP

(draw)
	// put bitmap location value in R12
	// put code return address in R13
	@SCREEN
	D=A
	@R12
	AD=D+M
	// row 8
	@31806 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	@31133 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	@31807 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	M=1
	// row 11
	D=A // D holds previous addr
	@31
	AD=D+A
	@385 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	M=1
	// row 12
	D=A // D holds previous addr
	@31
	AD=D+A
	@32509 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	M=1
	// row 13
	D=A // D holds previous addr
	@31
	AD=D+A
	@32762 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@32756 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	@16360 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 16
	D=A // D holds previous addr
	@32
	AD=D+A
	@24624 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 17
	D=A // D holds previous addr
	@32
	AD=D+A
	@12384 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 18
	D=A // D holds previous addr
	@32
	AD=D+A
	@6592 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 19
	D=A // D holds previous addr
	@32
	AD=D+A
	@1792 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// return
	@R13
	A=M
	D;JMP
