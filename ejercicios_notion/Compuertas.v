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
