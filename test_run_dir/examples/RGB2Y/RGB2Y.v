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
  wire [13:0] _T_2 = _T + _GEN_0; // @[RGB2Y.scala 24:21]
  wire [8:0] _T_3 = {B, 1'h0}; // @[RGB2Y.scala 24:31]
  wire [13:0] _GEN_1 = {{5'd0}, _T_3}; // @[RGB2Y.scala 24:26]
  wire [13:0] _T_5 = _T_2 + _GEN_1; // @[RGB2Y.scala 24:26]
  wire [11:0] _T_6 = {B, 4'h0}; // @[RGB2Y.scala 24:42]
  wire [13:0] _GEN_2 = {{2'd0}, _T_6}; // @[RGB2Y.scala 24:37]
  wire [13:0] _T_8 = _T_5 + _GEN_2; // @[RGB2Y.scala 24:37]
  wire [13:0] _T_9 = {G, 6'h0}; // @[RGB2Y.scala 24:53]
  wire [13:0] _T_11 = _T_8 + _T_9; // @[RGB2Y.scala 24:48]
  wire [14:0] _T_12 = {G, 7'h0}; // @[RGB2Y.scala 24:64]
  wire [14:0] _GEN_3 = {{1'd0}, _T_11}; // @[RGB2Y.scala 24:59]
  wire [14:0] _T_14 = _GEN_3 + _T_12; // @[RGB2Y.scala 24:59]
  wire [10:0] _T_15 = {G, 3'h0}; // @[RGB2Y.scala 24:75]
  wire [14:0] _GEN_4 = {{4'd0}, _T_15}; // @[RGB2Y.scala 24:70]
  wire [14:0] _T_17 = _T_14 - _GEN_4; // @[RGB2Y.scala 24:70]
  wire [8:0] _T_18 = {R, 1'h0}; // @[RGB2Y.scala 24:86]
  wire [14:0] _GEN_5 = {{6'd0}, _T_18}; // @[RGB2Y.scala 24:81]
  wire [14:0] _T_20 = _T_17 - _GEN_5; // @[RGB2Y.scala 24:81]
  wire [10:0] _T_21 = {R, 3'h0}; // @[RGB2Y.scala 24:97]
  wire [14:0] _GEN_6 = {{4'd0}, _T_21}; // @[RGB2Y.scala 24:92]
  wire [14:0] _T_23 = _T_20 - _GEN_6; // @[RGB2Y.scala 24:92]
  wire [14:0] _GEN_7 = {{7'd0}, G}; // @[RGB2Y.scala 24:103]
  wire [14:0] _T_25 = _T_23 - _GEN_7; // @[RGB2Y.scala 24:103]
  wire [15:0] Y = {{1'd0}, _T_25}; // @[RGB2Y.scala 23:15 RGB2Y.scala 24:9]
  assign io_Y = Y[15:8]; // @[RGB2Y.scala 28:8]
endmodule
