`timescale 1ns/1ps

module parking_lot_controller_tb;

    reg clk;
    reg reset;
    reg car_in;
    reg car_out;

    wire [3:0] count;
    wire full;
    wire empty;

    // Connect the controller
    parking_lot_controller uut (
        .clk(clk),
        .reset(reset),
        .car_in(car_in),
        .car_out(car_out),
        .count(count),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Create waveform file
        $dumpfile("output.vcd");
        $dumpvars(0, parking_lot_controller_tb);

        // Initial values
        clk = 0;
        reset = 1;
        car_in = 0;
        car_out = 0;

        #10;

        // Release reset
        reset = 0;

        // Car 1 enters
        car_in = 1;
        #10;

        // Car 2 enters
        car_in = 1;
        #10;

        // Car 3 enters
        car_in = 1;
        #10;

        // Stop car entry
        car_in = 0;
        #10;

        // One car leaves
        car_out = 1;
        #10;

        // Stop car exit
        car_out = 0;
        #10;

        // Display final result
        $display("Number of cars = %d", count);
        $display("Full = %b", full);
        $display("Empty = %b", empty);

        $finish;
    end

endmodule
