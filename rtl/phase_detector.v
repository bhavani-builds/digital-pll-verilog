module phase_detector (
    input  wire ref_clk,
    input  wire feedback_clk,
    input  wire reset,

    output reg  phase_up,
    output reg  phase_down
);

    always @(posedge ref_clk or posedge reset) begin

        if (reset) begin
            phase_up   <= 1'b0;
            phase_down <= 1'b0;
        end
        else begin

            if (ref_clk && !feedback_clk) begin
                phase_up   <= 1'b1;
                phase_down <= 1'b0;
            end
            else if (!ref_clk && feedback_clk) begin
                phase_up   <= 1'b0;
                phase_down <= 1'b1;
            end
            else begin
                phase_up   <= 1'b0;
                phase_down <= 1'b0;
            end

        end

    end

endmodule
