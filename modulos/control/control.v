// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

module control (
    opcode,
    RegDst,
    PCOp,
    MemRead,
    MemtoReg,
    ALUOp,
    MemWrite,
    ALUSrc,
    RegWrite,
    Branch,
    isSigned
);
	input wire [5:0] opcode;
   output reg MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Branch, isSigned;
   output reg [1:0] PCOp, RegDst;
   output reg [4:0] ALUOp;

   always @(opcode) begin
		case (opcode)
			6'b000000: begin //sll, srl, sra, sllv, srlv, jr, add, sub, and, or, xor, nor, slt, sltu
				RegDst = 2'b01;
            PCOp = 2'b00;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 4'b0010;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b1;
            Branch = 1'b0;
            isSigned = 1'b1;
			end
         6'b000010: begin //j
            RegDst = 2'b00;
            PCOp = 2'b11;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 4'b0000;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            Branch = 1'b0;
				isSigned = 1'b1;
         end
         6'b000011: begin //jal
            RegDst = 2'b10;
            PCOp = 2'b11;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 4'b0000;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b1;
            Branch = 1'b0;
            isSigned = 1'b1;
			end
         6'b001000: begin //addi
            RegDst = 2'b00;
				PCOp = 2'b00;
				MemRead = 1'b0;
				MemtoReg = 1'b0;
				ALUOp = 4'b0000;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				Branch = 1'b0;
				isSigned = 1'b1;
			end
         6'b001010: begin //slti
				RegDst = 2'b00;
				PCOp = 2'b00;
				MemRead = 1'b0;
				MemtoReg = 1'b0;
				ALUOp = 4'b0011;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				Branch = 1'b0;
				isSigned = 1'b1;
			end
         6'b001011: begin //sltiu
				RegDst = 2'b00;
				PCOp = 2'b00;
				MemRead = 1'b0;
				MemtoReg = 1'b0;
				ALUOp = 4'b1000;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				Branch = 1'b0;
				isSigned = 1'b1;
			end
         6'b001100: begin //andi
            RegDst = 2'b00;
            PCOp = 2'b00;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 4'b0100;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            Branch = 1'b0;
            isSigned = 1'b0;
			end
         6'b001101: begin //ori
            RegDst = 2'b00;
            PCOp = 2'b00;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 4'b0101;
				MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            Branch = 1'b0;
            isSigned = 1'b0;
			end
         6'b001110: begin //xori
            RegDst = 2'b00;
            PCOp = 2'b00;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 4'b0110;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            Branch = 1'b0;
            isSigned = 1'b0;
			end
         6'b001111: begin //lui
            RegDst = 2'b00;
            PCOp = 2'b00;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 4'b0111;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            Branch = 1'b0;
            isSigned = 1'b0;
			end
         6'b100011: begin //lw
            RegDst = 2'b00;
            PCOp = 2'b00;
            MemRead = 1'b1;
            MemtoReg = 1'b1;
            ALUOp = 4'b0000;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            Branch = 1'b0;
            isSigned = 1'b1;
			end
         6'b101011: begin //sw
				RegDst = 2'b00;
            PCOp = 2'b00;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 4'b0000;
            MemWrite = 1'b1;
            ALUSrc = 1'b1;
            RegWrite = 1'b0;
            Branch = 1'b0;
            isSigned = 1'b1;
			end
			6'b000100: begin //beq
            RegDst = 2'b00;
            PCOp = 2'b01;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 4'b0001;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            Branch = 1'b1;
            isSigned = 1'b1;
			end
			6'b000101: begin //bne
				RegDst = 2'b00;
            PCOp = 2'b10;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 4'b0001;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            Branch = 1'b1;
            isSigned = 1'b1;
			end
			default: begin // Nao faz nada
            RegDst = 1'b0;
            PCOp = 2'b00;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 4'b0000;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            Branch = 1'b0;
				isSigned = 1'b0;
         end
		endcase
    end
    
endmodule
