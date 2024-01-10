

`timescale 1us/1us

module reset_synchro_TB ();
 reg clk_tb;
 reg rst_tb;
 wire reset_senchronizer_tb;

// Clock Period
parameter  CLK_PERIOD  = 10 ,
           HIGH_PERIOD = 0.5 * CLK_PERIOD ,
           LOW_PERIOD  = 0.5 * CLK_PERIOD ;
		   

reset_synchronizer_deasertion dut (
.clk(clk_tb),
.rst(rst_tb),
.reset_senchronizer(reset_senchronizer_tb)
);

// Clock Generator with 100 KHz (10 us)
  always  
   begin
    #LOW_PERIOD  clk_tb = ~ clk_tb ;
    #HIGH_PERIOD clk_tb = ~ clk_tb ;
   end
 /***************************************************************************************************/ 
  
initial
  begin
    $dumpfile("synchr.vcd");
    $dumpvars ;
	
	//initial values
clk_tb = 1'b0;
rst_tb = 1'b1;


// RST De-activation
#CLK_PERIOD
rst_tb = 1'b1 ;
    
    $display ("*** TEST CASE 1 ***");
	
	
#(1.5*CLK_PERIOD)
rst_tb = 1'b0 ;
#CLK_PERIOD
rst_tb = 1'b1 ;
if ( reset_senchronizer_tb == 1)
	$display ("*** TEST CASE 2 failed ***");
	else
	$display ("*** TEST CASE 2 pass ***");
#100 
$finish;
	end
endmodule
