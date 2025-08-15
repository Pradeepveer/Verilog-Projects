-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.
-- IP VLNV: user.org:user:downsampler_core1:1.0
-- IP Revision: 3

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT downsampler_core1_0
  PORT (
    clk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    s_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_tvalid : IN STD_LOGIC;
    s_axis_tready : OUT STD_LOGIC;
    s_axis_tlast : IN STD_LOGIC;
    m_axis_tdata0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_tvalid0 : OUT STD_LOGIC;
    m_axis_tready0 : IN STD_LOGIC;
    m_axis_tdata1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_tvalid1 : OUT STD_LOGIC;
    m_axis_tready1 : IN STD_LOGIC;
    m_axis_tdata2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_tvalid2 : OUT STD_LOGIC;
    m_axis_tready2 : IN STD_LOGIC;
    m_axis_tdata3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_tvalid3 : OUT STD_LOGIC;
    m_axis_tready3 : IN STD_LOGIC;
    m_axis_tdata4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_tvalid4 : OUT STD_LOGIC;
    m_axis_tready4 : IN STD_LOGIC;
    m_axis_tdata5 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_tvalid5 : OUT STD_LOGIC;
    m_axis_tready5 : IN STD_LOGIC;
    m_axis_tdata6 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_tvalid6 : OUT STD_LOGIC;
    m_axis_tready6 : IN STD_LOGIC;
    m_axis_tdata7 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_tvalid7 : OUT STD_LOGIC;
    m_axis_tready7 : IN STD_LOGIC;
    m_axis_tlast : OUT STD_LOGIC 
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : downsampler_core1_0
  PORT MAP (
    clk => clk,
    reset => reset,
    s_axis_tdata => s_axis_tdata,
    s_axis_tvalid => s_axis_tvalid,
    s_axis_tready => s_axis_tready,
    s_axis_tlast => s_axis_tlast,
    m_axis_tdata0 => m_axis_tdata0,
    m_axis_tvalid0 => m_axis_tvalid0,
    m_axis_tready0 => m_axis_tready0,
    m_axis_tdata1 => m_axis_tdata1,
    m_axis_tvalid1 => m_axis_tvalid1,
    m_axis_tready1 => m_axis_tready1,
    m_axis_tdata2 => m_axis_tdata2,
    m_axis_tvalid2 => m_axis_tvalid2,
    m_axis_tready2 => m_axis_tready2,
    m_axis_tdata3 => m_axis_tdata3,
    m_axis_tvalid3 => m_axis_tvalid3,
    m_axis_tready3 => m_axis_tready3,
    m_axis_tdata4 => m_axis_tdata4,
    m_axis_tvalid4 => m_axis_tvalid4,
    m_axis_tready4 => m_axis_tready4,
    m_axis_tdata5 => m_axis_tdata5,
    m_axis_tvalid5 => m_axis_tvalid5,
    m_axis_tready5 => m_axis_tready5,
    m_axis_tdata6 => m_axis_tdata6,
    m_axis_tvalid6 => m_axis_tvalid6,
    m_axis_tready6 => m_axis_tready6,
    m_axis_tdata7 => m_axis_tdata7,
    m_axis_tvalid7 => m_axis_tvalid7,
    m_axis_tready7 => m_axis_tready7,
    m_axis_tlast => m_axis_tlast
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file downsampler_core1_0.vhd when simulating
-- the core, downsampler_core1_0. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.



