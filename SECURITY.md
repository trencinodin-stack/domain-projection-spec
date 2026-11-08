# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability, Coq proof unsoundness, buffer boundary flaw, Plonkish gate bypass, or execution-membrane logic defect affecting `domain-projection-spec`, please **do not open a public issue**.

Submit reports through either of the following private channels:

1. **GitHub Private Vulnerability Reporting (Recommended):**
   * Go to the **Security** tab of this repository (`trencinodin-stack/domain-projection-spec`).
   * Click **Report a vulnerability**.
   * Fill out the form to submit a private report directly to maintainers.

2. **Security Contact:**
   * Submit an out-of-band report via **security@arcstoneos.com** or the canonical root contact at **admissibilityscience.com**.

---

## What to Include

Please include, where applicable:
- A concise description of the vulnerability, invariant breakdown, or Coq proof gap.
- Minimal reproduction steps:
  * For runtime issues: A deterministic `#![no_std]` unit test or harness demonstrating the boundary flaw.
  * For formal verification: A Coq script showing lemma unsoundness or an unhandled admitting contradiction in `proofs/`.
- The affected commit hash or release tag.
- Whether the issue involves:
  * Invariant I1 breach (unauthorized execution without explicit, valid capability);
  * Invariant I2 monotonicity violation (backward epoch transitions or lattice join skew);
  * Invariant I3 ceiling breaches ($\tau_{\text{override}} > 11.99\,\text{ms}$, stack consumption $> 4096\,\text{B}$, or dynamic heap allocation $M_{\text{alloc}} > 0$);
  * Airlock gate failure ($G_1$–$G_6$ boolean decomposition or permutation leakage);
  * Mechanical stop ($M_{\text{stop}}$) failure to trip on invalid continuous observations;
  * Violation of `#![no_std]` or `#![forbid(unsafe_code)]` runtime safety guarantees.

---

## Upstream Core Immutability & Non-Supersession (ADR-008)

`domain-projection-spec` operates as an additive domain projection specification anchored under **ADR-008** and the Zero Operational Drag mandate ($C_{\text{ops}} = 0$).

- **Phase 7 Baseline Immutability:** In accordance with ADR-008, this repository does not unilaterally amend, alter, or supersede frozen Phase 7 baselines (`admissibilityscience.com` / `A-77-DELTA-SHIELD-LOCKED`).
- **No Unilateral Boundary Mutation:** Resolving a report does not authorize relaxing hard real-time execution ceilings ($\tau \le 11.99\,\text{ms}$, $S_{\text{max}} \le 4096\,\text{B}$, $M_{\text{alloc}} = 0$) or bypassing the formal proof model without updating **ARC-SPEC-2026-DPP-01** and citing the theoretical monograph (Zenodo DOI `10.5281/zenodo.24041851`).
- **Proof-Preserving Fixes:** Any patch to `runtime/` must preserve equivalence with the mechanized Coq theorems in `proofs/Invariants.v` and `proofs/Projection.v`.

---

## Scope & Bounded Claims

`domain-projection-spec` provides the canonical formal specification, mechanized Coq proofs, and freestanding `#![no_std]` reference projection engine for the Domain Projection Paradigm.

The repository explicitly does **not** claim:
- High-rate continuous hardware sensor drivers or raw ADC PHY interfaces;
- Production distributed cryptographic PKCS#11 HSM network infrastructure;
- Out-of-band asynchronous reconciliation queuing beyond local deterministic admission.

---

## Response Timeline

We will acknowledge receipt within **48 hours** and coordinate remediation, verification proof validation, and disclosure schedules asynchronously with zero operational drag ($C_{\text{ops}} = 0$).
