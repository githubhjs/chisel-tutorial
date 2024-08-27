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
    node _T_2 = tail(_T_1, 1) @[RGB2Y.scala 24:21]
    node _T_3 = shl(B, 1) @[RGB2Y.scala 24:31]
    node _T_4 = add(_T_2, _T_3) @[RGB2Y.scala 24:26]
    node _T_5 = tail(_T_4, 1) @[RGB2Y.scala 24:26]
    node _T_6 = shl(B, 4) @[RGB2Y.scala 24:42]
    node _T_7 = add(_T_5, _T_6) @[RGB2Y.scala 24:37]
    node _T_8 = tail(_T_7, 1) @[RGB2Y.scala 24:37]
    node _T_9 = shl(G, 6) @[RGB2Y.scala 24:53]
    node _T_10 = add(_T_8, _T_9) @[RGB2Y.scala 24:48]
    node _T_11 = tail(_T_10, 1) @[RGB2Y.scala 24:48]
    node _T_12 = shl(G, 7) @[RGB2Y.scala 24:64]
    node _T_13 = add(_T_11, _T_12) @[RGB2Y.scala 24:59]
    node _T_14 = tail(_T_13, 1) @[RGB2Y.scala 24:59]
    node _T_15 = shl(G, 3) @[RGB2Y.scala 24:75]
    node _T_16 = sub(_T_14, _T_15) @[RGB2Y.scala 24:70]
    node _T_17 = tail(_T_16, 1) @[RGB2Y.scala 24:70]
    node _T_18 = shl(R, 1) @[RGB2Y.scala 24:86]
    node _T_19 = sub(_T_17, _T_18) @[RGB2Y.scala 24:81]
    node _T_20 = tail(_T_19, 1) @[RGB2Y.scala 24:81]
    node _T_21 = shl(R, 3) @[RGB2Y.scala 24:97]
    node _T_22 = sub(_T_20, _T_21) @[RGB2Y.scala 24:92]
    node _T_23 = tail(_T_22, 1) @[RGB2Y.scala 24:92]
    node _T_24 = sub(_T_23, G) @[RGB2Y.scala 24:103]
    node _T_25 = tail(_T_24, 1) @[RGB2Y.scala 24:103]
    Y <= _T_25 @[RGB2Y.scala 24:9]
    node Yout = shr(Y, 8) @[RGB2Y.scala 27:17]
    node _T_26 = gt(Yout, UInt<8>("h0ff")) @[RGB2Y.scala 28:20]
    node _T_27 = mux(_T_26, UInt<8>("h0ff"), Yout) @[RGB2Y.scala 28:14]
    io.Y <= _T_27 @[RGB2Y.scala 28:8]
    
