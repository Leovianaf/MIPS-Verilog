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
	wire MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Branch, isSigned, RegDst;
	wire [2:0] PCOp;
	wire [3:0] ALUOp;
	control mips_control (
		instruction[31:26],
		RegDst,
		MemRead,
		MemtoReg,
		ALUOp,
		MemWrite,
		ALUSrc,
		RegWrite,
		Branch,
		isSigned,
		PCOp
	);
	
	// Memoria de instrucao
	wire [31:0] instruction;
	i_mem current_instruction(pc, instruction);
	
	// MUX (i_mem e regfile)
	// 0 => RT (instrucao tipo I)
	// 1 => RD (instrucao tipo R)
	wire [4:0] imem_to_write_addr;
	mux_5_regdst imem_reg_mux(instruction[20:16], instruction[15:11], RegDst, imem_to_write_addr);
	
	// MUX (Write Data)
	// 0 => Vem de ULA
	// 1 => Vem de D_Mem
	wire [31:0] write_data_reg;
	mux_32 write_data__reg_mux(ula_result, data_mem, MemtoReg, write_data_reg);
	
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
	// instruction [5:0] = func
	ula_ctrl mips_ula_control(ALUOp, instruction[5:0], OP);
	
	// Extensor de sinal 16 para 32 bits
	// Se isSigned = 0, adiciona 16 0 na frente
	// Se isSigned = 1, replica o bit mais significativo, para manter sinal
	wire [31:0] sign_extend_to_mux;
	sign_extend mips_sign_extend(instruction[15:0], isSigned, sign_extend_to_mux);
	
	// MUX (regfile e ula)
	mux_32 regfile_ula_mux(ReadData2, sign_extend_to_mux, ALUSrc, output_to_ula_2);
	
	// ULA
	wire [31:0] mux_regfile_to_ula_2;
	wire [3:0] OP;
	wire ula_zero_flag;
	ula mips_ula(ReadData1, output_to_ula_2, OP, instruction[10:6], ula_result, ula_zero_flag);
	
	// Program Counter (PC)
	wire [31:0] current_pc;
	
	assign nextPC = current_pc + 32'h00000004; // Soma o pc atual + 4, para ir para a proxima instrucao
	
	pc pc_counter(nextPC, current_pc, clock);

	// Memoria de dados
	// ula_result = address
	// ReadData2 = Write data
	d_mem mips_d_mem(ula_result, ReadData2, MemWrite, MemRead, data_mem);

	
	// Somador para branch
	wire [31:0] branch_mux;
	somador32 branch(nextPC, (sign_extend_to_mux << 2), branch_mux);

	// Jump
	wire [31:0] jump_to_mux;
	jump mips_jump(nextPC[31:28], instruction[25:0], jump_to_mux);

	// JR
	// ReadData1 contem o valor de rs (informado na instrucao)
	// ALUOp = 0010 | func = 001000 para jr
	wire [31:0] jr_to_mux;
	jr_ctrl mips_jr_control(ALUOp, instruction[5:0], ReadData1, PCOp, jr_to_mux);
	
	// JAL
	// Jal => reg[31] = pc, pc = addressTarget << 2
	wire [31:0] pc_increment_8;
	wire [31:0] jal_to_mux;
	somador32 pc_to_jal(current_pc, 8, pc_increment_8);
	assign mips_regfile[30] = pc_increment_8;
	assign jal_to_mux = {nextPC[31:28], instruction[25:0], 2'b00}; 
	
	// PC control, retorna uma saida de 2 bits para ver qual sera a proxima instrucao
	wire [2:0] PCSource;	// 000 = PC + 4 | 001 = beq | 001 = bne | 010 = j | 011 = jr | 100 = jal
	PC_ctrl pc_control(PCOp, ula_zero_flag, PCSource);

	// Atribuicao da proxima instrucao do PC
	mux_32_5 pc_mux (nextPC, branch_mux, jump_to_mux, jr_to_mux, jal_to_mux, PCSource, nextPC);
	
endmodule
