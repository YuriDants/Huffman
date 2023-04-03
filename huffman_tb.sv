// Autor: Yuri Siqueira Dantas
// Feito no EDA Playground 


module tb;
	logic clk, rst;
  logic in_u;
  logic [4:0]sai_u;
	logic flag;
 
  logic [7:0] cod[1:18] = {2'b00, 2'b01, 2'b10, 3'b110, 6'b111000, 6'b111001, 6'b111010, 7'b1110110, 7'b1110111, 7'b1111000, 7'b1111001, 7'b1111010, 7'b1111011, 7'b1111100, 7'b1111101, 7'b1111110, 8'b11111110, 8'b11111111};
	huffman_decoder dut(
		.clk (clk),
		.reset (rst),
      .in (in_u),
      .sx (sai_u),
      .flag (flag)
		);
       	 int fixed_seed =10;
		
	initial 
	begin
      $dumpfile("dump.vcd");
      $dumpvars;
     
      $urandom (fixed_seed);
      	#1 rst = 1'b0;
        #1clk = 1'b0;
		 #1 rst = 1;
 		 #1 rst = 0;

      for(int i = 0; i < 40; i++) begin
       
        
        for(int j = 0; flag == 0 ; j++) begin
          in_u = $urandom_range(0,1);
          $display("bit atual: %b",in_u); 
        #1 clk = 1;
		#1 clk = 0; 
        end
       if (flag == 1)
           begin
             $display("numero: %b , decodificado no simbolo :%d ", cod[sai_u],sai_u);
			end
         #1 rst = 1;
 		 #1 rst = 0;	
	end
      $finish();
    end
 endmodule
