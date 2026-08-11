# Parking Lot Controller

## Description

This project implements a simple Parking Lot Controller using Verilog HDL.

The system keeps track of the number of cars inside a parking lot.

- A car entering increases the count by 1.
- A car leaving decreases the count by 1.
- When the parking lot is full, the `full` signal becomes 1.
- When the parking lot is empty, the `empty` signal becomes 1.

## Features

- Simple 4-bit parking counter
- Maximum capacity: 15 cars
- Entry and exit control
- Full and empty indicators
- Easy to simulate

## Files

- `parking_lot_controller.v` - Main Verilog code
- `parking_lot_controller_tb.v` - Testbench
- `output.vcd` - Simulation waveform
- `README.md` - Project documentation

## Inputs

| Input | Description |
|------|-------------|
| `clk` | Clock signal |
| `reset` | Resets parking count to 0 |
| `car_in` | Indicates a car entering |
| `car_out` | Indicates a car leaving |

## Outputs

| Output | Description |
|--------|-------------|
| `count` | Number of cars currently parked |
| `full` | 1 when parking lot is full |
| `empty` | 1 when parking lot is empty |

## Parking Capacity

The maximum parking capacity is 15 cars.

## How to Run

Compile the design and testbench:

    iverilog -o parking_sim parking_lot_controller.v parking_lot_controller_tb.v

Run the simulation:

    vvp parking_sim

Generate waveform:

    gtkwave output.vcd

## Expected Result

The car count increases when `car_in` is 1 and decreases when `car_out` is 1.

The `full` signal becomes 1 when the count reaches 15.

The `empty` signal becomes 1 when the count is 0.

## Conclusion

The Parking Lot Controller successfully monitors the number of cars entering and leaving a parking lot using Verilog HDL.