// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

module d_mem (
    input [31:0] address, writeData,
    input memWrite, memRead,
    output reg [31:0] readData
);

    // Declarar a memória interna
    reg [31:0] memory [0:63];

    // Lógica combinacional de escrita
    always @* begin
        if (memWrite) begin
            memory[address] = writeData;
        end
    end

    // Lógica combinacional de leitura
    always @* begin
        if (memRead) begin
            readData = memory[address];
        end else begin
            readData = 32'bz; // Alta impedância
        end
    end

endmodule
