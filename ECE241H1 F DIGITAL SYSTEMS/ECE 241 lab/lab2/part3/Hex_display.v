`timescale 1ns / 1ns // `timescale time_unit/time_precision

module Hex_display(SW[3],SW[2],SW[1],SW[0],HEX0);
input [9:0] SW;
output [6:0] HEX0;

wire [6:0]H;
Hex_decoder u0(.c3(SW[3]),.c2(SW[2]),.c1(SW[1]),.c0(SW[0]),.S(H));
assign HEX0 = H ;
endmodule



module Hex_decoder(input c3,c2,c1,c0 ,output [6:0]S);

assign S[0]= ~((c3|c2|c1|~c0)&(c3|~c2|c1|c0)&(~c3|c2|~c1|~c0));
assign S[1]= ~((c3|~c2|c1|~c0)&(c3|~c2|~c1|c0)&(~c3|c2|~c1|~c0)&(~c3|~c2|c1|c0)&(~c3|~c2|~c1|c0)&(~c3|~c2|~c1|~c0))  ;
assign S[2]= ~((c3|c2|~c1|c0)&(~c3|~c2|c1|c0)&(~c3|~c2|~c1|c0)&(~c3|~c2|~c1|~c0))  ;
assign S[3]= ~((c3|c2|c1|~c0)&(c3|~c2|c1|c0)&(c3|~c2|~c1|~c0)&(~c3|c2|~c1|c0)&(~c3|~c2|~c1|~c0))  ;
assign S[4]= ~((c3|c2|c1|~c0)&(c3|c2|~c1|~c0)&(c3|~c2|c1|c0)&(c3|~c2|c1|~c0)&(c3|~c2|~c1|~c0)&(~c3|c2|c1|~c0))  ;
assign S[5]= ~((c3|c2|c1|~c0)&(c3|c2|~c1|c0)&(c3|c2|~c1|~c0)&(c3|~c2|~c1|~c0))  ;
assign S[6]= ~((c3|c2|c1|c0)&(c3|c2|c1|~c0)&(c3|~c2|~c1|~c0)&(~c3|~c2|c1|c0))  ;


endmodule//Hex_decoder



