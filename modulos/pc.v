// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

module pc(nextPC, current_pc, clock);

	// Declaração de entradas e saída
	input clock;
	input wire [31:0] nextPC;
	output reg [31:0] current_pc;
	
	// Declaração de flag
	reg reset;

	// Inicializando reset = 0 e pc = 0
	initial begin
		reset = 0;
		current_pc = 32'b0;
	end

	// Atribuição síncrona. Se reset == 1, pc recebe o valor de nextPC. Se reset == 0, PC é zerado
	always @(posedge clock) begin
		if(reset) begin
			current_pc = nextPC;
		end else begin
			current_pc = 32'b0;
			reset = 1;
		end
	end
endmodule
