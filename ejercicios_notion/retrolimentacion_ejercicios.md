# EJERCICIOS
## Ejercicio 1
### Compuertas  booleanas básicas de tres entradas  con descripción en operadores lógicos
```
module Compuertas(iA,iB,iC,oW,oX,oY,oZ); 
input iA,iB,iC; 
output oW,oX,oY,oZ; 

assign oW = iA&iB&iC;		  //Compuerta AND 3-In 
assign oW = ~(iA&iB&iC);	//Compuerta NAND 3-In 
assign oX = iA|iB|iC;			//Compuerta OR 3-In 
assign oX = ~(iA|iB|iC);	//Compuerta NOR 3-In 
assign oY = ~iB;			    //Compuerta NOT 
assign oY = ~iA;			    //Compuerta NOT 
assign oZ = iA^iB^iC;			//Compuerta OREX 3-In 
assign oZ = ~(iA^iB^iC);	//Compuerta NOREX 3-In 

endmodule
```
Al hacer el analisis de este codigo en quartus el programa quartus muestra este error:       

```
Info: Running Quartus II 64-Bit Analysis & Synthesis

Info: Version 13.1.0 Build 162 10/23/2013 SJ Web Edition

Info: Processing started: Wed Sep 10 18:12:36 2025

Info: Command: quartus_map --read_settings_files=on --write_settings_files=off Compuertas -c Compuertas

Info (20030): Parallel compilation is enabled and will use 8 of the 8 processors detected

Info (12021): Found 1 design units, including 1 entities, in source file compuertas.v

Info (12023): Found entity 1: Compuertas

Info (12127): Elaborating entity "Compuertas" for the top level hierarchy

Error (10028): Can't resolve multiple constant drivers for net "oW" at Compuertas.v(6)

Error (10029): Constant driver at Compuertas.v(5)

Error (10028): Can't resolve multiple constant drivers for net "oX" at Compuertas.v(8)

Error (10029): Constant driver at Compuertas.v(7)

Error (10028): Can't resolve multiple constant drivers for net "oY" at Compuertas.v(10)

Error (10029): Constant driver at Compuertas.v(9)

Error (10028): Can't resolve multiple constant drivers for net "oZ" at Compuertas.v(12)

Error (10029): Constant driver at Compuertas.v(11)

Error (12153): Can't elaborate top-level user hierarchy

Error: Quartus II 64-Bit Analysis & Synthesis was unsuccessful. 9 errors, 0 warnings

Error: Peak virtual memory: 4654 megabytes

Error: Processing ended: Wed Sep 10 18:12:37 2025

Error: Elapsed time: 00:00:01

Error: Total CPU time (on all processors): 00:00:01
```
El fallo se debe a que en el archivo Verilog se estaban reutilizando las mismas salidas (`oW`, `oX`, `oY`, `oZ`) para varias compuertas.  
La solución consiste en asignar **una salida diferente por cada operación lógica**, garantizando que cada `output` tenga una sola definición.     

#### Corregido quedaria asi     

```
module Compuertas(iA, iB, iC, oAND, oNAND, oOR, oNOR, oNOTA, oNOTB, oXOR, oXNOR);
    input iA, iB, iC;
    output oAND, oNAND, oOR, oNOR, oNOTA, oNOTB, oXOR, oXNOR;

    assign oAND  = iA & iB & iC;      // AND 3 entradas
    assign oNAND = ~(iA & iB & iC);   // NAND 3 entradas
    assign oOR   = iA | iB | iC;      // OR 3 entradas
    assign oNOR  = ~(iA | iB | iC);   // NOR 3 entradas
    assign oNOTA = ~iA;               // NOT de A
    assign oNOTB = ~iB;               // NOT de B
    assign oXOR  = iA ^ iB ^ iC;      // XOR 3 entradas
    assign oXNOR = ~(iA ^ iB ^ iC);   // XNOR 3 entradas
endmodule

```
## Ejercicio 2
### Expresión booleana usando operadores lógicos

#### Implementar el circuito de la figura 1, usando la definición de compuertas dada en el ejercicio 1.

![Figura1](/imagenes/image.png)
