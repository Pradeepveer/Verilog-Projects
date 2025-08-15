`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 17:46:20
// Design Name: 
// Module Name: sig_multiply_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sig_multiply_tb;
    // inputs
    reg clk_tb;
    reg nreset_tb;
    
    reg s_tvalid_tb1;
    reg s_tlast_tb1;
    
    reg s_tvalid_tb2;
    reg s_tlast_tb2;
    
    reg m_tready_tb;
    
    // memory for storing input
    reg [31:0] in_data_tb1[44:0];
    reg [31:0] in_data_tb2[44:0];
    
    // outputs
    wire s_tready_tb1;
    wire s_tready_tb2;
    
    wire m_tvalid_tb;
    wire m_tlast_tb;
    
    wire [31:0] s_tdata1;
    wire [31:0] s_tdata2;
    wire [31:0] m_tdata;
    
    wire inenable_reg;
    wire outenable_reg;
    
    integer indatacount1 = 0;
    integer indatacount2 = 0;
    integer outdatacount = 0;
    
    // instantiate the Unit Under Test (UUT)
    
    sig_mult (
        .clk(clk_tb),
        .nreset(nreset_tb),
    
        .in_data1(s_tdata1),
        .in_data2(s_tdata2),
        .s_tvalid1(s_tvalid_tb1),
        .s_tvalid2(s_tvalid_tb2),
        .s_tlast1(s_tlast_tb1),
        .s_tlast2(s_tlast_tb2),
        .s_tready1(s_tready_tb1),
        .s_tready2(s_tready_tb2),
        
        .m_tready(m_tready_tb),
        .m_tvalid(m_tvalid_tb),
        .m_tlast(m_tlast_tb),
        .out_data(m_tdata)       
    );
    
    // File Handling
    integer i_file1, o_file, iSc0;   
    integer fd_read, fd_write;
    
    assign s_tdata1 = in_data_tb1[indatacount1][31:0];
    assign s_tdata2 = in_data_tb2[indatacount2][31:0];
    
    assign inenable_reg = s_tvalid_tb1 & s_tvalid_tb2 & s_tready_tb1 & s_tready_tb2;
    assign outenable_reg = m_tready_tb & m_tvalid_tb;
    
    initial
    begin
        // initialize inputs
        clk_tb = 0;
        nreset_tb = 1;
        s_tvalid_tb1 = 0;
        s_tvalid_tb2 = 0;
        s_tlast_tb1 = 0;
        s_tlast_tb2 = 0;
        m_tready_tb = 1;
        
        // open files
        fd_read = $fopen("", "rb");
        for (i_file1 = 0; i_file1 <= 45; i_file1 = i_file1 + 1) begin
            iSc0 = $fscanf(fd_read, "%d", in_data_tb1[i_file1][31:0]);
        end
        #10 $fclose(fd_read);
        
        fd_read = $fopen("", "rb");
        for (i_file1 = 0; i_file1 <= 45; i_file1 = i_file1 + 1) begin
            iSc0 = $fscanf(fd_read, "%d", in_data_tb2[i_file1][31:0]);
        end
        #10 $fclose(fd_read);
        
    end
endmodule
