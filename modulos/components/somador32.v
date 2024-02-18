// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

module somador32 (in1,in2,out);
    input wire [31:0] in1, in2;
    output wire [31:0] out;

    assign out = in1 + in2;
    
endmodule
