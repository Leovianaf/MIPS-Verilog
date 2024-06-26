// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

module sign_extend (in, is_signed, out);
    input wire [15:0] in; // Palavra de entrada com 16 bits
    input wire is_signed;	// Sinal de controle para saber se a palavra deve ser estendida ou nao
    output wire [31:0] out;	// Saida do sinal caso seja estendido

    assign out = is_signed ? $signed(in) : {16'b0, in};
	// Se is_signed = TRUE, a palavra in será estendida replicando 16 vezes o seu bit mais significativo
	// para que nao haja perda de sinal.
	// Se is_signed = FALSE, serão adicionados 16 bits 0 à frente da palavra.
	 
endmodule
