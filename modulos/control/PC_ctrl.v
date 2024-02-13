// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira
// Leonardo Viana
// Paloma Raissa
// Ricardo Zaidan
// -----------------------------
module PC_ctrl (PCSource, ZeroFlag, Source);
    input wire [1:0] PCSource;
    input wire ZeroFlag;
    output reg [1:0] Source;

    always @(*) begin
        case (PCSource)
            2'b00: Source <= 2'b00; //PC + 4
            2'b01: Source <= {1'b0,ZeroFlag}; //BEQ
            2'b10: Source <= {1'b0,!ZeroFlag}; //BNE
            2'b11: Source <= 2'b10; //J and JAL PC Sourcing
        endcase
    end
endmodule