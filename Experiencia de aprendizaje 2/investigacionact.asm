Inventa un programa que haga uso de la entrada-salida mapeada a memoria.  
```
(LOOP)
    @KBD
    D=M 

    @109       
    D=D-A      
    @CLEAR_LOOP
    D;JNE  

    @SCREEN
    M=-1
    @LOOP
    0;JMP

(CLEAR_LOOP)
    @SCREEN
    M=0
    @LOOP
    0;JMP
```