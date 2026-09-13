# Carry Save Adder (CSA)

## How it works
Adds three numbers (X, Y, Z) at the same time and outputs two numbers:
- Sum (S)
- Carry (C)

For each bit i:

  S[i] = X[i] ^ Y[i] ^ Z[i]

  C[i] = (X[i] & Y[i]) | (Y[i] & Z[i]) | (Z[i] & X[i])


Important: Carry is NOT propagated between bits. After addition, the carry vector is shifted left by one (C << 1).

## Example (3-bit)
X = 101, Y = 011, Z = 110

Bit0: 1+1+0 → S0=0, C0=1

Bit1: 0+1+1 → S1=0, C1=1

Bit2: 1+0+1 → S2=0, C2=1


Sum   = 000

Carry = 111 → after left shift: 110

Final result = Sum + (Carry << 1) = 000 + 110 = 110  (correct sum of X+Y+Z)

