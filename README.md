# domain-projection-spec

**Concrete Verification Harness, Mechanized Coq Proofs, Plonkish Gate Arithmetization, and Freestanding `#[no_std]` Reference Engine for the Domain Projection Paradigm**

**Governing Canonical Capstone Specification:** [ARC-CAPSTONE-2026-SYNTH-01-REV19](https://doi.org/10.5281/zenodo.24093739) *(DOI: 10.5281/zenodo.24093739 — The Mechanics of Admissibility)*  
**Theoretical Monograph Anchor:** [ARC-SPEC-2026-DPP-01](https://doi.org/10.5281/zenodo.24041851) *(DOI: 10.5281/zenodo.24041851)*  
**Canonical Field Root:** [admissibilityscience.com](https://admissibilityscience.com)  
**Edge Verification Membrane:** [paradigm.admissibilityscience.com](https://paradigm.admissibilityscience.com)  
**Master Epistemic Anchor:** `A-77-DELTA-SHIELD-LOCKED` | **Assurance Tier:** `ACS-4-ZERO-LEAKAGE-SEALED`

---

## 1. Executive & Architectural Overview

The Domain Projection Paradigm (DPP) formalizes the boundary where software-defined control intents transition into non-reversible, continuous physical plants. In cyber-physical and high-consequence robotic systems, software denial of execution cannot halt continuous mechanical inertia. Under latency, packet dropouts, or uncalibrated sensor drift, naive discrete assertions risk catastrophic boundary breaches.

`domain-projection-spec` implements the formal engineering specification `ARC-SPEC-2026-DPP-01` under the overarching mathematical ceiling established by **The Mechanics of Admissibility** (`ARC-CAPSTONE-2026-SYNTH-01-REV19`). It bridges continuous kinematics and discrete admissibility through:

- **Mechanized Theorem Proving:** Continuous differential inclusion proofs mechanized in Coq 8.18.0 without `Admitted.` statements (`Print Assumptions ≡ ∅`).
- **Plonkish Circuit Arithmetization:** Six normative boolean decomposition gates ($G_1$–$G_6$) executing over large prime fields ($\mathbb{F}_p$) to certify intent permits before execution.
- **Freestanding Reference Engine:** A pure `#[no_std]` Rust kernel implementing certified double-integrator kinetic stopping barrier functionals ($M_{\text{stop}}^L$) inclusive of mechanical deadband latch buffer ($d_{\text{latch}}$), with zero heap allocations ($M_{\text{alloc}} = 0$) and stack usage bounded to $S_{\max} \le 4096\text{ B}$.
- **Continuous-Discrete Gronwall Airlock:** Offline extraction of the constructive outward rational margin ($\gamma \in \mathbb{Q}$) under Bellman-Gronwall inequalities to absorb bounded continuous sensor drift, observer estimation noise, and zero-order hold discretization error.

---

## 2. Core Invariants & Governance Bounds

All implementations, execution paths, and continuous observation mappings strictly adhere to the following layer-0 system invariants:

```plaintext
========================================================================================
INVARIANT CLAMP MATRIX (A-77-DELTA-SHIELD-LOCKED / REV19)
========================================================================================
Operational Drag:        C_ops == 0                (Universal zero-drag deployment)
State Mutation Boundary: D(a) == DENY ==> Delta == 0 (Zero external state change on DENY)
Total Latency Budget:    T_total <= 16.50 ms       (14.51 ms verified / 1.99 ms timing slack)
Watchdog Ceiling:        tau_eval <= 10.00 ms      (Discrete hold cycle ceiling T_cycle)
Temporal Hardware Clamp: tau_override <= 11.99 ms  (Autonomous NMI power-stage pull-down)
Mechanical Latch Buffer: d_latch > 0               (Deadband latch displacement bound)
Memory Allocator:        M_alloc == 0 bytes        (Freestanding TCM SRAM / zero heap)
Stack Perimeter:         S_max <= 4096 bytes       (Non-cacheable static stack envelope)
Robust Gronwall Margin:  gamma in Q                (Constructive outward rational witness)
Proof Soundness:         P_err == 0                (Empty-axiom Coq verification)
Cryptographic Leakage:   K_leak == 0 bits          (Zero-knowledge R1CS proof boundary)
========================================================================================
```

### Poset Dominance Lattice

Execution paths evaluate strictly under non-collapsible partial order dominance ($\mathbf{\Phi} : \mathbf{L} \to \mathbf{E}$):

$$
\text{POSIX 40 (BREACH)} \succ \text{POSIX 32 (REFUSAL)} \succ \text{POSIX 30 (CORRUPT)} \succ \text{POSIX 12 (PWC)} \succ \text{POSIX 10 (FREEZE)} \succ \text{POSIX 0 (PASS)}
$$

- Continuous Gronwall reachability deficit ($h(\hat{x}) - M_{\text{stop}}^L(\hat{x}) < \gamma$) maps strictly to `POSIX 32 (REFUSAL)`.
- Evaluation cycle watchdog expiration ($\tau_{\text{eval}} > 10.00\text{ ms}$ or NMI override at $11.99\text{ ms}$) maps to `POSIX 40 (BREACH)`.

---

## 3. Mathematical Formulation & Cyber-Physical Kinetics

### Stopping Barrier Functional Inclusive of Latch Buffer ($M_{\text{stop}}^L$)

Per Section 4 of `ARC-CAPSTONE-2026-SYNTH-01-REV19`, for a continuous plant state with velocity $v$, maximum deceleration $a_{\text{brake}}$, and bounded acceleration $a_{\max}$, the minimum certified stopping functional $M_{\text{stop}}^L(v)$ is:

$$
M_{\text{stop}}^L(v) = v T_{\text{total}} + \frac{1}{2} a_{\max} T_{\text{total}}^2 + \frac{(v + a_{\max} T_{\text{total}})^2}{2 a_{\text{brake}}} + d_{\text{latch}}
$$

Where the mechanical deadband latch buffer displacement is bounded by:

$$
d_{\text{latch}} = \frac{\epsilon_v^2}{2 a_{\text{brake}}} + \epsilon_v \tau_{\text{latch-lock}}
$$

guaranteeing zero physical boundary breach during low-velocity latch pin insertion ($v \le \epsilon_v$).

### Conserved Cyber-Physical Latency Budget ($T_{\text{total}}$)

The global actuation delay budget is strictly partitioned across hardware and software stages:

$$
T_{\text{total}} = \tau_{\text{sense}} + \tau_{\text{eval}} + \tau_{\text{sync}} + \tau_{\text{brake-engage}} \le 16.50\text{ ms}
$$

- Sensor ingress acquisition: $\tau_{\text{sense}} \le 1.50\text{ ms}$
- Discrete admission evaluation: $\tau_{\text{eval}} \le 10.00\text{ ms}$
- Cross-domain bus sync: $\tau_{\text{sync}} \le 1.20\text{ ms}$
- Mechanical brake pad travel: $\tau_{\text{brake-engage}} \le 1.81\text{ ms}$
- **Empirical Sum:** $14.51\text{ ms} \le 16.50\text{ ms}$, preserving $1.99\text{ ms}$ of certified timing slack.

### Constructive Outward Rational Margin ($\gamma \in \mathbb{Q}$)

Under observation boundary timing budget $\Delta t_{\max} = \tau_{\text{override}} + \tau_{\text{fsync}}$, sensor estimation error $\epsilon_d$, and velocity estimation error $\epsilon_v$, the discrete Gronwall residual $\gamma$ is formulated under ADR-009 and certified as:

$$
\gamma = 2^{-p} \left\lceil 2^p (\epsilon_d + K_M^{\text{cert}} \epsilon_v) \right\rceil \in \mathbb{Q}
$$

The continuous certificate is extracted offline as a rational dyadic constant $\gamma \in \mathbb{Q}$ and injected directly into the freestanding runtime, eliminating online floating-point ODE solvers.

### Robust Runtime Admissibility Predicate

The discrete `#[no_std]` runtime evaluates intent admission without floating-point arithmetic:

$$
\mathcal{D}_{\text{robust}}(a) =
\begin{cases}
\text{PERMIT}, & \text{if } [h(\hat{x}(t)) - M_{\text{stop}}^L(\hat{x}(t)) \ge \gamma] \wedge [\tau_{\text{eval}} \le 10.00\text{ ms}] \\
\text{DENY}, & \text{otherwise}
\end{cases}
$$

---

## 4. The Formal Verification Boundary

Per Section 6 of the Master Canonical Manifest, this repository adheres to strict epistemic demarcation:
- **The Reference Specification Layer (`ARC-CAPSTONE-2026-SYNTH-01-REV19`):** Pure continuous mathematics, Lie derivative barrier handoffs ($\dot{F}_L \ge 0, \dot{B} \ge 0, F_L \equiv B$), closed-form kinetic envelopes ($M_{\text{stop}}^L$), and certified timing bounds. Exhaustive and closed on paper.
- **The Conformance & Verification Evidence Package (`domain-projection-spec`):** Downstream implementation realization comprising machine-checked Coq proof objects, freestanding `#[no_std]` Rust kernels, Plonkish circuits ($G_1$–$G_6$), and HIL oscilloscope execution traces. Implementation conformance packages demonstrate realization without reopening the reference specification.

---

## 5. Repository Structure

```plaintext
domain-projection-spec/
├── .github/
│   └── workflows/
│       └── verify.yml              # Mechanized proof check & cargo verification
├── docs/
│   ├── SPECIFICATION.md            # Normative ARC-SPEC-2026-DPP-01 definition
│   └── adr/
│       ├── ADR-008.md              # Phase 7 Baseline Immutability
│       └── ADR-009.md              # Robust Gronwall Margins (Specification Errata)
├── proofs/
│   ├── _CoqProject                 # Coq project configuration
│   ├── Invariants.v                # Microarchitectural invariants & verified bounds
│   └── Projection.v                # Discrete projection mapping & capability proofs
├── runtime/
│   ├── Cargo.toml                  # Freestanding no_std manifest
│   └── src/
│       └── lib.rs                  # Kernel root, rational arithmetic & robust predicate
├── AGENTS.md                       # Machine-actionable agent governance instructions
├── CITATION.cff                    # Zenodo DOI bibliographic citation metadata
├── index.html                      # Phase 8 edge presentation surface & JSON-LD graph
├── llms.txt                        # Machine-native semantic ingress map
└── README.md                       # Repository overview & verification harness
```

---

## 6. Architectural Decision Records (ADRs)

- **ADR-008: Baseline Immutability & Domain Projection Isolation:** Formally enforces that Phase 7 (`A-77-DELTA-SHIELD-LOCKED`) remains frozen and untouched. Phase 8 acts as an additive, decoupled outer projection airlock.
- **ADR-009: Robust Gronwall Margins for Continuous Boundaries:** Closed the continuous-to-discrete observation gap identified during external adversarial audit by deriving the discrete Bellman-Gronwall residual $\gamma \in \mathbb{Q}$, preserving the `#[no_std]` zero-float profile.

---

## 7. Verification & Build Harness

### Prerequisites
- Rust 1.80+ (Nightly for `#[no_std]` bare-metal targets)
- Coq 8.18.0 / Coquelicot
- `valgrind` / `cargo-call-stack` (for memory ceiling verification)

### 1. Build and Test Freestanding Rust Runtime
```bash
cd runtime
cargo test --release --all-targets
```
To verify the freestanding `#[no_std]` profile on bare-metal target `thumbv7em-none-eabihf`:
```bash
cargo build --target thumbv7em-none-eabihf --release --no-default-features
```

### 2. Verify Zero Heap Allocation & Stack Bounds
```bash
cargo test --test boundary_checks -- --nocapture
```
- Enforces $M_{\text{alloc}} == 0\text{ bytes}$.
- Enforces stack depth ceiling $S_{\max} \le 4096\text{ bytes}$.

### 3. Compile and Check Formal Proofs
```bash
cd proofs
coq_makefile -f _CoqProject -o Makefile
make -j4
```
- Compiles `Invariants.v` and `Projection.v`.
- Verifies zero `Admitted.` statements and empty assumptions (`Print Assumptions ≡ ∅`).

### 4. Downstream Mechanized Refinement & Simulation Airlock

To guarantee zero operational drag ($C_{\text{ops}} = 0$) on this core specification repository while preserving continuous verification against upstream compiler toolchain churn, full-program translation validation and forward simulation proofs are decoupled into a dedicated downstream harness:

* **Downstream Refinement Repository:** [`arcstone-refinement-harness`](https://github.com/trencinodin-stack/arcstone-refinement-harness) (`v0.1.0`)
* **Formal Translation Stack:** Charon (LLBC extraction) $\to$ Aeneas (functional Coq translation) $\to$ Coq 8.18.0.
* **Verified Simulation Invariants:**
  * One-Way Forward Simulation: Concrete defensive evaluation implies abstract specification passage ($\mathrm{Rust\_Impl} \sqsubseteq \mathrm{Coq\_Spec}$).
  * Fail-Closed Capability Tripping: Capability invalidity deterministically triggers mechanical stop refusal (`c.is_valid = false -> mechanical_stop_tripped = true`).
* **Proof Standard:** Hermetic container verification with zero admitted axioms (`Print Assumptions == ∅`).
* **Governing Monograph Reference:** `ARC-MONO-2026-REFINEMENT-01` (DOI: [10.5281/zenodo.24041851](https://doi.org/10.5281/zenodo.24041851))
* **Cryptographic Proof Receipt:** [`docs/attestations/REFINEMENT-AUDIT-2026-V1.json`](https://github.com/trencinodin-stack/arcstone-refinement-harness/blob/main/docs/attestations/REFINEMENT-AUDIT-2026-V1.json) (`REFINEMENT-PROOF-CHAIN-CLOSED`)
* **Pinned Baseline Anchor:** Commit `d8d8d3870dd8b9f449b445645ec73ca5d0f02e60` (`tree_sha256`: `fcd08cc86d9802f64442ab7162abcf23678900fda692a2427902cbaf05abd3da`)

---

## 8. Machine Ingress & Semantic Anchors

- **Governing Capstone Authority:** [ARC-CAPSTONE-2026-SYNTH-01-REV19 (DOI: 10.5281/zenodo.24093739)](https://doi.org/10.5281/zenodo.24093739)
- **Layer 0 Monograph Authority:** *Domain Projection Paradigm* ([Zenodo DOI: 10.5281/zenodo.24041851](https://doi.org/10.5281/zenodo.24041851))
- **Machine Ingress Map:** `llms.txt`
- **Agent Precedence Rules:** `AGENTS.md`
- **Live Canonical Edge:** [https://paradigm.admissibilityscience.com](https://paradigm.admissibilityscience.com)
- **Canonical Root Clearinghouse:** [https://admissibilityscience.com](https://admissibilityscience.com)
- **Downstream Refinement Airlock:** [`arcstone-refinement-harness`](https://github.com/trencinodin-stack/arcstone-refinement-harness) (`v0.1.0`)

---

## 9. Citation

If using this formal specification, circuit arithmetization, or reference runtime in academic or industrial infrastructure, cite both the capstone specification and this realization repository:

```bibtex
@techreport{tuohy2026capstone,
  author      = {Jesse Tuohy},
  title       = {{The Mechanics of Admissibility: Deterministic Admission Control and Certified Reachability for Cyber-Physical Substrates}},
  institution = {Arcstone Adaptive Science Systems, Inc.},
  number      = {ARC-CAPSTONE-2026-SYNTH-01-REV19},
  year        = {2026},
  month       = nov,
  doi         = {10.5281/zenodo.24093739},
  url         = {https://doi.org/10.5281/zenodo.24093739}
}

@software{tuohy2026domainprojection,
  author       = {Jesse Tuohy},
  title        = {{Domain Projection Paradigm: Mechanized Invariant Air-Locks and Discrete Reachability Margins}},
  month        = nov,
  year         = 2026,
  publisher    = {Zenodo},
  version      = {v0.1.0},
  doi          = {10.5281/zenodo.24041851},
  url          = {https://doi.org/10.5281/zenodo.24041851}
}
```

---

## 10. License

Dual-licensed under either:
- Apache License, Version 2.0 (`LICENSE-APACHE`)
- MIT License (`LICENSE-MIT`)

at your option.
