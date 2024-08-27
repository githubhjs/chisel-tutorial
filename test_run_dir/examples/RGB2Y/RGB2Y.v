module RGB2Y(
  input        clock,
  input        reset,
  input  [7:0] io_in_rgb_0,
  input  [7:0] io_in_rgb_1,
  input  [7:0] io_in_rgb_2,
  output [7:0] io_out_y,
  input        io_valid
);
  wire [13:0] _T = {io_in_rgb_0, 6'h0}; // @[RGB2Y.scala 29:14]
  wire [10:0] _T_1 = {io_in_rgb_0, 3'h0}; // @[RGB2Y.scala 29:33]
  wire [13:0] _GEN_0 = {{3'd0}, _T_1}; // @[RGB2Y.scala 29:28]
  wire [13:0] _T_3 = _T - _GEN_0; // @[RGB2Y.scala 29:28]
  wire [8:0] _T_4 = {io_in_rgb_0, 1'h0}; // @[RGB2Y.scala 29:52]
  wire [13:0] _GEN_1 = {{5'd0}, _T_4}; // @[RGB2Y.scala 29:47]
  wire [13:0] _T_6 = _T_3 - _GEN_1; // @[RGB2Y.scala 29:47]
  wire [14:0] _T_7 = {io_in_rgb_1, 7'h0}; // @[RGB2Y.scala 30:14]
  wire [14:0] _GEN_2 = {{1'd0}, _T_6}; // @[RGB2Y.scala 29:66]
  wire [14:0] _T_9 = _GEN_2 + _T_7; // @[RGB2Y.scala 29:66]
  wire [13:0] _T_10 = {io_in_rgb_1, 6'h0}; // @[RGB2Y.scala 30:33]
  wire [14:0] _GEN_3 = {{1'd0}, _T_10}; // @[RGB2Y.scala 30:28]
  wire [14:0] _T_12 = _T_9 + _GEN_3; // @[RGB2Y.scala 30:28]
  wire [10:0] _T_13 = {io_in_rgb_1, 3'h0}; // @[RGB2Y.scala 30:52]
  wire [14:0] _GEN_4 = {{4'd0}, _T_13}; // @[RGB2Y.scala 30:47]
  wire [14:0] _T_15 = _T_12 - _GEN_4; // @[RGB2Y.scala 30:47]
  wire [14:0] _GEN_5 = {{7'd0}, io_in_rgb_1}; // @[RGB2Y.scala 30:66]
  wire [14:0] _T_17 = _T_15 - _GEN_5; // @[RGB2Y.scala 30:66]
  wire [11:0] _T_18 = {io_in_rgb_2, 4'h0}; // @[RGB2Y.scala 31:14]
  wire [14:0] _GEN_6 = {{3'd0}, _T_18}; // @[RGB2Y.scala 30:70]
  wire [14:0] _T_20 = _T_17 + _GEN_6; // @[RGB2Y.scala 30:70]
  wire [8:0] _T_21 = {io_in_rgb_2, 1'h0}; // @[RGB2Y.scala 31:33]
  wire [14:0] _GEN_7 = {{6'd0}, _T_21}; // @[RGB2Y.scala 31:28]
  wire [14:0] _T_23 = _T_20 + _GEN_7; // @[RGB2Y.scala 31:28]
  wire [14:0] _GEN_8 = {{7'd0}, io_in_rgb_2}; // @[RGB2Y.scala 31:47]
  wire [14:0] Y = _T_23 + _GEN_8; // @[RGB2Y.scala 31:47]
  wire [7:0] Y_clamped = Y[7:0]; // @[RGB2Y.scala 34:20]
  assign io_out_y = io_valid ? Y_clamped : 8'h0; // @[RGB2Y.scala 37:12]
endmodule
