// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: user.org:user:downsampler_core1:1.0
// IP Revision: 3

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
downsampler_core1_0 your_instance_name (
  .clk(clk),                        // input wire clk
  .reset(reset),                    // input wire reset
  .s_axis_tdata(s_axis_tdata),      // input wire [31 : 0] s_axis_tdata
  .s_axis_tvalid(s_axis_tvalid),    // input wire s_axis_tvalid
  .s_axis_tready(s_axis_tready),    // output wire s_axis_tready
  .s_axis_tlast(s_axis_tlast),      // input wire s_axis_tlast
  .m_axis_tdata0(m_axis_tdata0),    // output wire [31 : 0] m_axis_tdata0
  .m_axis_tvalid0(m_axis_tvalid0),  // output wire m_axis_tvalid0
  .m_axis_tready0(m_axis_tready0),  // input wire m_axis_tready0
  .m_axis_tdata1(m_axis_tdata1),    // output wire [31 : 0] m_axis_tdata1
  .m_axis_tvalid1(m_axis_tvalid1),  // output wire m_axis_tvalid1
  .m_axis_tready1(m_axis_tready1),  // input wire m_axis_tready1
  .m_axis_tdata2(m_axis_tdata2),    // output wire [31 : 0] m_axis_tdata2
  .m_axis_tvalid2(m_axis_tvalid2),  // output wire m_axis_tvalid2
  .m_axis_tready2(m_axis_tready2),  // input wire m_axis_tready2
  .m_axis_tdata3(m_axis_tdata3),    // output wire [31 : 0] m_axis_tdata3
  .m_axis_tvalid3(m_axis_tvalid3),  // output wire m_axis_tvalid3
  .m_axis_tready3(m_axis_tready3),  // input wire m_axis_tready3
  .m_axis_tdata4(m_axis_tdata4),    // output wire [31 : 0] m_axis_tdata4
  .m_axis_tvalid4(m_axis_tvalid4),  // output wire m_axis_tvalid4
  .m_axis_tready4(m_axis_tready4),  // input wire m_axis_tready4
  .m_axis_tdata5(m_axis_tdata5),    // output wire [31 : 0] m_axis_tdata5
  .m_axis_tvalid5(m_axis_tvalid5),  // output wire m_axis_tvalid5
  .m_axis_tready5(m_axis_tready5),  // input wire m_axis_tready5
  .m_axis_tdata6(m_axis_tdata6),    // output wire [31 : 0] m_axis_tdata6
  .m_axis_tvalid6(m_axis_tvalid6),  // output wire m_axis_tvalid6
  .m_axis_tready6(m_axis_tready6),  // input wire m_axis_tready6
  .m_axis_tdata7(m_axis_tdata7),    // output wire [31 : 0] m_axis_tdata7
  .m_axis_tvalid7(m_axis_tvalid7),  // output wire m_axis_tvalid7
  .m_axis_tready7(m_axis_tready7),  // input wire m_axis_tready7
  .m_axis_tlast(m_axis_tlast)      // output wire m_axis_tlast
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

