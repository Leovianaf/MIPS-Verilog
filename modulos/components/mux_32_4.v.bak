module mux_32_4 (input [31:0] A, B, C, D, input[1:0] S, output[31:0] Y);
	assign Y = S[1] ? (S[0] ? D : C) : (S[0] ? B : A);
endmodule
// mux_32_4 pc_mux (pc_increment, add_branching_to_mux, jump_module_to_mux, jr_PC, PCSource, nextPC);