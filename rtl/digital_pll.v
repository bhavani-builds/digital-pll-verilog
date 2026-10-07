module digital_pll (
    input  wire        clk,
    input  wire        reset,
    input  wire        ref_clk,

    output wire        pll_clk,
    output wire [15:0] control_word
);

    wire feedback_clk;

    wire phase_up;
    wire phase_down;

    // =========================================================
    // PHASE DETECTOR
    // =========================================================

    phase_detector phase_detector_inst (
        .ref_clk(ref_clk),
        .feedback_clk(feedback_clk),
        .reset(reset),

        .phase_up(phase_up),
        .phase_down(phase_down)
    );


    // =========================================================
    // LOOP FILTER
    // =========================================================

    loop_filter loop_filter_inst (
        .clk(clk),
        .reset(reset),

        .phase_up(phase_up),
        .phase_down(phase_down),

        .control_word(control_word)
    );


    // =========================================================
    // NUMERICALLY CONTROLLED OSCILLATOR
    // =========================================================

    nco nco_inst (
        .clk(clk),
        .reset(reset),

        .control_word(control_word),

        .nco_clk(pll_clk)
    );


    // =========================================================
    // FREQUENCY DIVIDER
    // =========================================================

    frequency_divider divider_inst (
        .clk_in(pll_clk),
        .reset(reset),

        .divide_value(16'd10),

        .clk_out(feedback_clk)
    );

endmodule
