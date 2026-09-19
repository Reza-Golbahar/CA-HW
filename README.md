# Computer Architecture Practical — CA-Practical-4042

This repository contains the solutions and circuit designs developed for the **Computer Architecture Practical** course.

The exercises were implemented primarily using **Logisim Evolution** and cover a progression from fundamental digital circuits to processor architecture and pipelining.

---

## 🧩 Exercises

The project consists of **7 practical exercises**, gradually increasing in complexity and building upon concepts introduced in previous assignments.

### HW1 — Introduction to Logisim Evolution

The first exercise served as an introduction to the **Logisim Evolution** environment and fundamental digital circuit design.

A basic **32-bit Adder/Subtractor** was implemented as the first step toward working with more complex hardware components.

---

### HW2 — Multiplier & Divider

The second exercise focused on designing hardware for **multiplication and division**.

The multiplier was implemented using **Booth's multiplication algorithm**, providing practical experience with sequential arithmetic operations and hardware multiplication.

---

### HW3 — ALU

The third exercise involved designing a **32-bit Arithmetic Logic Unit (ALU)**.

The ALU supports **13 different operations**, providing the core arithmetic and logical functionality required by the processor developed in later exercises.

---

### HW4 — Memory & Register File

The fourth exercise focused on the memory components required for processor design.

The main components included:

* Memory
* Register File
* A **32-register register file**

These components formed important building blocks for the processor assignments that followed.

---

### HW5 — Single-Cycle MIPS Processor

The fifth exercise involved designing a **single-cycle MIPS processor**.

The processor was capable of executing MIPS instructions, with a **Fibonacci program** used to test its functionality.

This exercise brought together several components developed in the previous assignments into a complete single-cycle processor.

---

### HW6 — Multi-Cycle MIPS Processor

The single-cycle processor was extended into a **multi-cycle MIPS processor**.

Instruction execution was divided across multiple clock cycles, allowing hardware components to be reused across different stages of instruction execution.

---

### HW7 — Pipelined MIPS Processor

The multi-cycle MIPS processor was further extended into a **pipelined MIPS processor**.

This exercise focused on the principles of **instruction pipelining** and organizing processor execution into multiple pipeline stages.

---

## 🛠️ Tools & Technologies

* **Logisim Evolution**
* **Verilog**
* **Icarus Verilog**

---

## 📚 Topics Covered

The exercises follow a progression through several fundamental areas of computer architecture:

**Digital Logic → Arithmetic Units → ALU → Memory & Register File → Single-Cycle MIPS → Multi-Cycle MIPS → Pipelined MIPS**

The project demonstrates the gradual development of computer architecture components, starting from basic digital circuits and progressing toward a pipelined MIPS processor.
