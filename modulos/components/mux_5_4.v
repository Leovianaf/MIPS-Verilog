module mux_5_4(inst0, inst1, inst2, inst3, RegDst, imem_to_write_addr);
	// Declaração das entradas e saída
	input [4:0] inst0, inst1, inst2, inst3;
	input [1:0] RegDst; // <= sinal da Control
	output wire [4:0] imem_to_write_addr;

	// Determinação do multiplexador
	assign imem_to_write_addr = RegDst[1] ? (RegDst[0] ? inst3 : inst2) : (RegDst[0] ? inst1 : inst0);

endmodule
