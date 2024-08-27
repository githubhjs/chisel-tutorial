;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit RGB2Y : 
  module RGB2Y : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip R : UInt<12>, flip G : UInt<12>, flip B : UInt<12>, Y : UInt<8>}
    
    node R = shr(io.R, 4) @[RGB2Y.scala 18:16]
    node G = shr(io.G, 4) @[RGB2Y.scala 19:16]
    node B = shr(io.B, 4) @[RGB2Y.scala 20:16]
    node _T = shl(R, 6) @[RGB2Y.scala 23:14]
    node _T_1 = shl(R, 3) @[RGB2Y.scala 23:25]
    node _T_2 = sub(_T, _T_1) @[RGB2Y.scala 23:20]
    node _T_3 = tail(_T_2, 1) @[RGB2Y.scala 23:20]
    node _T_4 = shl(R, 1) @[RGB2Y.scala 23:36]
    node _T_5 = sub(_T_3, _T_4) @[RGB2Y.scala 23:31]
    node _T_6 = tail(_T_5, 1) @[RGB2Y.scala 23:31]
    node _T_7 = shl(G, 7) @[RGB2Y.scala 24:14]
    node _T_8 = add(_T_6, _T_7) @[RGB2Y.scala 23:42]
    node _T_9 = tail(_T_8, 1) @[RGB2Y.scala 23:42]
    node _T_10 = shl(G, 6) @[RGB2Y.scala 24:25]
    node _T_11 = add(_T_9, _T_10) @[RGB2Y.scala 24:20]
    node _T_12 = tail(_T_11, 1) @[RGB2Y.scala 24:20]
    node _T_13 = shl(G, 3) @[RGB2Y.scala 24:36]
    node _T_14 = sub(_T_12, _T_13) @[RGB2Y.scala 24:31]
    node _T_15 = tail(_T_14, 1) @[RGB2Y.scala 24:31]
    node _T_16 = sub(_T_15, G) @[RGB2Y.scala 24:42]
    node _T_17 = tail(_T_16, 1) @[RGB2Y.scala 24:42]
    node _T_18 = shl(B, 4) @[RGB2Y.scala 25:14]
    node _T_19 = add(_T_17, _T_18) @[RGB2Y.scala 24:46]
    node _T_20 = tail(_T_19, 1) @[RGB2Y.scala 24:46]
    node _T_21 = shl(B, 1) @[RGB2Y.scala 25:25]
    node _T_22 = add(_T_20, _T_21) @[RGB2Y.scala 25:20]
    node _T_23 = tail(_T_22, 1) @[RGB2Y.scala 25:20]
    node _T_24 = add(_T_23, B) @[RGB2Y.scala 25:31]
    node Y = tail(_T_24, 1) @[RGB2Y.scala 25:31]
    node Yout = shr(Y, 8) @[RGB2Y.scala 28:17]
    node _T_25 = gt(Yout, UInt<8>("h0ff")) @[RGB2Y.scala 29:20]
    node _T_26 = mux(_T_25, UInt<8>("h0ff"), Yout) @[RGB2Y.scala 29:14]
    io.Y <= _T_26 @[RGB2Y.scala 29:8]
    
