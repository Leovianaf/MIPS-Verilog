// Extensor de sinal

module sign_extend (in, is_signed, out);
    input wire [15:0] in; // Palavra de entrada com 16 bits
    input wire is_signed;	// Sinal de controle para saber se a palavra deve ser estendida ou não
    output wire [31:0] out;	// Saída do sinal caso seja estendido
	 
endmodule 