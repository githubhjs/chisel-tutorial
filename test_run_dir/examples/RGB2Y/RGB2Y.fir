;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit RGB2Y : 
  module RGB2Y : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in_rgb : UInt<8>[3], out_y : UInt<8>, flip valid : UInt<1>}
    
    node _T = shl(io.in_rgb[0], 6) @[RGB2Y.scala 29:14]
    node _T_1 = shl(io.in_rgb[0], 3) @[RGB2Y.scala 29:33]
    node _T_2 = sub(_T, _T_1) @[RGB2Y.scala 29:28]
    node _T_3 = tail(_T_2, 1) @[RGB2Y.scala 29:28]
    node _T_4 = shl(io.in_rgb[0], 1) @[RGB2Y.scala 29:52]
    node _T_5 = sub(_T_3, _T_4) @[RGB2Y.scala 29:47]
    node _T_6 = tail(_T_5, 1) @[RGB2Y.scala 29:47]
    node _T_7 = shl(io.in_rgb[1], 7) @[RGB2Y.scala 30:14]
    node _T_8 = add(_T_6, _T_7) @[RGB2Y.scala 29:66]
    node _T_9 = tail(_T_8, 1) @[RGB2Y.scala 29:66]
    node _T_10 = shl(io.in_rgb[1], 6) @[RGB2Y.scala 30:33]
    node _T_11 = add(_T_9, _T_10) @[RGB2Y.scala 30:28]
    node _T_12 = tail(_T_11, 1) @[RGB2Y.scala 30:28]
    node _T_13 = shl(io.in_rgb[1], 3) @[RGB2Y.scala 30:52]
    node _T_14 = sub(_T_12, _T_13) @[RGB2Y.scala 30:47]
    node _T_15 = tail(_T_14, 1) @[RGB2Y.scala 30:47]
    node _T_16 = sub(_T_15, io.in_rgb[1]) @[RGB2Y.scala 30:66]
    node _T_17 = tail(_T_16, 1) @[RGB2Y.scala 30:66]
    node _T_18 = shl(io.in_rgb[2], 4) @[RGB2Y.scala 31:14]
    node _T_19 = add(_T_17, _T_18) @[RGB2Y.scala 30:70]
    node _T_20 = tail(_T_19, 1) @[RGB2Y.scala 30:70]
    node _T_21 = shl(io.in_rgb[2], 1) @[RGB2Y.scala 31:33]
    node _T_22 = add(_T_20, _T_21) @[RGB2Y.scala 31:28]
    node _T_23 = tail(_T_22, 1) @[RGB2Y.scala 31:28]
    node _T_24 = add(_T_23, io.in_rgb[2]) @[RGB2Y.scala 31:47]
    node Y = tail(_T_24, 1) @[RGB2Y.scala 31:47]
    node Y_clamped = bits(Y, 7, 0) @[RGB2Y.scala 34:20]
    node _T_25 = mux(io.valid, Y_clamped, UInt<1>("h00")) @[RGB2Y.scala 37:18]
    io.out_y <= _T_25 @[RGB2Y.scala 37:12]
    
