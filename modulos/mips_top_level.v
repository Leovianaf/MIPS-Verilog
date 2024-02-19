// Universidade Federal Rural de Pernambuco
// 2023.1
// Arquitetura e Organização de Computadores - 2ªVA
// Alunos:
// Beatriz Pereira, Leonardo Viana, Paloma Raissa, Ricardo Zaidan
// -----------------------------

module mips_top_level(clock, reset, nextPC, ula_result, data_mem);
	input wire clock, reset;
	output wire [31:0] nextPC, ula_result, data_mem;

	// Unidade de controle
	// instruction [31:26] = opcode
	wire RegDst, MemRead, MemWrite, ALUSrc, RegWrite, Branch, BranchNe, Jump, isSigned;
	wire [1:0] MemtoReg;
	wire [2:0] ALUOp;
	control mips_control (
		opcode,
		RegDst,
		MemRead,
		MemtoReg,
		ALUOp,
		MemWrite,
		ALUSrc,
		RegWrite,
		Branch,
		BranchNe,
		Jump,
		isSigned
	);
	
	// Memoria de instrucao
	wire [31:0] instruction;
	wire [5:0] opcode = instruction[31:26];
	wire [4:0] rt = instruction[20:16];
	wire [4:0] rd = instruction[15:11];
	wire [4:0] shamt = instruction[10:6];
	wire [5:0] func = instruction[5:0];
	wire [15:0] imm = instruction[15:0];
	wire [25:0] address = instruction[25:0];
	i_mem current_instruction(pc, instruction);
	
	// MUX RegDst(i_mem e regfile)
	// 00 => RT (instrucao tipo I)
	// 01 => RD (instrucao tipo R)
	// 10 => 31 ($ra instrucao JAL)
	wire [4:0] imem_to_write_addr;
	assign imem_to_write_addr = Jump ? 5'd31 : (RegDst ? rd : rt); // Se for Jump, Write address = $ra (31) | Se nao, sera definido por RegDst entre 0 (rd) e 1 (rt)
	
	// MUX MemtoReg(Write Data)
	// 00 => Vem de ULA
	// 01 => Vem de D_Mem
	// 10 => Vem do PC + 4
	wire [31:0] write_data_reg;
	assign write_data_reg = (MemtoReg == 2'b00) ? ula_result:
									(MemtoReg == 2'b01) ? data_mem: current_pc + 4;
	
	// Regfile
	// instruction [25:21] = rs
	// instruction [20:16] = rt
	wire [31:0] ReadData1, ReadData2;
	regfile mips_regfile(
		instruction[25:21], 
		instruction[20:16], 
		ReadData1,
		ReadData2, 
		clock, 
		imem_to_write_addr, 
		write_data_reg, 
		RegWrite, 
		reset
	);

	// ULA control
	ula_ctrl mips_ula_control(ALUOp, func, OP);
	
	// Extensor de sinal 16 para 32 bits
	// Se isSigned = 0, adiciona 16 0 na frente
	// Se isSigned = 1, replica o bit mais significativo, para manter sinal
	wire [31:0] sign_extend_to_mux;
	sign_extend mips_sign_extend(imm, isSigned, sign_extend_to_mux);
	
	// MUX (regfile e ula)
	mux_32 regfile_ula_mux(ReadData2, sign_extend_to_mux, ALUSrc, output_to_ula_2);
	
	// ULA
	wire [31:0] mux_regfile_to_ula_2;
	wire [3:0] OP;
	wire ula_zero_flag;
	ula mips_ula(ReadData1, output_to_ula_2, OP, shamt, ula_result, ula_zero_flag);

	// Memoria de dados
	// ula_result = address
	// ReadData2 = Write data
	d_mem mips_d_mem(ula_result, ReadData2, MemWrite, MemRead, data_mem);

	// Program Counter (PC)
	wire [31:0] current_pc, pc_plus;
	
	pc mips_pc_counter(nextPC, current_pc, clock);
	
	pc_plus mips_pc_plus(current_pc, pc_plus);
	
	proxPC mips_prox_pc(pc_plus, address, Jump, Branch, BranchNe,  ula_zero_flag, sign_extend_to_mux, nextPC);
	
endmodule
