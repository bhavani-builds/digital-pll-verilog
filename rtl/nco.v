
module nco (
    input  wire        clk,
    input  wire        reset,
    input  wire [15:0] control_word,
    output wire        nco_clk
);

    reg [15:0] phase_accumulator;

    // Phase accumulator
    always @(posedge clk or posedge reset) begin
        if (reset)
            phase_accumulator <= 16'd0;
        else
            phase_accumulator <= phase_accumulator + control_word;
    end

    // Generate oscillator output
    assign nco_clk = phase_accumulator[15];

endmodule
