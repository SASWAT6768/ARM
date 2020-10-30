module cortexm3_soc_tb;
  reg HCLK;
  reg HRESETn;
initial begin
  HCLK = 0;
  HRESETn = 0;

#2 HRESETn = 1;
end
output reg i=1;
#5 i=2;
#5 i=3;
#5 i=5;
#5 i=8;
#5 i=13;
always #5 HCLK = ~HCLK;

//port map
cortexm3_soc cortexm3_soc_i0 (
.HCLK(HCLK),
.HRESETn(HRESETn)
);

endmodule