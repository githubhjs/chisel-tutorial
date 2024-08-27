// See LICENSE.txt for license details.
package examples

import chisel3._
import chisel3.util._

class RGB2Y extends Module {
  val io = IO(new Bundle {
    val in_rgb = Input(Vec(3, UInt(8.W)))  // 8-bit RGB input
    val out_y = Output(UInt(8.W))          // 8-bit Y output
    val valid = Input(Bool())              // Optional: Indicate valid input data
  })

  // Constants for bit-shifting (matches the C++ comments)
  val R_shift_6 = 6
  val R_shift_3 = 3
  val R_shift_1 = 1
  val G_shift_7 = 7
  val G_shift_6 = 6
  val G_shift_3 = 3
  val B_shift_4 = 4
  val B_shift_1 = 1

  // Internal wires for calculations
  val R = io.in_rgb(0)
  val G = io.in_rgb(1)
  val B = io.in_rgb(2)

  val Y = (R << R_shift_6) - (R << R_shift_3) - (R << R_shift_1) +
          (G << G_shift_7) + (G << G_shift_6) - (G << G_shift_3) - G +
          (B << B_shift_4) + (B << B_shift_1) + B

  // Clamp the output to 8 bits (ensure it's within 0-255)
  val Y_clamped = Y(7, 0) // Take the lower 8 bits

  // Output logic
  io.out_y := Mux(io.valid, Y_clamped, 0.U) // Output Y if valid, else 0
}
