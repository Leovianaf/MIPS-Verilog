// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

module i_mem (address, i_out);

    // Declaração de entradas e saída
    input wire [31:0] address;
    output wire [31:0] i_out;

    // Declaração da memória ROM
	 // A memória será um vetor com 256 posições, cada posição com capacidade de 32 bits
    reg [31:0] rom_mem [0:255];

    // Inicializando o arquivo com as instruções MIPS e passando para a ROM
    initial begin
        $readmemb("tests/instructions.list", rom_mem);
    end

	// Endereço é como o índice do vetor, a partir dele a instrução é obtida
    assign i_out = rom_mem[address];
    
endmodule
