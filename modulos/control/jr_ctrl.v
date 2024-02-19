// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

module jr_ctrl(ALUOP, func, ReadData1, PCOp,JR_control);

	//Declarar entradas e saídas
	input wire [31:0] ReadData1;
	input wire [3:0] ALUOP;
	input wire [5:0] func;
	output wire [2:0] PCOp;
	output wire [31:0] JR_control;
	
	// Atualiza o PCOp, para passar no PC control
	assign PCOp = 3'b100;
	assign JR_control = ({ALUOP, func} == 10'b0010001000) ? ReadData1 : 32'bz;

endmodule
