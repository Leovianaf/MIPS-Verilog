// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

// Mux de 32 bits com 5 entradas e 3 bit seletores, usado no pc
module mux_32_5 (input [31:0] A, B, C, D, E, input [2:0] S, output reg [31:0] Y);
	
	always @(*) begin
		case (S)
			3'b000: Y = A;
			3'b001: Y = B;
			3'b010: Y = C;
			3'b011: Y = D;
			3'b100: Y = E;
			default: Y = 32'b0; // Valor padrao caso o seletor seja invalido
		endcase
	end
	
endmodule
// mux_32_4 pc_mux (pc_increment, add_branching_to_mux, jump_module_to_mux, jr_PC, PCSource, nextPC);