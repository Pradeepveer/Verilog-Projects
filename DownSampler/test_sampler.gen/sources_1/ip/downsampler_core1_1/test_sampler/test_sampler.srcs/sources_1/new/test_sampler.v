`timescale 1ns / 1ps

module downsampler_core1 (
    input wire clk,
    input wire reset,
    input wire [31:0] s_axis_tdata,
    input wire s_axis_tvalid,
    output wire s_axis_tready,
    input wire s_axis_tlast,
    output reg [31:0] m_axis_tdata0,
    output wire m_axis_tvalid0,
    input wire m_axis_tready0,
    output reg [31:0] m_axis_tdata1,
    output wire m_axis_tvalid1,
    input wire m_axis_tready1,
    output reg [31:0] m_axis_tdata2,
    output wire m_axis_tvalid2,
    input wire m_axis_tready2,
    output reg [31:0] m_axis_tdata3,
    output wire m_axis_tvalid3,
    input wire m_axis_tready3,
    output reg [31:0] m_axis_tdata4,
    output wire m_axis_tvalid4,
    input wire m_axis_tready4,
    output reg [31:0] m_axis_tdata5,
    output wire m_axis_tvalid5,
    input wire m_axis_tready5,
    output reg [31:0] m_axis_tdata6,
    output wire m_axis_tvalid6,
    input wire m_axis_tready6,
    output reg [31:0] m_axis_tdata7,
    output wire m_axis_tvalid7,
    input wire m_axis_tready7,
    output reg m_axis_tlast
);

    reg s_axis_tready_reg;
    reg m_axis_tvalid0_reg;
    reg m_axis_tvalid1_reg;
    reg m_axis_tvalid2_reg;
    reg m_axis_tvalid3_reg;
    reg m_axis_tvalid4_reg;
    reg m_axis_tvalid5_reg;
    reg m_axis_tvalid6_reg;
    reg m_axis_tvalid7_reg;
    reg [2:0] cycle_count=0;
    reg data_latched;
    
    wire inenable;
    wire outenable0;
    wire outenable1;
    wire outenable2;
    wire outenable3; 
    wire outenable4;
    wire outenable5;
    wire outenable6;
    wire outenable7;
    
    assign s_axis_tready = s_axis_tready_reg & m_axis_tready0 & m_axis_tready1 & m_axis_tready2 & m_axis_tready3 & m_axis_tready4 & m_axis_tready5 & m_axis_tready6 & m_axis_tready7;
    assign m_axis_tvalid0 = m_axis_tvalid0_reg & s_axis_tvalid;
    assign m_axis_tvalid1 = m_axis_tvalid1_reg & s_axis_tvalid;
    assign m_axis_tvalid2 = m_axis_tvalid2_reg & s_axis_tvalid;
    assign m_axis_tvalid3 = m_axis_tvalid3_reg & s_axis_tvalid;
    assign m_axis_tvalid4 = m_axis_tvalid4_reg & s_axis_tvalid;
    assign m_axis_tvalid5 = m_axis_tvalid5_reg & s_axis_tvalid;
    assign m_axis_tvalid6 = m_axis_tvalid6_reg & s_axis_tvalid;
    assign m_axis_tvalid7 = m_axis_tvalid7_reg & s_axis_tvalid;
    
    assign inenable = s_axis_tvalid & s_axis_tready;
    assign outenable0 = m_axis_tvalid0 & m_axis_tready0;
    assign outenable1 = m_axis_tvalid1 & m_axis_tready1;
    assign outenable2 = m_axis_tvalid2 & m_axis_tready2;
    assign outenable3 = m_axis_tvalid3 & m_axis_tready3;
    assign outenable4 = m_axis_tvalid4 & m_axis_tready4;
    assign outenable5 = m_axis_tvalid5 & m_axis_tready5;
    assign outenable6 = m_axis_tvalid6 & m_axis_tready6;
    assign outenable7 = m_axis_tvalid7 & m_axis_tready7;
    
    
    
    always @(posedge clk)
    begin
        if(~reset)
        begin
            cycle_count <= 3'b000;
            s_axis_tready_reg <= 1;
            m_axis_tvalid0_reg <= 0;
            m_axis_tvalid1_reg<= 0;
            m_axis_tvalid2_reg<= 0;
            m_axis_tvalid3_reg<= 0;
            m_axis_tvalid4_reg<= 0;
            m_axis_tvalid5_reg<= 0;
            m_axis_tvalid6_reg<= 0;
            m_axis_tvalid7_reg<= 0;
            data_latched <= 1'b0;
        end
        else
        begin
            if(s_axis_tvalid)
            begin
                if(cycle_count==0)
                begin
                    if(m_axis_tready0)
                    begin
                        cycle_count<=3'b001;
                        m_axis_tdata0<=s_axis_tdata;
                        m_axis_tvalid0_reg<=1;
                        m_axis_tvalid7_reg<=0;
                    end
                end
                if(cycle_count==3'b001)
                begin
                    if(m_axis_tready1)
                    begin
                        cycle_count<=3'b010;
                        m_axis_tdata1<=s_axis_tdata;
                        m_axis_tvalid0_reg<=0;
                        m_axis_tvalid1_reg<=1;
                    end
                end
                if(cycle_count==3'b010)
                begin
                    if(m_axis_tready2)
                    begin
                        cycle_count<=3'b011;
                        m_axis_tdata2<=s_axis_tdata;
                        m_axis_tvalid2_reg<=1;
                        m_axis_tvalid1_reg<=0;
                    end
                end
                if(cycle_count==3'b011)
                begin
                    if(m_axis_tready3)
                    begin
                        cycle_count<=3'b100;
                        m_axis_tdata3<=s_axis_tdata;
                        m_axis_tvalid3_reg<=1;
                        m_axis_tvalid2_reg<=0;
                    end
                end
                if(cycle_count==3'b100)
                begin
                    if(m_axis_tready4)
                    begin
                        cycle_count<=3'b101;
                        m_axis_tdata4<=s_axis_tdata;
                        m_axis_tvalid4_reg<=1;
                        m_axis_tvalid3_reg<=0;
                    end
                end
                if(cycle_count==3'b101)
                begin
                    if(m_axis_tready5)
                    begin
                        cycle_count<=3'b110;
                        m_axis_tdata5<=s_axis_tdata;
                        m_axis_tvalid5_reg<=1;
                        m_axis_tvalid4_reg<=0;
                    end
                end
                if(cycle_count==3'b110)
                begin
                    if(m_axis_tready6)
                    begin
                        cycle_count<=3'b111;
                        m_axis_tdata6<=s_axis_tdata;
                        m_axis_tvalid6_reg<=1;
                        m_axis_tvalid5_reg<=0;
                    end
                end
                if(cycle_count==3'b111)
                begin
                    if(m_axis_tready7)
                    begin
                        cycle_count<=3'b000;
                        m_axis_tdata7<=s_axis_tdata;
                        m_axis_tvalid7_reg<=1;
                        m_axis_tvalid6_reg<=0;
                    end
                end
            end
        end
    end


endmodule

