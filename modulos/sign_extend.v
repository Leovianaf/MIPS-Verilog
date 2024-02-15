module sign_extend (in, is_signed, out);
    input wire [15:0] in; // Palavra de entrada com 16 bits
    input wire is_signed;	// Sinal de controle para saber se a palavra deve ser estendida ou não
    output wire [31:0] out;	// Saída do sinal caso seja estendido

    assign out = is_signed ? $signed(in) : {16'b0, in};
	// Se is_signed = TRUE, a palavra in será estendida replicando 16 vezes o seu bit mais significativo
	// para que não haja perda de sinal.
	// Se is_signed = FALSE, serão adicionados 16 bits 0 à frente da palavra.
	 
endmodule
