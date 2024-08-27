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
  wire [10:0] _T_1 = {R, 3'h0}; // @[RGB2Y.scala 24:26]
  wire [13:0] _GEN_0 = {{3'd0}, _T_1}; // @[RGB2Y.scala 24:21]
  wire [13:0] _T_3 = _T - _GEN_0; // @[RGB2Y.scala 24:21]
  wire [8:0] _T_4 = {R, 1'h0}; // @[RGB2Y.scala 24:37]
  wire [13:0] _GEN_1 = {{5'd0}, _T_4}; // @[RGB2Y.scala 24:32]
  wire [13:0] _T_6 = _T_3 - _GEN_1; // @[RGB2Y.scala 24:32]
  wire [14:0] _T_7 = {G, 7'h0}; // @[RGB2Y.scala 25:15]
  wire [14:0] _GEN_2 = {{1'd0}, _T_6}; // @[RGB2Y.scala 24:43]
  wire [14:0] _T_9 = _GEN_2 + _T_7; // @[RGB2Y.scala 24:43]
  wire [13:0] _T_10 = {G, 6'h0}; // @[RGB2Y.scala 25:26]
  wire [14:0] _GEN_3 = {{1'd0}, _T_10}; // @[RGB2Y.scala 25:21]
  wire [14:0] _T_12 = _T_9 + _GEN_3; // @[RGB2Y.scala 25:21]
  wire [10:0] _T_13 = {G, 3'h0}; // @[RGB2Y.scala 25:37]
  wire [14:0] _GEN_4 = {{4'd0}, _T_13}; // @[RGB2Y.scala 25:32]
  wire [14:0] _T_15 = _T_12 - _GEN_4; // @[RGB2Y.scala 25:32]
  wire [14:0] _GEN_5 = {{7'd0}, G}; // @[RGB2Y.scala 25:43]
  wire [14:0] _T_17 = _T_15 - _GEN_5; // @[RGB2Y.scala 25:43]
  wire [11:0] _T_18 = {B, 4'h0}; // @[RGB2Y.scala 26:15]
  wire [14:0] _GEN_6 = {{3'd0}, _T_18}; // @[RGB2Y.scala 25:47]
  wire [14:0] _T_20 = _T_17 + _GEN_6; // @[RGB2Y.scala 25:47]
  wire [8:0] _T_21 = {B, 1'h0}; // @[RGB2Y.scala 26:26]
  wire [14:0] _GEN_7 = {{6'd0}, _T_21}; // @[RGB2Y.scala 26:21]
  wire [14:0] _T_23 = _T_20 + _GEN_7; // @[RGB2Y.scala 26:21]
  wire [14:0] _GEN_8 = {{7'd0}, B}; // @[RGB2Y.scala 26:32]
  wire [14:0] _T_25 = _T_23 + _GEN_8; // @[RGB2Y.scala 26:32]
  wire [15:0] Y = {{1'd0}, _T_25}; // @[RGB2Y.scala 23:15 RGB2Y.scala 24:9]
  assign io_Y = Y[15:8]; // @[RGB2Y.scala 30:8]
endmodule
