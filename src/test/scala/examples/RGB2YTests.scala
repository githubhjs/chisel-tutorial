////package examples
////
////import chisel3.iotesters.{PeekPokeTester, Driver, ChiselFlatSpec}
////import chisel3.util._
////
////// Test harness for RGB2Y module
////class RGB2YTests(c: RGB2Y) extends PeekPokeTester(c) {
////
////  // Test a range of RGB values
////  for (r <- 0 until 256) {
////    for (g <- 0 until 256) {
////      for (b <- 0 until 256) {
////
////        // Poke RGB values into the module
////        poke(c.io.in_rgb(0), r.U)
////        poke(c.io.in_rgb(1), g.U)
////        poke(c.io.in_rgb(2), b.U)
////        poke(c.io.valid, true.B)
////
////        // Advance the clock
////        step(1)
////
////        // Calculate the expected Y value
////        val expectedY = ((r * 66 + g * 129 + b * 25) + 128) >> 8  // Standard YUV conversion formula
////
////        // Check if the output matches the expected value
////        expect(c.io.out_y, expectedY.U)
////      }
////    }
////  }
////}
////
////// Test runner for RGB2Y
////class RGB2YTester extends ChiselFlatSpec {
////  behavior of "RGB2Y"
////  backends foreach { backend =>
////    it should s"correctly convert RGB to Y for all possible input combinations $backend" in {
////      Driver(() => new RGB2Y)(c => new RGB2YTests(c)) should be(true)
////    }
////  }
////}


package examples

import chisel3.iotesters.{PeekPokeTester, Driver, ChiselFlatSpec}

// Test harness for RGB2Y module
class RGB2YTests(c: RGB2Y) extends PeekPokeTester(c) {

  // Test a range of RGB values
  for (r <- 0 until 256) {
    for (g <- 0 until 256) {
      for (b <- 0 until 256) {

        // Poke RGB values into the module, converting Ints to UInts
        poke(c.io.in_rgb(0), r)
        poke(c.io.in_rgb(1), g)
        poke(c.io.in_rgb(2), b)
        poke(c.io.valid, true)  // Convert Boolean to Bool

        // Advance the clock
        step(1)

        // Calculate the expected Y value
        val expectedY = ((r * 66 + g * 129 + b * 25) + 128) >> 8  // Standard YUV conversion formula

        // Check if the output matches the expected value, converting Int to UInt
        expect(c.io.out_y, expectedY)
      }
    }
  }
}

// Test runner for RGB2Y
class RGB2YTester extends ChiselFlatSpec {
  behavior of "RGB2Y"
  backends foreach { backend =>
    it should s"correctly convert RGB to Y for all possible input combinations $backend" in {
      Driver(() => new RGB2Y)(c => new RGB2YTests(c)) should be(true)
    }
  }
}
