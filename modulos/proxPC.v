// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

module proxPC(pc_plus, address, jump, branch, branchNe, zeroFlag, imm_extended, nextPC);
	// Declaração de entradas e saída
	input wire [31:0] pc_plus;
	input wire [25:0] address;
	input wire jump;
	input wire branch;
	input wire branchNe;
	input wire zeroFlag;
	input wire [31:0] imm_extended;
	output reg [31:0] nextPC;

	always @(*) begin
		if (jump) begin
			nextPC = {pc_plus[31:26], address};
		end else if ((branchNe ^ zeroFlag) && branch) begin
			nextPC = pc_plus + imm_extended;
		end else begin
			nextPC = pc_plus;
		end
	end
	
endmodule
