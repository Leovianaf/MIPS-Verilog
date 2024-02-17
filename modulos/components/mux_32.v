// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira
// Leonardo Viana
// Paloma Raissa
// Ricardo Zaidan
// -----------------------------
module mux_32(input[31:0] A, B, input S, output[31:0] Y);
   assign Y = S ? B: A;
endmodule
