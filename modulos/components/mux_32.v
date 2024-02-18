// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

// Mux de 32 bits, com 1 bit seletor
module mux_32(input[31:0] A, B, input S, output[31:0] Y);
   assign Y = S ? B: A; // Se S = 1; Y = B | S = 0; Y = A
endmodule
