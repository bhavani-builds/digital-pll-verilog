module frequency_divider (
    input  wire        clk_in,
    input  wire        reset,
    input  wire [15:0] divide_value,
    output reg         clk_out
);

    reg [15:0] counter;

    always @(posedge clk_in or posedge reset) begin

        if (reset) begin
            counter <= 16'd0;
            clk_out <= 1'b0;
        end

        else begin
            if (counter >= divide_value - 1'b1) begin
                counter <= 16'd0;
                clk_out <= ~clk_out;
            end
            else begin
                counter <= counter + 16'd1;
            end
        end

    end

endmodule
