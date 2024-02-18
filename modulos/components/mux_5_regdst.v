// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

// Mux de 5 bits, com 1 bit de seleção trazido do RegDst para saber qual será o endereço de escrita
module mux_5_regdst(rt, rd, RegDst, imem_to_write_addr);
    // Declaração das entradas e saída
    input wire [4:0] rt, rd;
    input wire RegDst; // <= sinal da Control
    output wire [4:0] imem_to_write_addr;

    // Determinação do multiplexador
    assign imem_to_write_addr = RegDst ? rd : rt;

endmodule