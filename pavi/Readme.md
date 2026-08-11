# Half-Wave Rectifier Using Verilog

## 📌 Project Overview

This project implements a **Half-Wave Rectifier** using **Verilog HDL**.

A half-wave rectifier is a circuit that allows only one half of an AC input signal to pass through while blocking the other half. In this digital implementation, positive input values are passed to the output, while negative input values are converted to zero.

The project includes the Verilog design, a testbench, and simulation results.

---

## 🎯 Objectives

* Design a half-wave rectifier using Verilog HDL.
* Verify the functionality using a testbench.
* Simulate the design and observe the input and output waveforms.
* Understand how an AC signal can be converted into a pulsating DC signal.

---

## 🧠 Working Principle

The half-wave rectifier operates according to the following logic:

```text
If AC Input > 0:
    DC Output = AC Input

If AC Input <= 0:
    DC Output = 0
```

Therefore:

```text
Positive half-cycle → Passed to output
Negative half-cycle → Blocked
```

### Block Diagram

```text
       AC Input
          │
          ▼
   ┌─────────────────┐
   │ Half-Wave       │
   │ Rectifier       │
   └─────────────────┘
          │
          ▼
      DC Output
```

---

## 📁 Project Structure

```text
half-wave-rectifier/
│
├── README.md
│
├── src/
│   └── half_wave_rectifier.v
│
├── testbench/
│   └── tb_half_wave_rectifier.v
│
└── simulation/
    └── waveform.png
```

### File Description

| File                                 | Description                |
| ------------------------------------ | -------------------------- |
| `README.md`                          | Project documentation      |
| `src/half_wave_rectifier.v`          | Verilog design module      |
| `testbench/tb_half_wave_rectifier.v` | Testbench for verification |
| `simulation/waveform.png`            | Simulation waveform        |

---

## 💻 Design Details

### Inputs

| Signal     |  Width | Description            |
| ---------- | -----: | ---------------------- |
| `clk`      |  1 bit | Clock signal           |
| `reset`    |  1 bit | Reset signal           |
| `ac_input` | 8 bits | Signed AC input signal |

### Output

| Signal      |  Width | Description             |
| ----------- | -----: | ----------------------- |
| `dc_output` | 8 bits | Rectified output signal |

---

## 🔧 Verilog Implementation

The main design checks the value of the input signal at every positive edge of the clock.

```verilog
always @(posedge clk or posedge reset) begin
    if (reset)
        dc_output <= 8'd0;
    else if (ac_input > 0)
        dc_output <= ac_input;
    else
        dc_output <= 8'd0;
end
```

When the input is positive, it appears at the output. When the input is negative or zero, the output becomes zero.

---

## 🧪 Testbench

The testbench applies both positive and negative input values to verify the rectifier.

Example input sequence:

```text
20 → 40 → 60 → 80 → -20 → -40 → -60 → -80
```

Expected output:

```text
20 → 40 → 60 → 80 → 0 → 0 → 0 → 0
```

---

## 📊 Expected Simulation Result

The simulation should show that:

```text
AC Input:
       /‾‾\        /‾‾\
      /    \      /    \
─────/      \────/      \────
    /        \  /        \
   /          \/          \

DC Output:
       /‾‾\        /‾‾\
      /    \      /    \
─────/      \────/      \────
```

The positive portions of the input signal are present at the output, while the negative portions are clipped to zero.

---

## ▶️ How to Run the Simulation

### Using Icarus Verilog

Install Icarus Verilog and run:

```bash
iverilog -o rectifier_sim \
src/half_wave_rectifier.v \
testbench/tb_half_wave_rectifier.v
```

Then run the simulation:

```bash
vvp rectifier_sim
```

The testbench will display the input and output values in the terminal.

---

## 📈 Viewing the Waveform

To generate a waveform, add VCD dumping to the testbench:

```verilog
initial begin
    $dumpfile("half_wave_rectifier.vcd");
    $dumpvars(0, tb_half_wave_rectifier);
end
```

Then run:

```bash
iverilog -o rectifier_sim \
src/half_wave_rectifier.v \
testbench/tb_half_wave_rectifier.v

vvp rectifier_sim
```

Open the generated `.vcd` file using a waveform viewer such as GTKWave.

---

## ✅ Expected Result

The design successfully performs half-wave rectification.

* Positive input values are passed to the output.
* Negative input values are converted to zero.
* Reset sets the output to zero.
* The simulation verifies the expected behavior.

---

## 🌐 Applications

Half-wave rectifiers are commonly used in:

* AC-to-DC conversion
* Power supply circuits
* Signal processing
* Demodulation circuits
* Basic electronics education

---

## 🚀 Future Improvements

The project can be extended by:

* Adding a smoothing capacitor model.
* Implementing a full-wave rectifier.
* Adding filtering to reduce output ripple.
* Creating a parameterized input width.
* Comparing half-wave and full-wave rectifiers.

---

## 👨‍💻 Technologies Used

* **Verilog HDL**
* **Icarus Verilog**
* **GTKWave**
* **GitHub**

---

## 📜 License

This project is intended for educational and academic purposes.
