// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

// Jump acessa no next_pc, concatena com o endereco desejado e adiciona 2 bits 0 para o alinhamento
module jump (next_pc, address, new_pc);
   input wire [3:0] next_pc;
   input wire [25:0] address;
	output wire [31:0] new_pc;

	// Adicionar 2 bits 0 no final funciona da mesma maneira do shift left, sem perder os bits do address
   assign new_pc = {next_pc, address, 2'b00};
endmodule
