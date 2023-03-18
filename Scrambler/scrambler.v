module scrambler (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire [31:0] seed,
    input wire data_in,
    output reg data_out
);

reg [30:0] lfsr;

// Update LFSR on the rising edge of the clock
always @(posedge clk) begin
    if (reset) begin
        lfsr <= seed;
    end else if (enable) begin
        lfsr <= {lfsr[29:0], lfsr[30] ^ lfsr[27]};
    end
end

// Scramble the input data using the LFSR output
always @(posedge clk) begin
    if (enable) begin
        data_out <= data_in ^ lfsr[30];
    end
end

endmodule
