module parking_lot_controller (
    input clk,
    input reset,
    input car_in,
    input car_out,
    output reg [3:0] count,
    output full,
    output empty
);

    // Reset and parking count
    always @(posedge clk) begin

        if (reset)
            count <= 4'd0;

        else begin

            // Car enters
            if (car_in && !car_out && count < 4'd15)
                count <= count + 1;

            // Car leaves
            else if (car_out && !car_in && count > 4'd0)
                count <= count - 1;

        end
    end

    // Full indicator
    assign full = (count == 4'd15);

    // Empty indicator
    assign empty = (count == 4'd0);

endmodule