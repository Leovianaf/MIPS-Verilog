// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

module pc_plus(current_pc, pc_plus);
	// Declaração de entradas e saída
	input wire [31:0] current_pc;
	output reg [31:0] pc_plus;	

	always @* begin
		pc_plus = current_pc + 1; // Pois as instrucoes no arquivo passam de 1 em 1
	end
endmodule
