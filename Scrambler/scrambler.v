module nr_scrambler (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire [30:0] c_init,
    input wire data_in,
    output reg data_out
);

reg [30:0] x1, x2;

integer n;

// Gold sequence generator LFSR update function
function [30:0] lfsr_update;
    input [30:0] lfsr;
    lfsr_update = {lfsr[29:0], lfsr[30] ^ lfsr[27]};
endfunction

// Scrambling initialization
always @(posedge clk) begin
    if (reset) begin
        x1 <= 31'b1000000000000000000000000000000;
        x2 <= c_init;
    end
end

// Generate the Gold sequence and scramble the input data
always @(posedge clk) begin
    if (enable) begin
        // Update LFSRs
        x1 <= lfsr_update(x1);
        x2 <= lfsr_update(x2);
        
        // Generate the Gold sequence and scramble the input data
        data_out <= data_in ^ (x1[30] ^ x2[30]);
    end
end

endmodule
