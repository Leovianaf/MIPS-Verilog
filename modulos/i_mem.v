
module i_mem (address, i_out);

    // Declaração de entradas e saída
    input wire [31:0] address;
    output wire [31:0] i_out;

    // Declaração da memória ROM
	 // A memória será um vetor com 256 posições, cada posição com capacidade de 32 bits
    reg [31:0] rom_mem [0:31];

    // Inicializando o arquivo com as instruções MIPS e passando para a ROM
    initial begin
        $readmemb("tests/instruction.list", rom_mem);
    end

	 // O endereço da instrução será obtido a partir dos 5 últimos bits de address, depois
	 // será usado como índice do vetor rom_mem. A instrução em binário será passada para i_out
    assign i_out = rom_mem[address[address_data-1:2]];
    
endmodule