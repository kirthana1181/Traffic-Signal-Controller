# Overview
A Traffic Signal Controller is a digital system that automates the switching of traffic lights (Red, Yellow, Green) at road intersections using an FSM (Finite State Machine) model.
**In this Personal Project, I created a simple simulation based on behavioral and RTL-level modelling of the FSM-traffic signal controller, as shown in the Testbench and Results File. Here's an overview of the functionality and description of the implementation.**
# 1. Objective of the FSM
The FSM here controls traffic signals (Red, Yellow, Green) for North-South (NS) and East-West (EW) directions. It adapts based on pedestrian inputs (ped_NS and ped_EW) using digital logic design principles.
# 2. FSM Structure
Each instance of fsm acts as a finite state machine controlling signals for one direction. The FSM outputs are:

ps2: Red
ps1: Yellow
ps0: Green

Together {ps2, ps1, ps0} represents the current light status.

# 3. States and State Representation
States are defined implicitly using light output patterns. Symbolic state names (S0, S1, S2) are used, and these transitions correspond to signal transitions between Green, Yellow, and Red.
**State Encoding**
| State  | Light Output | `{ps2, ps1, ps0}` |
| ------ | ------------ | ----------------- |
| Green  | Go           | 3'b001            |
| Yellow | Wait         | 3'b010            |
| Red    | Stop         | 3'b100            |

# 4. FSM Transitions (Driven by Counter)
A 5-bit counter (ctr) keeps track of time spent in each light phase.

The transitions are time-based:

Yellow: first 2 cycles (counter <= 2)
Green: next 6 cycles (2 < counter <= 8)
Red: last 12 cycles ( 8 < counter <= 20)

This means:

Every full cycle = 20 clock cycles (based on parameter WAIT).

Light patterns change based on this timer (mimicking traffic signal duration).
 **FSM States in our program**
| State | NS Light | EW Light | Description               |
| ----- | -------- | -------- | ------------------------- |
| S0    | Green    | Red      | North-South traffic flows |
| S1    | Yellow   | Red      | NS prepares to stop       |
| S2    | Red      | Green    | East-West traffic flows   |
| S3    | Red      | Yellow   | EW prepares to stop       |

# 5. Pedestrian Mode Switching
The FSM behavior depends on ped_mode:

ped_mode = 0: Default cycle (e.g., vehicles allowed to pass)

ped_mode = 1: Modified cycle (likely to prioritize pedestrian crossing)

The light sequences are rearranged based on this mode, flipping when pedestrian input is active.

