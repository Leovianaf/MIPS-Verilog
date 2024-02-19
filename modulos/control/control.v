// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

module control (
    opcode,
    RegDst,
    MemRead,
    MemtoReg,
    ALUOp,
    MemWrite,
    ALUSrc,
    RegWrite,
    Branch,
	 BranchNe,
	 Jump,
    isSigned
);
	input wire [5:0] opcode;
   output reg RegDst, MemRead, MemWrite, ALUSrc, RegWrite, Branch, BranchNe, Jump, isSigned;
   output reg [1:0] MemtoReg;
   output reg [2:0] ALUOp;

   always @(opcode) begin
		case (opcode)
			6'b000000: begin //sll, srl, sra, sllv, srlv, srav, jr, add, sub, and, or, xor, nor, slt, sltu
				RegDst = 1'b1;
            MemRead = 1'b0;
            MemtoReg = 2'b00;
            ALUOp = 3'b110;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b1;
            Branch = 1'b0;
				BranchNe = 1'b0;
				Jump = 1'b0;
            isSigned = 1'b1;
			end
         6'b000010: begin //j
            RegDst = 1'bx;
            MemRead = 1'b0;
            MemtoReg = 2'bxx;
            ALUOp = 3'bxxx;
            MemWrite = 1'b0;
            ALUSrc = 1'bx;
            RegWrite = 1'b0;
            Branch = 1'bx;
				BranchNe = 1'bx;
				Jump = 1'b1;
				isSigned = 1'b1;
         end
         6'b000011: begin //jal
            RegDst = 1'bx;
            MemRead = 1'b0;
            MemtoReg = 2'b10;
            ALUOp = 3'bxxx;
            MemWrite = 1'b0;
            ALUSrc = 1'bx;
            RegWrite = 1'b1;
            Branch = 1'bx;
				BranchNe = 1'bx;
				Jump = 1'b1;
            isSigned = 1'b1;
			end
			6'b000100: begin //beq
            RegDst = 1'bx;
            MemRead = 1'b0;
            MemtoReg = 2'bxx;
            ALUOp = 3'b001;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            Branch = 1'b1;
				BranchNe = 1'b0;
				Jump = 1'b0;
            isSigned = 1'b1;
			end
			6'b000101: begin //bne
				RegDst = 1'bx;
            MemRead = 1'b0;
            MemtoReg = 2'bxx;
            ALUOp = 3'b001;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            Branch = 1'b1;
				BranchNe = 1'b1;
				Jump = 1'b0;
            isSigned = 1'b1;;
			end
         6'b001000: begin //addi
            RegDst = 1'b0;
				MemRead = 1'b0;
				MemtoReg = 2'b00;
				ALUOp = 3'b000;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				Branch = 1'b0;
				BranchNe = 1'b0;
				Jump = 1'b0;
				isSigned = 1'b1;
			end
         6'b001010: begin //slti
				RegDst = 1'b0;
				MemRead = 1'b0;
				MemtoReg = 2'b00;
				ALUOp = 3'b101;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				Branch = 1'b0;
				BranchNe = 1'b0;
				Jump = 1'b0;
				isSigned = 1'b1;
			end
			6'b001011: begin //sltiu
				RegDst = 1'b0;
				MemRead = 1'b0;
				MemtoReg = 2'b00;
				ALUOp = 3'b101;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				Branch = 1'b0;
				BranchNe = 1'b0;
				Jump = 1'b0;
				isSigned = 1'b1;
			end
         6'b001100: begin //andi
            RegDst = 1'b0;
				MemRead = 1'b0;
				MemtoReg = 2'b00;
				ALUOp = 3'b010;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				Branch = 1'b0;
				BranchNe = 1'b0;
				Jump = 1'b0;
				isSigned = 1'b0;
			end
         6'b001101: begin //ori
            RegDst = 1'b0;
				MemRead = 1'b0;
				MemtoReg = 2'b00;
				ALUOp = 3'b011;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				Branch = 1'b0;
				BranchNe = 1'b0;
				Jump = 1'b0;
				isSigned = 1'b0;;
			end
         6'b001110: begin //xori
            RegDst = 1'b0;
				MemRead = 1'b0;
				MemtoReg = 2'b00;
				ALUOp = 3'b100;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				Branch = 1'b0;
				BranchNe = 1'b0;
				Jump = 1'b0;
				isSigned = 1'b0;
			end
         6'b001111: begin //lui
            RegDst = 1'b0;
				MemRead = 1'b0;
				MemtoReg = 2'b00;
				ALUOp = 3'b000;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				Branch = 1'b0;
				BranchNe = 1'b0;
				Jump = 1'b0;
				isSigned = 1'b1;
			end
         6'b100011: begin //lw
            RegDst = 1'b0;
				MemRead = 1'b1;
				MemtoReg = 2'b01;
				ALUOp = 3'b000;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				Branch = 1'b0;
				BranchNe = 1'b0;
				Jump = 1'b0;
				isSigned = 1'b0;
			end
         6'b101011: begin //sw
				RegDst = 1'bx;
				MemRead = 1'b0;
				MemtoReg = 2'bxx;
				ALUOp = 3'b000;
				MemWrite = 1'b1;
				ALUSrc = 1'b1;
				RegWrite = 1'b0;
				Branch = 1'b0;
				BranchNe = 1'b0;
				Jump = 1'b0;
				isSigned = 1'b0;
			end
			default: begin // Nao faz nada
            RegDst = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 2'b00;
            ALUOp = 3'b000;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            Branch = 1'b0;
				BranchNe = 1'b0;
				Jump = 1'b0;
				isSigned = 1'b0;
         end
		endcase
    end
    
endmodule
