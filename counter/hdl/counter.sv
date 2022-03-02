module counter
#(
    parameter WIDTH = 4
)
(
    input logic clk,
    input logic reset,
    output logic [WIDTH-1:0] Q
);

    always_ff @(posedge clk) begin
        if (reset == 1'b1)
            Q <= '0;
        else
            Q <= Q + 1'b1;
    end

endmodule