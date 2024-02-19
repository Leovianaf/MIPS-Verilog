// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

module PC_ctrl (PCOp, ZeroFlag, Source);
    input wire [2:0] PCOp;
    input wire ZeroFlag;
    output reg [2:0] Source;

    always @(*) begin
        case (PCOp)
            3'b000: Source <= 3'b000; //PC + 4
            3'b001: Source <= {2'b0,ZeroFlag}; //BEQ
            3'b010: Source <= {2'b0,!ZeroFlag}; //BNE
            3'b011: Source <= 3'b010; // JUMP
				3'b100: Source <= 3'b011; // JR
				3'b101: Source <= 3'b100; // JAL
        endcase
    end
endmodule
