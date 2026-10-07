# Digital Phase-Locked Loop (DPLL) in Verilog

A digital Phase-Locked Loop implemented using synthesizable Verilog RTL.

The project demonstrates a feedback-based clock generation system consisting of a phase/frequency detector, digital loop filter, numerically controlled oscillator (NCO), and programmable frequency divider.

---

## Architecture

```text
                 Reference Clock
                       |
                       v
              +------------------+
              | Phase/Frequency  |
              |    Detector      |
              +--------+---------+
                       |
                    UP / DOWN
                       |
                       v
              +------------------+
              |   Digital Loop   |
              |     Filter       |
              +--------+---------+
                       |
                  Control Word
                       |
                       v
              +------------------+
              |       NCO        |
              | Phase Accumulator|
              +--------+---------+
                       |
                    PLL Clock
                       |
                       v
              +------------------+
              |    Frequency     |
              |     Divider      |
              +--------+---------+
                       |
                    Feedback
                       |
                       +--------------------+
