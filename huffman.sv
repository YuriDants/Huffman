// Autor: Yuri Siqueira Dantas
// Feito no EDA Playground 
module huffman_decoder(
  input  clk, 
  input  reset,
  input bit in, 
  output reg [4:0] sx, 
  output reg flag
);


  
  logic [4:0] symbols[1:18] = {5'd1, 5'd2, 5'd3, 5'd4, 5'd5, 5'd6, 5'd7, 5'd8, 5'd9, 5'd10, 5'd11, 5'd12, 5'd13, 5'd14, 5'd15, 5'd16, 5'd17, 5'd18}; //simbolos de resposta

  logic[4:0] estado = 0;

  always @(posedge clk or posedge reset) begin
  if (reset) begin
    estado <= 0;
    sx <= 0;
    flag <= 0;
  end // 
    else begin
   
      if (estado == 0) begin //maquina de 11 estados para decodificação da entrada serial
        	sx<=0;
        	flag<=0;
        	if (in == 0) estado <= 1;
      		else estado <= 2;
    		end
      if (estado == 1) begin
        if (in == 0)begin 
          sx <=symbols[1];
          flag <= 1;
          estado <= 0;
        end
       else begin 
          sx <= symbols[2];
         	flag <= 1;
          estado <= 0;
        end
      		end
      if (estado == 2)begin
        if (in == 0)begin 
          sx <=3;
          flag <= 1;
          estado <= 0;
        end
       else estado <= 3;
      		end
      
      if (estado == 3)begin
        if (in == 0)begin 
          sx <=symbols[4];
          flag <= 1;
          estado <= 0;
        end
       else estado <= 4;
      		end
      
      if (estado == 4)begin
        if (in == 0) estado <= 5;//1110 
       else estado <=9; //1111
      		end
      
      if (estado == 5)begin
        if (in == 0) estado <= 6;//11100 
       else estado <=7; 
      		end
   	  
      if (estado == 6)begin
        if (in == 0)begin//111000
          sx <= symbols[5];
          flag <= 1;
          estado <= 0;
        end
       else begin
         sx <= symbols[6];
         flag <= 1;
         estado <= 0; 
       end	
       		end
        
      if (estado == 7)begin
        if (in == 0)begin//111010
          sx <= symbols[7];
          flag <= 1;
          estado <= 0;//
        end
       else estado <= 8;  //111011	
       		end
        
      if (estado == 8)begin
        if (in == 0)begin//1110110
          sx <= symbols[8];
          flag <= 1;
          estado <= 0;//
        end
        else begin
          sx <= symbols[9];  //1110111
          flag <= 1;
       		estado <= 0;
        end
      end
      
      if (estado == 9)begin
        if (in == 0) estado <=10;//11110
        else estado <= 13;// 11111
      end
          
      if (estado == 10)begin
        if (in == 0) estado <=11;//111100
        else estado <=12; // 111101
      end
          
      if (estado == 11)begin
        if (in == 0)begin
          sx <= symbols[10];//1111000
          flag <= 1;
        	estado <= 0;
        end
        else begin
          sx <= symbols[11]; //1111001;
          flag <= 1;
          estado <= 0;
        end
      end
        
      if (estado == 12)begin
        if (in == 0)begin
          sx <= symbols[12];//1111010
          flag <= 1;
        	estado <= 0;
        end
        else begin
          sx <= symbols[13]; //1111011
          flag <= 1;
          estado <= 0;
        end
      end
      
      if (estado == 13)begin
        if (in == 0) estado <=14;//111110
        else estado <=15; //111111
      end
      
      if (estado == 14)begin
        if (in == 0)begin
          sx <= symbols[14];//1111100
          flag <= 1;
        	estado <= 0;
        end
        else begin
          sx <= symbols[15]; //1111101
          flag <= 1;
          estado <= 0;
        end
      end
        
      if (estado == 15)begin
        if (in == 0)begin
          sx <=  symbols[16];//1111110
          flag <= 1;
            estado <=0;
          end
        else estado <=16; //1111111
          end
      if (estado == 16)begin
        if (in == 0)begin
          sx <=  symbols[17];//11111110
          flag <= 1;
            estado <=0;
          end
        else begin
          sx <= symbols[18]; //11111111
          flag <= 1;
          estado <= 0;
        end
      end
  

    
    
  
	end 
 
	end  
endmodule
