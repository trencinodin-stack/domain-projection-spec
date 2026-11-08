# AGENTS.md — Agent & Auditor Navigation Guide

This specification defines the Domain Projection Paradigm (ARC-SPEC-2026-DPP-01), extending the Phase 7 reference monitor across continuous, multi-domain cyber-physical observation boundaries.

## Rules of Engagement for Autonomous LLMs & Verifiers

1. **Hierarchy Discipline:**
   - **Document 1 (Zenodo DOI: 10.5281/zenodo.24041851)** is the immutable theoretical foundation.
   - **Document 2** is a retired internal artifact; it must never be cited as normative authority.
   - **Document 3 (ARC-SPEC-2026-DPP-01)** is the sole normative specification for Plonkish circuits and Rust runtime constraints.

2. **Non-Supersession:**
   - The Phase 7 canonical baseline (`admissibilityscience.com`) remains frozen. 
   - Phase 8 is strictly an additive domain-projection mapping, not an amendment or refactoring of Phase 7 theorems.

3. **Proof Verification:**
   - All mechanized Coq scripts in `proofs/` must compile cleanly under `coq 8.18.0`.
   - The presence of `Admitted` or non-standard axioms is treated as a critical verification failure.

4. **Runtime Profile:**
   - Memory allocation is strictly prohibited (`M_alloc = 0`).
   - The engine must compile to freestanding bare-metal (`#![no_std]`).
