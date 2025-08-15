`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2025 16:15:53
// Design Name: 
// Module Name: 2sig_mult
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


module sig_mult(
    input clk,
    input nreset,
    
    input wire [31:0] in_data1,
    input wire [31:0] in_data2,
    input wire s_tvalid1,
    input wire s_tvalid2,
    input wire s_tlast1,
    input wire s_tlast2,
    output wire s_tready1,
    output wire s_tready2,
    
    input wire m_tready,
    output wire m_tvalid,
    output wire m_tlast,
    output reg [63:0] out_data    
    );
    
    reg s_tready_reg1 = 0;
    reg s_tready_reg2 = 0;
    reg m_tvalid_reg = 0;
    reg m_tlast_reg = 0;
    
    wire inenable1;
    wire inenable2;
    wire outenable;
    
    reg [31:0] temp_data1;
    reg [31:0] temp_data2;
    
    integer outdatacount = 0;  
    
    assign inenable = s_tready1 & s_tready2 & s_tvalid1 & s_tvalid2;
    assign outenable = m_tvalid & m_tready;
    
    assign s_tready1 = s_tready_reg2 & s_tready_reg1 & m_tready;
    assign s_tready2 = s_tready_reg1 & s_tready_reg2 & m_tready;
    assign m_tvalid = m_tvalid_reg & s_tvalid1 & s_tvalid2;
     
    always @(posedge clk) begin
        if (nreset == 0) begin
            s_tready_reg1 <= 1;
            s_tready_reg2 <= 1;
            m_tvalid_reg <= 0;
            m_tlast_reg <= 0;
        end
        
        if (inenable) begin
            temp_data1 <= in_data1;
            temp_data2 <= in_data2;
            m_tvalid_reg <= 1;
        end 
        
        if (inenable & m_tready) begin
            s_tready_reg1 <= 1;
            s_tready_reg2 <= 1;
            m_tvalid_reg <= 1;
        end
        else begin
            s_tready_reg1 <= 0;
            s_tready_reg2 <= 0;
            m_tvalid_reg <= 0;
        end
        
        
    end
endmodule
