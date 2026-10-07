`timescale 1ns/1ps

module tb_digital_pll;

    reg clk;
    reg reset;
    reg ref_clk;

    wire pll_clk;
    wire [15:0] control_word;

    // =========================================================
    // DUT
    // =========================================================

    digital_pll dut (
        .clk(clk),
        .reset(reset),
        .ref_clk(ref_clk),

        .pll_clk(pll_clk),
        .control_word(control_word)
    );


    // =========================================================
    // SYSTEM CLOCK
    // 10 ns period
    // =========================================================

    always #5 clk = ~clk;


    // =========================================================
    // REFERENCE CLOCK
    // 100 ns period
    // =========================================================

    always #50 ref_clk = ~ref_clk;


    // =========================================================
    // SIMULATION
    // =========================================================

    initial begin

        $dumpfile("digital_pll.vcd");
        $dumpvars(0, tb_digital_pll);

        clk     = 1'b0;
        ref_clk = 1'b0;
        reset   = 1'b1;

        #100;

        reset = 1'b0;

        #5000;

        $display("--------------------------------------");
        $display(" DIGITAL PLL SIMULATION COMPLETE");
        $display("--------------------------------------");
        $display("Control Word = %d", control_word);

        $finish;

    end

endmodule
