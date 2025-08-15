`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 12:42:57
// Design Name: 
// Module Name: multiply
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


module multiply(
    input wire clk,
    input wire nreset,

    input wire [31:0] in_data1,
    input wire [31:0] in_data2,
    input wire s_tvalid1,
    input wire s_tvalid2,
    input wire s_tlast1,
    input wire s_tlast2,
    output reg s_tready1,
    output reg s_tready2,

    input wire m_tready,
    output reg m_tvalid,
    output reg m_tlast,
    output reg [63:0] out_data
);

    always @(posedge clk or negedge nreset) begin
        if (!nreset) begin
            s_tready1 <= 1'b1;
            s_tready2 <= 1'b1;
            m_tvalid  <= 1'b0;
            m_tlast   <= 1'b0;
            out_data  <= 64'd0;
        end else begin
            // Default values
            m_tvalid <= 1'b0;
            m_tlast  <= 1'b0;

            // When inputs are valid and output is ready
            if (s_tvalid1 && s_tvalid2 && m_tready) begin
                out_data  <= in_data1 * in_data2;
                m_tvalid  <= 1'b1;
                m_tlast   <= s_tlast1 & s_tlast2;
                s_tready1 <= 1'b1;
                s_tready2 <= 1'b1;
            end else begin
                s_tready1 <= 1'b0;
                s_tready2 <= 1'b0;
            end
        end
    end
endmodule
