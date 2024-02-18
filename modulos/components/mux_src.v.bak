module mux_src(input ALUsrc, input[31:0] read_d2, signExtended32, output reg[31:0]ALUin2);
	// Bloco que será executado a partir de todas as entradas
	always @(ALUsrc, read_d2, signExtended32) begin
		/*Casos possíveis para a flag de controle ALUsrc, onde 
		ela determina o valor que será passado para a saída*/
		case (ALUsrc)
			0: ALUin2 <= read_d2;
			1: ALUin2 <= signExtended32;
		endcase
	end
endmodule