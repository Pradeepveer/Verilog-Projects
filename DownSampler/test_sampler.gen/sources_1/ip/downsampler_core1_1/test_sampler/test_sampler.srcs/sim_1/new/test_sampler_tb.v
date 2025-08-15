`timescale 1ns / 1ps

module downsampler_TB;

    reg clk_TB;
    reg reset_TB;
    wire [31:0] s_axis_tdata_TB;
    wire s_axis_tvalid_TB;
    wire s_axis_tready_TB;
    wire [31:0] m_axis_tdata0_TB;
    wire [31:0] m_axis_tdata1_TB;
    wire [31:0] m_axis_tdata2_TB;
    wire [31:0] m_axis_tdata3_TB;
    wire [31:0] m_axis_tdata4_TB;
    wire [31:0] m_axis_tdata5_TB;
    wire [31:0] m_axis_tdata6_TB;
    wire [31:0] m_axis_tdata7_TB;
    wire m_axis_tvalid0_TB;
    wire m_axis_tvalid1_TB;
    wire m_axis_tvalid2_TB;
    wire m_axis_tvalid3_TB;
    wire m_axis_tvalid4_TB;
    wire m_axis_tvalid5_TB;
    wire m_axis_tvalid6_TB;
    wire m_axis_tvalid7_TB;
    wire m_axis_tready_TB;
    
    reg s_axis_tvalid_TB_reg;
    reg m_axis_tready_TB_reg;
    
    wire OUTenable0;
    wire OUTenable1;
    wire OUTenable2;
    wire OUTenable3;
    wire OUTenable4;
    wire OUTenable5;
    wire OUTenable6;
    wire OUTenable7;
    wire Inenable0;
    
    integer outsymcount0=0;
    integer outsymcount1=0;
    integer outsymcount2=0;
    integer outsymcount3=0;
    integer outsymcount4=0;
    integer outsymcount5=0;
    integer outsymcount6=0;
    integer outsymcount7=0;
    integer indatacount = 0;
    
    reg [31:0] outputVec0[0:127];
    reg [31:0] outputVec1[0:127];
    reg [31:0] outputVec2[0:127];
    reg [31:0] outputVec3[0:127];
    reg [31:0] outputVec4[0:127];
    reg [31:0] outputVec5[0:127];
    reg [31:0] outputVec6[0:127];
    reg [31:0] outputVec7[0:127];
    
    reg [31:0] inputvec[0:1023];
    
    integer count=0;
    integer i_file,o_file,iSc0;
    integer fd_read0, fd_write0, fd_write1, fd_write2, fd_write3, fd_write4, fd_write5, fd_write6, fd_write7; 

    downsampler_core1 uut (
        .clk(clk_TB),
        .reset(reset_TB),
        .s_axis_tdata(s_axis_tdata_TB),
        .s_axis_tvalid(s_axis_tvalid_TB),
        .s_axis_tready(s_axis_tready_TB),
        .m_axis_tdata0(m_axis_tdata0_TB),
        .m_axis_tdata1(m_axis_tdata1_TB),
        .m_axis_tdata2(m_axis_tdata2_TB),
        .m_axis_tdata3(m_axis_tdata3_TB),
        .m_axis_tdata4(m_axis_tdata4_TB),
        .m_axis_tdata5(m_axis_tdata5_TB),
        .m_axis_tdata6(m_axis_tdata6_TB),
        .m_axis_tdata7(m_axis_tdata7_TB),
        .m_axis_tvalid0(m_axis_tvalid0_TB),
        .m_axis_tvalid1(m_axis_tvalid1_TB),
        .m_axis_tvalid2(m_axis_tvalid2_TB),
        .m_axis_tvalid3(m_axis_tvalid3_TB),
        .m_axis_tvalid4(m_axis_tvalid4_TB),
        .m_axis_tvalid5(m_axis_tvalid5_TB),
        .m_axis_tvalid6(m_axis_tvalid6_TB),
        .m_axis_tvalid7(m_axis_tvalid7_TB),
        .m_axis_tready0(m_axis_tready_TB),
        .m_axis_tready1(m_axis_tready_TB),
        .m_axis_tready2(m_axis_tready_TB),
        .m_axis_tready3(m_axis_tready_TB),
        .m_axis_tready4(m_axis_tready_TB),
        .m_axis_tready5(m_axis_tready_TB),
        .m_axis_tready6(m_axis_tready_TB),
        .m_axis_tready7(m_axis_tready_TB)
    );
    
    assign s_axis_tvalid_TB=s_axis_tvalid_TB_reg;
    assign m_axis_tready_TB=m_axis_tready_TB_reg;
    
    assign Inenable0= s_axis_tvalid_TB_reg & s_axis_tready_TB;
    assign OUTenable0= m_axis_tready_TB_reg & m_axis_tvalid0_TB;
    assign OUTenable1= m_axis_tready_TB_reg & m_axis_tvalid1_TB;
    assign OUTenable2= m_axis_tready_TB_reg & m_axis_tvalid2_TB;
    assign OUTenable3= m_axis_tready_TB_reg & m_axis_tvalid3_TB;
    assign OUTenable4= m_axis_tready_TB_reg & m_axis_tvalid4_TB;
    assign OUTenable5= m_axis_tready_TB_reg & m_axis_tvalid5_TB;
    assign OUTenable6= m_axis_tready_TB_reg & m_axis_tvalid6_TB;
    assign OUTenable7= m_axis_tready_TB_reg & m_axis_tvalid7_TB;
    assign s_axis_tdata_TB = inputvec[indatacount];

    always begin
        #1 clk_TB = ~clk_TB;
        // 10ns clock period (100MHz)
    end

    initial begin
        clk_TB = 1;
        reset_TB = 1;
        m_axis_tready_TB_reg=0;
        s_axis_tvalid_TB_reg=0;
        
        fd_read0 = $fopen("/home/mimos2/projects/practice_files/d_sampler.txt", "r");      
        for(i_file = 0; i_file < 1024 ; i_file= i_file+1) begin
            iSc0 = $fscanf(fd_read0, "%d %d", inputvec[i_file][15:0],inputvec[i_file][31:16]);
        end
        #10 $fclose(fd_read0);
        
        #70;
        reset_TB = 0;
        #2
        reset_TB = 1;
        
        #8300; 
          
   
        fd_write0 = $fopen("/home/mimos2/projects/practice_files/schm0.txt", "wb");
	    for(o_file = 0; o_file < 128; o_file= o_file+1) 
	    begin    
             $fstrobe(fd_write0,"%d %d", $signed(outputVec0[o_file][15:0]),$signed(outputVec0[o_file][31:16]));
             #2;    
        end 
        #10 $fclose(fd_write0);
        
        fd_write1 = $fopen("/home/mimos2/projects/practice_files/schm1.txt", "wb");
        for(o_file = 0; o_file < 128; o_file= o_file+1) 
	    begin    
             $fstrobe(fd_write1,"%d %d", $signed(outputVec1[o_file][15:0]),$signed(outputVec1[o_file][31:16]));
             #2;    
        end 
        #10 $fclose(fd_write1);
        
        fd_write2 = $fopen("/home/mimos2/projects/practice_files/schm2.txt", "wb");
	    for(o_file = 0; o_file < 128; o_file= o_file+1) 
	    begin    
             $fstrobe(fd_write2,"%d %d", $signed(outputVec2[o_file][15:0]),$signed(outputVec2[o_file][31:16]));
             #2;    
        end 
        #10 $fclose(fd_write2);
        
        fd_write3 = $fopen("/home/mimos2/projects/practice_files/schm3.txt", "wb");
        for(o_file = 0; o_file < 128; o_file= o_file+1) 
	    begin    
             $fstrobe(fd_write3,"%d %d", $signed(outputVec3[o_file][15:0]),$signed(outputVec3[o_file][31:16]));
             #2;    
        end 
        #10 $fclose(fd_write3);
        
        fd_write4 = $fopen("/home/mimos2/projects/practice_files/schm4.txt", "wb");
	    for(o_file = 0; o_file < 128; o_file= o_file+1) 
	    begin    
             $fstrobe(fd_write4,"%d %d", $signed(outputVec4[o_file][15:0]),$signed(outputVec4[o_file][31:16]));
             #2;    
        end 
        #10 $fclose(fd_write4);
        
        fd_write5 = $fopen("/home/mimos2/projects/practice_files/schm5.txt", "wb");
        for(o_file = 0; o_file < 128; o_file= o_file+1) 
	    begin    
             $fstrobe(fd_write5,"%d %d", $signed(outputVec5[o_file][15:0]),$signed(outputVec5[o_file][31:16]));
             #2;    
        end 
        #10 $fclose(fd_write5);
        
        fd_write6 = $fopen("/home/mimos2/projects/practice_files/schm6.txt", "wb");
	    for(o_file = 0; o_file < 128; o_file= o_file+1) 
	    begin    
             $fstrobe(fd_write6,"%d %d", $signed(outputVec6[o_file][15:0]),$signed(outputVec6[o_file][31:16]));
             #2;    
        end 
        #10 $fclose(fd_write6);
        
        fd_write7 = $fopen("/home/mimos2/projects/practice_files/schm7.txt", "wb");
        for(o_file = 0; o_file < 128; o_file= o_file+1) 
	    begin    
             $fstrobe(fd_write7,"%d %d", $signed(outputVec7[o_file][15:0]),$signed(outputVec7[o_file][31:16]));
             #2;    
        end 
        #10 $fclose(fd_write7);
        
        
         $display("writing done");
    end
    
    
    always@(posedge clk_TB)
      begin
          if(~reset_TB)
          begin
              indatacount<=0;
              outsymcount0<=0;
              outsymcount1<=0;
              outsymcount2<=0;
              outsymcount3<=0;
              outsymcount4<=0;
              outsymcount5<=0;
              outsymcount6<=0;
              outsymcount7<=0;
          end
          count <= count+1;
        
        if(count == 25)
        begin
            m_axis_tready_TB_reg = 1;
        end
        if(count == 55)
        begin
            s_axis_tvalid_TB_reg=1;
        end

        if(count == 56)
        begin
            s_axis_tvalid_TB_reg=0;
        end
        
        if(count == 57)
        begin
            s_axis_tvalid_TB_reg=1;
        end 
        
        
        if(count == 100)
        begin
            s_axis_tvalid_TB_reg=0;
        end
        
        if(count == 101)
        begin
            s_axis_tvalid_TB_reg=1;
        end 
 
        
        if(count == 58)
        begin
            m_axis_tready_TB_reg = 0;
        end
        
        if(count == 59)
        begin
            m_axis_tready_TB_reg = 1;
        end  
        
        if(count == 307)
        begin
            m_axis_tready_TB_reg = 0;
        end
        if(count == 310)
        begin
            m_axis_tready_TB_reg = 1;
        end 
        if(count == 311)
        begin
            m_axis_tready_TB_reg = 0;
        end 
        if(count == 315)
        begin
            m_axis_tready_TB_reg = 1;
        end 
        

        
        
          if(Inenable0) //data
          begin
               indatacount<=indatacount+1;
               
          end
          if(OUTenable0)
          begin
              outsymcount0 <= outsymcount0+1;
              outputVec0[outsymcount0]<=m_axis_tdata0_TB;
          end
          if(OUTenable1)
          begin
              outsymcount1 <= outsymcount1+1;
              outputVec1[outsymcount1]<=m_axis_tdata1_TB;
          end
          if(OUTenable2)
          begin
              outsymcount2 <= outsymcount2+1;
              outputVec2[outsymcount2]<=m_axis_tdata2_TB;
          end
          if(OUTenable3)
          begin
              outsymcount3 <= outsymcount3+1;
              outputVec3[outsymcount3]<=m_axis_tdata3_TB;
          end
          if(OUTenable4)
          begin
              outsymcount4 <= outsymcount4+1;
              outputVec4[outsymcount4]<=m_axis_tdata4_TB;
          end
          if(OUTenable5)
          begin
              outsymcount5 <= outsymcount5+1;
              outputVec5[outsymcount5]<=m_axis_tdata5_TB;
          end
          if(OUTenable6)
          begin
              outsymcount6 <= outsymcount6+1;
              outputVec6[outsymcount6]<=m_axis_tdata6_TB;
          end
          if(OUTenable7)
          begin
              outsymcount7 <= outsymcount7+1;
              outputVec7[outsymcount7]<=m_axis_tdata7_TB;
          end
     end

endmodule
