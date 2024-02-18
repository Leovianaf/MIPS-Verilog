// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

module regfile(clk, rst, reg_write, read_addr1, read_addr2, write_addr, write_d, read_d1, read_d2);
	
	// Entradas e saidas
	input wire clk, rst, reg_write;
	input wire [4:0] read_addr1, read_addr2, write_addr;
	input wire [31:0] write_d;
	output wire [31:0] read_d1, read_d2;
	
	// Banco de reg
	reg [31:0] registradores [0:31];
	// Contador para o for
	integer i;
	
	//Assincrono (nao depende do clk)
	assign read_d1 = registradores[read_addr1];
	assign read_d2 = registradores[read_addr2];
	
	//Sincrono (opera na subida do clk, ou na subida do reset)
	always @ (posedge clk or posedge rst) begin
		// Condicao para o reset
		if (rst) begin
			// Resetando todos os registradores para zero
			for (i = 0; i < 32; i = i + 1) begin
				registradores[i] <= 32'b0;
			end
		end
		// Caso nao seja executado o reset
		else begin
			// Escrita feita na subida do clk
			if(reg_write == 1'b1) begin
				registradores[write_addr] <= write_d;
			end
		end
	end
	
endmodule
