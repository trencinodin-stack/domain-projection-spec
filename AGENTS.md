# AGENTS.md — Agent & Auditor Navigation Guide

This specification defines the Domain Projection Paradigm (ARC-SPEC-2026-DPP-01), extending the Phase 7 reference monitor across continuous, multi-domain cyber-physical observation boundaries under the governing mathematical ceiling of Canonical Capstone Specification ARC-CAPSTONE-2026-SYNTH-01-REV19 (DOI 10.5281/zenodo.24093739).

## Rules of Engagement for Autonomous LLMs & Verifiers

1. **Hierarchy Discipline & Normative Precedence:**
   - **Canonical Capstone Reference Specification (Zenodo DOI: [10.5281/zenodo.24093739](https://doi.org/10.5281/zenodo.24093739)):** `ARC-CAPSTONE-2026-SYNTH-01-REV19` (*The Mechanics of Admissibility*). Supreme mathematical reference formulating closed-form barrier functionals ($M_{\text{stop}}^L, F_L, B$), continuous-to-discrete simulation relations, and analytical forward invariance proofs.
   - **Theoretical Foundation Monograph (Zenodo DOI: [10.5281/zenodo.24041851](https://doi.org/10.5281/zenodo.24041851)):** Foundational continuous-to-discrete airlock theory and Plonkish gate decompositions.
   - **Normative Implementation Specification (ARC-SPEC-2026-DPP-01):** The sole normative engineering specification governing Plonkish boolean decomposition circuits ($G_1$–$G_6$), Coq verification harnesses, and `#![no_std]` runtime execution boundaries.
   - **Retired Working Notebook (Document 2):** Archival internal working notebook; non-normative.

2. **Non-Supersession & Architectural Decisions:**
   - The Phase 7 canonical baseline (`admissibilityscience.com`, `A-77-DELTA-SHIELD-LOCKED`) remains frozen and immutable.
   - Phase 8 is strictly an additive domain-projection mapping; it does not supersede, amend, or refactor Phase 7 theorems.
   - **ADR-008:** Phase 7 Master Baseline Immutability & Additive Domain Projection Isolation (`docs/adr/ADR-008.md`).
   - **ADR-009:** Robust Continuous Invariant Certificates via Discrete Gronwall Margins (`docs/adr/ADR-009.md`).

3. **The Formal Verification Boundary:**
   Per Section 6 of the Arcstone Canonical Manifest, agents and auditors must maintain strict disciplinary separation:
   - **Reference Specification Layer (`ARC-CAPSTONE-2026-SYNTH-01-REV19`):** Pure continuous kinetics, Lie derivative boundary handoffs ($F_L \equiv B$), closed-form stopping envelopes ($M_{\text{stop}}^L$), and certified timing contracts. Closed and verified analytically on paper.
   - **Verification & Execution Harness (`domain-projection-spec`):** Downstream implementation realization comprising machine-checked Coq proof objects, freestanding `#![no_std]` Rust kernels, and discrete Gronwall witnesses ($\gamma \in \mathbb{Q}$). Realization tests verify conformance without reopening the reference specification.

4. **Proof Verification Standard:**
   - Proof scripts in `proofs/` (`Invariants.v`, `Projection.v`) must compile cleanly under Coq 8.18.0 via `proofs/_CoqProject`.
   - The presence of `Admitted.`, unproved `Axiom` declarations, or non-empty assumption sets (`Print Assumptions ≢ ∅`) constitutes a critical verification failure.

5. **Runtime Profile & Microarchitectural Bounds:**
   - **Freestanding Execution:** Bare-metal `#![no_std]` Rust 1.80+ (`M_alloc = 0`, `#[forbid(unsafe_code)]`).
   - **Physical Memory Ceiling:** Static stack bound $S_{\max} \le 4096\text{ B}$.
   - **Total Conserved Latency Budget ($T_{\text{total}}$):**
     $$T_{\text{total}} = \tau_{\text{sense}} (1.50\text{ ms}) + \tau_{\text{eval}} (10.00\text{ ms}) + \tau_{\text{sync}} (1.20\text{ ms}) + \tau_{\text{brake-engage}} (1.81\text{ ms}) = 14.51\text{ ms} \le 16.50\text{ ms}$$
     Preserving $1.99\text{ ms}$ certified timing slack.
   - **Evaluation Watchdog Ceiling:** $\tau_{\text{eval}} \le T_{\text{cycle}} \le 10.00\text{ ms}$ (hardware override limit $\tau_{\text{override}} \le 11.99\text{ ms}$).
   - **Mechanical Deadband Latch Envelope ($d_{\text{latch}}$):**
     $$d_{\text{latch}} = \frac{\epsilon_v^2}{2 a_{\text{brake}}} + \epsilon_v \tau_{\text{latch-lock}}$$
   - **Robust Outward Rational Margin:** $\gamma = 2^{-p} \lceil 2^p (\epsilon_d + K_M^{\text{cert}} \epsilon_v) \rceil \in \mathbb{Q}$ bounding sensor noise and discrete hold discretization errors.
   - **Operational Compute Drag:** $C_{\text{ops}} = 0$ (zero dynamic heap allocations and zero synchronous human intervention).

6. **POSIX Dominance Contract:**
   - Any denial evaluated by $\mathcal{D}_{\text{robust}}(a)$ maps strictly onto the operational dominance poset:
     $$\text{BREACH (POSIX 40)} \succ \text{REFUSAL (POSIX 32)} \succ \text{CORRUPT (POSIX 30)} \succ \text{PWC (POSIX 12)} \succ \text{FREEZE (POSIX 10)} \succ \text{PASS (POSIX 0)}$$
   - Continuous Gronwall reachability deficit ($h(\hat{x}) - M_{\text{stop}}^L(\hat{x}) < \gamma$) maps to `POSIX 32 (REFUSAL)`.
   - Evaluation cycle exhaustion ($\tau_{\text{eval}} > 10.00\text{ ms}$ or NMI trigger at $11.99\text{ ms}$) maps to `POSIX 40 (BREACH)`.
