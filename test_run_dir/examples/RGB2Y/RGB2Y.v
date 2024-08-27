module RGB2Y(
  input         clock,
  input         reset,
  input  [11:0] io_R,
  input  [11:0] io_G,
  input  [11:0] io_B,
  output [7:0]  io_Y
);
  wire [7:0] R = io_R[11:4]; // @[RGB2Y.scala 18:16]
  wire [7:0] G = io_G[11:4]; // @[RGB2Y.scala 19:16]
  wire [7:0] B = io_B[11:4]; // @[RGB2Y.scala 20:16]
  wire [13:0] _T = {R, 6'h0}; // @[RGB2Y.scala 24:15]
  wire [13:0] _GEN_0 = {{6'd0}, B}; // @[RGB2Y.scala 24:21]
  wire [14:0] _T_1 = _T + _GEN_0; // @[RGB2Y.scala 24:21]
  wire [8:0] _T_2 = {B, 1'h0}; // @[RGB2Y.scala 24:33]
  wire [14:0] _GEN_1 = {{6'd0}, _T_2}; // @[RGB2Y.scala 24:27]
  wire [15:0] _T_3 = _T_1 + _GEN_1; // @[RGB2Y.scala 24:27]
  wire [11:0] _T_4 = {B, 4'h0}; // @[RGB2Y.scala 24:45]
  wire [15:0] _GEN_2 = {{4'd0}, _T_4}; // @[RGB2Y.scala 24:39]
  wire [16:0] _T_5 = _T_3 + _GEN_2; // @[RGB2Y.scala 24:39]
  wire [13:0] _T_6 = {G, 6'h0}; // @[RGB2Y.scala 24:57]
  wire [16:0] _GEN_3 = {{3'd0}, _T_6}; // @[RGB2Y.scala 24:51]
  wire [17:0] _T_7 = _T_5 + _GEN_3; // @[RGB2Y.scala 24:51]
  wire [14:0] _T_8 = {G, 7'h0}; // @[RGB2Y.scala 24:69]
  wire [17:0] _GEN_4 = {{3'd0}, _T_8}; // @[RGB2Y.scala 24:63]
  wire [18:0] _T_9 = _T_7 + _GEN_4; // @[RGB2Y.scala 24:63]
  wire [10:0] _T_10 = {G, 3'h0}; // @[RGB2Y.scala 24:80]
  wire [18:0] _GEN_5 = {{8'd0}, _T_10}; // @[RGB2Y.scala 24:75]
  wire [18:0] _T_12 = _T_9 - _GEN_5; // @[RGB2Y.scala 24:75]
  wire [8:0] _T_13 = {R, 1'h0}; // @[RGB2Y.scala 24:91]
  wire [18:0] _GEN_6 = {{10'd0}, _T_13}; // @[RGB2Y.scala 24:86]
  wire [18:0] _T_15 = _T_12 - _GEN_6; // @[RGB2Y.scala 24:86]
  wire [10:0] _T_16 = {R, 3'h0}; // @[RGB2Y.scala 24:102]
  wire [18:0] _GEN_7 = {{8'd0}, _T_16}; // @[RGB2Y.scala 24:97]
  wire [18:0] _T_18 = _T_15 - _GEN_7; // @[RGB2Y.scala 24:97]
  wire [18:0] _GEN_8 = {{11'd0}, G}; // @[RGB2Y.scala 24:108]
  wire [18:0] _T_20 = _T_18 - _GEN_8; // @[RGB2Y.scala 24:108]
  wire [15:0] Y = _T_20[15:0]; // @[RGB2Y.scala 23:15 RGB2Y.scala 24:9]
  assign io_Y = Y[15:8]; // @[RGB2Y.scala 28:8]
endmodule
