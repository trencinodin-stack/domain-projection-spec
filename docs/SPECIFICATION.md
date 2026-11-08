# ARC-SPEC-2026-DPP-01: Domain Projection Paradigm Specification

## 1. Scope & System Definition
This specification governs the concrete projection engine transforming continuous cyber-physical state observations into admissible discrete inputs under zero-drag edge invariants.

## 2. Invariant Envelope
- **I1 (No Ambient Authority):** $\forall c \in \mathcal{C}, \text{Admissible}(c) \iff \text{Explicit}(c) \land \text{Valid}(c)$
- **I2 (Monotonic Join):** $\forall s_1, s_2 \in \mathcal{S}, s_1 \le (s_1 \sqcup s_2)$
- **I3 (Ceiling Boundaries):** 
  - Evaluation time: $\tau_{\text{override}} \le 11.99\text{ ms}$
  - Physical disengagement: $\Delta t_{\text{max}} \le 13.19\text{ ms}$
  - Heap allocation: $M_{\text{alloc}} = 0$
  - Execution stack ceiling: $S_{\text{max}} \le 4096\text{ B}$

## 3. Plonkish Ingress Airlock Gates (G1–G6)
The verification harness validates a 64-bit boolean decomposition circuit:
- **$G_1$ (Range Constraint):** $b_i \cdot (1 - b_i) = 0$ for each bit cell $i \in [0, 63]$.
- **$G_2$ (Bit Accumulator):** $\sum_{i=0}^{63} 2^i \cdot b_i - X_{\text{ingress}} = 0$.
- **$G_3$ (Epoch Monotonicity):** Enforces $E_{k+1} - E_k \ge 0$.
- **$G_4$ (Capability Flag Isolation):** Enforces high-order bit capability extraction without arithmetic overflow.
- **$G_5$ (Mechanical Stop Trip):** Asserts $M_{\text{stop}} \equiv 1$ whenever validity conditions fail.
- **$G_6$ (Terminal Permutation):** Preserves copy constraints across boundary transitions.

## 4. Provenance
- Root Theoretical Monograph: Zenodo DOI [10.5281/zenodo.24041851](https://doi.org/10.5281/zenodo.24041851)
- Baseline Invariant Suite: Phase 7 (`admissibilityscience.com`)
