`timescale 1ns / 1ps

module axi4_sampler_32bit (
    input wire clk,
    input wire reset,
    input wire [31:0] s_axis_tdata,
    input wire s_axis_tvalid,
    output reg s_axis_tready,
    output reg [31:0] m_axis_tdata0,
    output reg [31:0] m_axis_tdata1,
    output reg [31:0] m_axis_tdata2,
    output reg [31:0] m_axis_tdata3,
    output reg [31:0] m_axis_tdata4,
    output reg [31:0] m_axis_tdata5,
    output reg [31:0] m_axis_tdata6,
    output reg [31:0] m_axis_tdata7,
    output reg m_axis_tvalid,
    input wire m_axis_tready  // New input signal to control the output handshake
);

    reg [2:0] cycle_count;
    reg data_latched;

    always @(posedge clk) begin
        if (reset) begin
            cycle_count <= 3'b000;
            s_axis_tready <= 1'b1;
            m_axis_tvalid <= 1'b0;
            data_latched <= 1'b0;
        end else begin
            if (!data_latched) begin
                // Start sampling when valid data is available and downstream is ready
                if (s_axis_tvalid && s_axis_tready) begin
                    m_axis_tdata0 <= s_axis_tdata;
                    cycle_count <= 3'b001;
                    data_latched <= 1'b1;
                    m_axis_tvalid <= 1'b0; // not yet valid, wait until full set
                end
            end else begin
                // Continue sampling 7 more words when valid data is available
                if (s_axis_tvalid) begin
                    case (cycle_count)
                        3'b001: m_axis_tdata1 <= s_axis_tdata;
                        3'b010: m_axis_tdata2 <= s_axis_tdata;
                        3'b011: m_axis_tdata3 <= s_axis_tdata;
                        3'b100: m_axis_tdata4 <= s_axis_tdata;
                        3'b101: m_axis_tdata5 <= s_axis_tdata;
                        3'b110: m_axis_tdata6 <= s_axis_tdata;
                        3'b111: begin
                            m_axis_tdata7 <= s_axis_tdata;
                            m_axis_tvalid <= 1'b1; // all 8 samples collected
                            data_latched <= 1'b0;   // ready for next set
                            cycle_count <= 3'b000;
                        end
                    endcase

                    if (cycle_count != 3'b111) begin
                        cycle_count <= cycle_count + 1;
                    end
                end
            end
        end
    end

    // Handling the output side handshake (m_axis_tready)
    always @(posedge clk) begin
        if (m_axis_tready) begin
            // If the downstream module is ready, allow output
            if (m_axis_tvalid) begin
                s_axis_tready <= 1'b0; // Disable input acceptance while sending output
            end
        end else begin
            // If the downstream module is not ready, hold off on sending data
            m_axis_tvalid <= 1'b0;
            s_axis_tready <= 1'b1; // Allow new data to be sampled again
        end
    end

endmodule


`timescale 1ns / 1ps

module tb_axi4_sampler_32bit;

    reg clk;
    reg reset;
    reg [31:0] s_axis_tdata;
    reg s_axis_tvalid;
    wire s_axis_tready;
    wire [31:0] m_axis_tdata0;
    wire [31:0] m_axis_tdata1;
    wire [31:0] m_axis_tdata2;
    wire [31:0] m_axis_tdata3;
    wire [31:0] m_axis_tdata4;
    wire [31:0] m_axis_tdata5;
    wire [31:0] m_axis_tdata6;
    wire [31:0] m_axis_tdata7;
    wire m_axis_tvalid;

    axi4_sampler_32bit uut (
        .clk(clk),
        .reset(reset),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tready(s_axis_tready),
        .m_axis_tdata0(m_axis_tdata0),
        .m_axis_tdata1(m_axis_tdata1),
        .m_axis_tdata2(m_axis_tdata2),
        .m_axis_tdata3(m_axis_tdata3),
        .m_axis_tdata4(m_axis_tdata4),
        .m_axis_tdata5(m_axis_tdata5),
        .m_axis_tdata6(m_axis_tdata6),
        .m_axis_tdata7(m_axis_tdata7),
        .m_axis_tvalid(m_axis_tvalid)
    );

    always begin
        clk = ~clk;
        #1;  // 10ns clock period (100MHz)
    end

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        s_axis_tvalid = 0;
        s_axis_tdata = 32'b0;
        #10; // Assert reset for 10ns
        reset = 0; // Deassert reset

        // Simulate data valid cycles
        s_axis_tvalid = 1;

        s_axis_tdata = 32'hA5A5A5A5; #2;  // 1st cycle of data
        s_axis_tdata = 32'h5A5A5A5A; #2;  // 2nd cycle of data
        s_axis_tdata = 32'h11111111; #2; // 3rd cycle of data
        s_axis_tdata = 32'h22222222; #2; // 4th cycle of data
        s_axis_tdata = 32'h33333333; #2; // 5th cycle of data
        s_axis_tdata = 32'h44444444; #2; // 6th cycle of data
        s_axis_tdata = 32'h55555555; #2; // 7th cycle of data
        s_axis_tdata = 32'h66666666; #2; // 8th cycle of data

        s_axis_tvalid = 0; // Deassert after sending data
        #10; // wait some time for the last data to be processed
    end

    initial begin
        // Monitor output at each time step
        $monitor("At time %t, m_axis_tdata0 = %h, m_axis_tdata1 = %h, m_axis_tdata2 = %h, m_axis_tdata3 = %h, m_axis_tdata4 = %h, m_axis_tdata5 = %h, m_axis_tdata6 = %h, m_axis_tdata7 = %h, m_axis_tvalid = %b",
                  $time, m_axis_tdata0, m_axis_tdata1, m_axis_tdata2, m_axis_tdata3, m_axis_tdata4, m_axis_tdata5, m_axis_tdata6, m_axis_tdata7, m_axis_tvalid);
    end

endmodule
