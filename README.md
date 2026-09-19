# Computer Architecture Practical — CA-Practical-4042

This repository contains the circuit designs and implementations developed for the **Computer Architecture Practical** course.

The exercises were primarily implemented using **Logisim Evolution** and cover a progression from fundamental digital circuits to processor architecture and pipelining.

---

## 🧩 Exercises

The repository contains **7 practical exercises**, progressively introducing and combining fundamental concepts of computer architecture.

### HW1 — Introduction to Logisim Evolution

An introductory exercise focused on **Logisim Evolution** and fundamental digital circuit design.

A **32-bit Adder/Subtractor** was implemented as an introduction to designing and working with digital circuits.

---

### HW2 — Multiplier & Divider

This exercise focused on hardware implementation of **multiplication and division**.

The multiplier was designed using **Booth's multiplication algorithm**, providing practical experience with sequential arithmetic circuits and hardware multiplication.

---

### HW3 — ALU

A **32-bit Arithmetic Logic Unit (ALU)** supporting **13 different operations** was designed.

The ALU provides the arithmetic and logical operations required by the processor architectures developed in the later exercises.

---

### HW4 — Memory & Register File

This exercise focused on designing the fundamental memory components required for a processor.

It included:

* Memory
* Register File
* A **32-register register file**

These components were later used as part of the processor designs.

---

### HW5 — Single-Cycle MIPS Processor

A **single-cycle MIPS processor** was designed by integrating the components developed in the previous exercises.

The processor was tested by running a **Fibonacci program** on the implemented architecture.

---

### HW6 — Multi-Cycle MIPS Processor

The single-cycle processor was extended into a **multi-cycle MIPS processor**.

Instruction execution was divided across multiple clock cycles, allowing hardware resources to be reused between different stages of execution.

---

### HW7 — Pipelined MIPS Processor

The multi-cycle MIPS processor was further extended into a **pipelined MIPS processor**.

This exercise focused on **instruction pipelining** and organizing processor execution into multiple pipeline stages.

---

## 🛠️ Tools & Technologies

* **Logisim Evolution**
* **Verilog**
* **Icarus Verilog**

---

## 📚 Topics Covered

The exercises cover a progression of core computer architecture concepts:

**Digital Logic → Arithmetic Units → ALU → Memory & Register File → Single-Cycle MIPS → Multi-Cycle MIPS → Pipelined MIPS**

Overall, the project demonstrates the gradual development of computer architecture components, progressing from basic digital circuits to a pipelined MIPS processor.
