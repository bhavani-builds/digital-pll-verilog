module loop_filter (
    input  wire        clk,
    input  wire        reset,

    input  wire        phase_up,
    input  wire        phase_down,

    output reg  [15:0] control_word
);

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            control_word <= 16'd1000;
        end

        else begin

            if (phase_up && !phase_down)
                control_word <= control_word + 16'd1;

            else if (phase_down && !phase_up)
                control_word <= control_word - 16'd1;

            else
                control_word <= control_word;

        end

    end

endmodule
