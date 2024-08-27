package examples

import chisel3._
import chisel3.util._

class RGB2Y extends Module {
  val io = IO(new Bundle {
    val R = Input(UInt(12.W)) // Input R (12-bit)
    val G = Input(UInt(12.W)) // Input G (12-bit)
    val B = Input(UInt(12.W)) // Input B (12-bit)
    val Y = Output(UInt(8.W)) // Output Y (8-bit)
  })

  // Constants for bit shifts and multipliers
  val RGB2Y_SHIFT_BITS = 4  // Example shift value (should match the C++ shift)
  
  // Convert RGB inputs
  val R = io.R >> RGB2Y_SHIFT_BITS
  val G = io.G >> RGB2Y_SHIFT_BITS
  val B = io.B >> RGB2Y_SHIFT_BITS

  // Calculate Y using the given formula
  val Y = Wire(UInt(16.W))
      Y := (R << 6) +  B + (B << 1) + (B << 4) + (G << 6) + (G << 7) - (G << 3) - (R << 1) - (R << 3) - G 
  
  // Right shift to convert to 8-bit and clamp to 255
  val Yout = (Y >> 8).asUInt
  io.Y := Mux(Yout > 255.U, 255.U, Yout)
}
