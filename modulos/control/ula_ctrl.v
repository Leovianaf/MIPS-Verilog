// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

module ula_ctrl(AluOp, func, op);
	
	input wire [3:0] AluOp;
   input wire [5:0] func;
   output reg [3:0] op;

   always @(*) begin
		case (AluOp)
			4'b0000: op <= 4'b0010; //ADDI, LW, SW => Utiliza ADD
         4'b0001: op <= 4'b0110; //Branch => Utiliza SUB
         4'b0010: //Instruções do tipo R
				case (func) // Mandar o codigo certo para a ULA com base no func
					6'b000100: op <= 4'b1110; //SLLV
					6'b000110: op <= 4'b1111; //SRLV
					6'b000111: op <= 4'b1010; //SRAV
					6'b000011: op <= 4'b0100; //SRA
					6'b000010: op <= 4'b0101; //SRL
					6'b000000: op <= 4'b0011; //SLL
					6'b100000: op <= 4'b0010; //add
					6'b100010: op <= 4'b0110; //sub
					6'b100100: op <= 4'b0000; //and
					6'b100101: op <= 4'b0001; //or
					6'b100110: op <= 4'b1101; //xor
					6'b100111: op <= 4'b1100; //nor
					6'b101010: op <= 4'b0111; //SLT
					6'b101011: op <= 4'b0111; //SLTU
					default: op <= 4'b0000; //defaults to AND
				endcase
         4'b0011: op <= 4'b0111; //slti
         4'b1000: op <= 4'b1000; //sltiu
         4'b0100: op <= 4'b0000; //andi
         4'b0101: op <= 4'b0001; //ori
         4'b0110: op <= 4'b1101; //xori
         4'b0111: op <= 4'b1011; //lui
			default: op <= 4'b0000; //defaults to AND
		endcase 
	end

endmodule
