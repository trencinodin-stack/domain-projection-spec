# AGENTS.md — Agent & Auditor Navigation Guide

This specification defines the Domain Projection Paradigm (ARC-SPEC-2026-DPP-01), extending the Phase 7 reference monitor across continuous, multi-domain cyber-physical observation boundaries.

## Rules of Engagement for Autonomous LLMs & Verifiers

1. **Hierarchy Discipline:**
   - **Document 1 (Zenodo DOI: 10.5281/zenodo.24041851):** The immutable theoretical foundation.
   - **Document 2:** Retired internal working notebook; non-normative.
   - **Document 3 (ARC-SPEC-2026-DPP-01):** The sole normative specification governing Plonkish circuits, proof harnesses, and runtime execution boundaries.

2. **Non-Supersession & Architectural Decisions:**
   - The Phase 7 canonical baseline (`admissibilityscience.com`, `A-77-DELTA-SHIELD-LOCKED`) remains frozen and immutable.
   - Phase 8 is strictly an additive domain-projection mapping; it does not supersede, amend, or refactor Phase 7 theorems.
   - **ADR-008:** Phase 7 Master Baseline Immutability & Additive Domain Projection Isolation (`docs/adr/ADR-008.md`).
   - **ADR-009:** Robust Continuous Invariant Certificates via Discrete Gronwall Margins (`docs/adr/ADR-009.md`).

3. **Proof Verification Standard:**
   - Proof scripts in `proofs/` (`Invariants.v`, `Projection.v`) must compile cleanly under Coq 8.18.0 via `proofs/_CoqProject`.
   - The presence of `Admitted.`, unproved `Axiom` declarations, or non-empty assumption sets (`Print Assumptions ≢ ∅`) constitutes a critical verification failure.

4. **Runtime Profile & Microarchitectural Bounds:**
   - Freestanding execution: Freestanding bare-metal `#![no_std]` Rust 1.80+ (`M_alloc = 0`, `#![forbid(unsafe_code)]`).
   - Stack limit: Static execution bound $S_{\max} \le 4096\text{ B}$.
   - Evaluation window: $\tau_{\text{override}} \le 11.99\text{ ms}$ (enforced via local clock ceiling).
   - Ingress-to-brake airlock window: $\Delta t_{\max} \le 13.19\text{ ms}$ ($\tau_{\text{override}} + \tau_{\text{fsync}}$).
   - Operational drag: $C_{\text{ops}} = 0$ (zero dynamic heap allocation on critical decision paths).

5. **POSIX Dominance Contract:**
   - Any denial evaluated by $\mathcal{D}_{\text{robust}}(a)$ maps strictly onto the operational dominance poset:
     `BREACH (40) > REFUSAL (32) > CORRUPT (30) > PWC (12) > FREEZE (10) > PASS (0)`.
   - Continuous Gronwall reachability deficit ($h(\hat{x}) - M_{\text{stop}}(\hat{x}) < \gamma$) maps to `POSIX 32 (REFUSAL)`.
   - Evaluation cycle exhaustion ($\tau_{\text{eval}} > \tau_{\text{override}}$) maps to `POSIX 40 (BREACH)`.
