module tb();

    // Declaration of I/O
    reg clk=0, rst, RegWriteW;
    reg [4:0] RDW;
    reg [31:0] InstrD, PCD, PCPlus4D, ResultW;

    wire RegWriteE,ALUSrcE,MemWriteE,ResultSrcE,BranchE;
    wire [2:0] ALUControlE;
    wire [31:0] RD1_E, RD2_E, Imm_Ext_E;
    wire [4:0] RD_E;
    wire [31:0] PCE, PCPlus4E;
    
    // Declaration of DUT
    decode_cycle dut(
                .clk(clk), 
                .rst(rst), 
                .InstrD(InstrD), 
                .PCD(PCD), 
                .PCPlus4D(PCPlus4D), 
                .RegWriteW(RegWriteW), 
                .RDW(RDW), 
                .ResultW(ResultW), 
                .RegWriteE(RegWriteE), 
                .ALUSrcE(ALUSrcE), 
                .MemWriteE(MemWriteE), 
                .ResultSrcE(ResultSrcE),
                .BranchE(BranchE),  
                .ALUControlE(ALUControlE), 
                .RD1_E(RD1_E), 
                .RD2_E(RD2_E), 
                .Imm_Ext_E(Imm_Ext_E), 
                .RD_E(RD_E), 
                .PCE(PCE), 
                .PCPlus4E(PCPlus4E)
                );
    always begin
        clk = ~clk;
        #50;
    end
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end
    initial begin
        rst <= 1'b0;
        #200;
        rst <= 1'b1;
        RegWriteW <= 1'b0;
        RDW <= 5'h00;
        InstrD <= 32'h00402283;
        PCD <= 32'h00000000;
        PCPlus4D <= 32'h00000004;
        ResultW <= 32'h00000000;
        #500;
        $finish;
    end
endmodule