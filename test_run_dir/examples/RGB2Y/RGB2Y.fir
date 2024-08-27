;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit RGB2Y : 
  module RGB2Y : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip R : UInt<12>, flip G : UInt<12>, flip B : UInt<12>, Y : UInt<8>}
    
    node R = shr(io.R, 4) @[RGB2Y.scala 18:16]
    node G = shr(io.G, 4) @[RGB2Y.scala 19:16]
    node B = shr(io.B, 4) @[RGB2Y.scala 20:16]
    wire Y : UInt<16> @[RGB2Y.scala 23:15]
    node _T = shl(R, 6) @[RGB2Y.scala 24:15]
    node _T_1 = add(_T, B) @[RGB2Y.scala 24:21]
    node _T_2 = shl(B, 1) @[RGB2Y.scala 24:33]
    node _T_3 = add(_T_1, _T_2) @[RGB2Y.scala 24:27]
    node _T_4 = shl(B, 4) @[RGB2Y.scala 24:45]
    node _T_5 = add(_T_3, _T_4) @[RGB2Y.scala 24:39]
    node _T_6 = shl(G, 6) @[RGB2Y.scala 24:57]
    node _T_7 = add(_T_5, _T_6) @[RGB2Y.scala 24:51]
    node _T_8 = shl(G, 7) @[RGB2Y.scala 24:69]
    node _T_9 = add(_T_7, _T_8) @[RGB2Y.scala 24:63]
    node _T_10 = shl(G, 3) @[RGB2Y.scala 24:80]
    node _T_11 = sub(_T_9, _T_10) @[RGB2Y.scala 24:75]
    node _T_12 = tail(_T_11, 1) @[RGB2Y.scala 24:75]
    node _T_13 = shl(R, 1) @[RGB2Y.scala 24:91]
    node _T_14 = sub(_T_12, _T_13) @[RGB2Y.scala 24:86]
    node _T_15 = tail(_T_14, 1) @[RGB2Y.scala 24:86]
    node _T_16 = shl(R, 3) @[RGB2Y.scala 24:102]
    node _T_17 = sub(_T_15, _T_16) @[RGB2Y.scala 24:97]
    node _T_18 = tail(_T_17, 1) @[RGB2Y.scala 24:97]
    node _T_19 = sub(_T_18, G) @[RGB2Y.scala 24:108]
    node _T_20 = tail(_T_19, 1) @[RGB2Y.scala 24:108]
    Y <= _T_20 @[RGB2Y.scala 24:9]
    node Yout = shr(Y, 8) @[RGB2Y.scala 27:17]
    node _T_21 = gt(Yout, UInt<8>("h0ff")) @[RGB2Y.scala 28:20]
    node _T_22 = mux(_T_21, UInt<8>("h0ff"), Yout) @[RGB2Y.scala 28:14]
    io.Y <= _T_22 @[RGB2Y.scala 28:8]
    
