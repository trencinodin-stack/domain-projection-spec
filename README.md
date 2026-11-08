# domain-projection-spec

**Concrete Verification Harness, Mechanized Coq Proofs, Plonkish Gate Arithmetization, and Freestanding `#![no_std]` Reference Engine for the Domain Projection Paradigm**

## 1. Executive & Architectural Overview

The Domain Projection Paradigm (DPP) formalizes the boundary where software-defined control intents transition into non-reversible, continuous physical plants. In cyber-physical and high-consequence robotic systems, software denial of execution cannot halt continuous mechanical inertia. Under latency, packet dropouts, or uncalibrated sensor drift, naive discrete assertions risk catastrophic boundary breaches.

`domain-projection-spec` implements the formal specification `ARC-SPEC-2026-DPP-01`. It bridges continuous kinematics and discrete admissibility through:

- **Mechanized Theorem Proving:** Continuous differential inclusion proofs mechanized in Coq 8.18.0 without `Admitted.` statements.

- **Plonkish Circuit Arithmetization:** Six normative boolean decomposition gates ($G_1$–$G_6$) executing over large prime fields ($\mathbb{F}_p$) to certify intent permits before execution.

- **Freestanding Reference Engine:** A pure `#![no_std]` Rust kernel implementing worst-case double-integrator braking bounds ($M_{\text{stop}}$) with zero heap allocations ($M_{\text{alloc}} = 0$) and stack usage bounded to $\le 4096\text{ B}$.

- **Continuous-Discrete Gronwall Airlock:** Offline extraction of the rational reachability margin ($\gamma \in \mathbb{Q}$) under Bellman-Gronwall inequalities to absorb bounded continuous sensor drift and temporal dropouts.

## 2. Core Invariants & Governance Bounds

All implementations, execution paths, and continuous observation mappings strictly adhere to the following layer-0 system invariants:

```plaintext
========================================================================================
INVARIANT CLAMP MATRIX (A-77-DELTA-SHIELD-LOCKED)
========================================================================================
Operational Drag:        C_ops == 0                (Zero synchronous human intervention)
State Mutation Boundary: D(a) == DENY ==> Delta == 0 (Zero external state change on non-PASS)
Temporal Ceiling:        tau_override <= 11.99ms   (Hard NMI bare-metal circuit breaker)
Mechanical Delay Window: Delta_t_max <= 13.19ms    (tau_override [11.99ms] + tau_fsync [1.20ms])
Memory Allocator:        M_alloc == 0 bytes        (Freestanding TCM SRAM / zero heap)
Memory Perimeter:        S_max <= 4096 bytes       (Non-cacheable bounded stack)
Robust Gronwall Margin:  gamma in Q                (Bellman-Gronwall residual witness)
Proof Soundness:         P_err == 0                (Machine-checked Coq proofs)
Cryptographic Leakage:   K_leak == 0 bits          (Zero-knowledge R1CS proof boundary)
========================================================================================
```

### Poset Dominance Lattice

Execution paths evaluate strictly under non-collapsible partial order dominance:

$$
\text{POSIX 40 (BREACH)} > \text{POSIX 32 (REFUSAL)} > \text{POSIX 30 (CORRUPT)} > \text{POSIX 12 (PWC)} > \text{POSIX 10 (FREEZE)} > \text{POSIX 0 (PASS)}
$$

## 3. Mathematical Formulation

### Double-Integrator Kinetic Stopping Functional ($M_{\text{stop}}$)

For a continuous 1D plant state $x = [p, v]^T$ governed by $\ddot{p}(t) = u(t) + d(t)$ with maximum deceleration $a_{\max} > 0$ and bounded disturbance $\Vert{}d(t)\Vert{} \le d_{\max}$, the minimum stopping distance functional $M_{\text{stop}}(x)$ is:

$$
M_{\text{stop}}(x) =
\begin{cases}
\dfrac{v^2}{2 (a_{\max} - d_{\max})}, & v > 0 \\
0, & v \le 0
\end{cases}
$$

### Continuous-Discrete Gronwall Margin ($\gamma$)

Under observation boundary timing budget $\Delta t_{\max} = \tau_{\text{override}} + \tau_{\text{fsync}} = 13.19\text{ ms}$, sensor drift bounded by $\varepsilon = \mathrm{noise\_bound}$, and composite Lipschitz constant $L = L_f + L_g \Vert{}u\Vert{}_\infty$, the discrete Gronwall residual $\gamma$ is formulated under ADR-009 as:

$$
\gamma = \varepsilon e^{L \Delta t_{\max}} + \frac{d_{\max}}{L} \left( e^{L \Delta t_{\max}} - 1 \right)
$$

The continuous certificate is extracted offline as a rational constant $\gamma \in \mathbb{Q}$ and injected directly into the freestanding runtime.

### Robust Runtime Admissibility Predicate

The discrete `#![no_std]` runtime evaluates intent admission without invoking continuous ODE solvers or floating-point arithmetic:

$$
\mathcal{D}_{\text{robust}}(a) =
\begin{cases}
\text{PERMIT}, & \text{if } [h(\hat{x}(t)) - M_{\text{stop}}(\hat{x}(t)) \ge \gamma] \wedge [\tau_{\text{eval}} \le \tau_{\text{override}}] \\
\text{DENY}, & \text{otherwise}
\end{cases}
$$

## 4. Repository Structure

```plaintext
domain-projection-spec/
├── .github/
│   └── workflows/
│       ├── coq-ci.yml              # Mechanized proof validation (Coq 8.18.0)
│       └── runtime-ci.yml          # Bounded stack, zero-heap Rust validation
├── docs/
│   ├── adr/
│   │   ├── ADR-008.md              # Phase 7 Baseline Immutability
│   │   └── ADR-009.md              # Robust Gronwall Margins (Specification Errata)
│   └── circuits/
│       └── plonkish_gates.md       # Formal specifications for gates G1 through G6
├── proofs/
│   ├── Kinematics.v                # Continuous double-integrator dynamics
│   ├── Projection.v                # Discrete projection mapping & Gronwall residual
│   └── Soundness.v                 # Zero-error inductive invariant lemmas
├── runtime/
│   ├── Cargo.toml                  # Freestanding no_std manifest
│   ├── src/
│   │   ├── airlock.rs              # Robust predicate D_robust(a)
│   │   ├── gates.rs                # 64-bit decomposition arithmetic
│   │   ├── lib.rs                  # Kernel root
│   │   └── rational.rs             # Fixed-point Q-arithmetic (zero float)
│   └── tests/
│       └── boundary_checks.rs      # Valgrind zero-heap & latency benchmarks
├── AGENTS.md                       # Machine-actionable agent governance instructions
├── CITATION.cff                    # Zenodo DOI bibliographic citation metadata
├── llms.txt                        # Machine-native semantic ingress map
└── SPECIFICATION.md                # Normative ARC-SPEC-2026-DPP-01 definition
```

## 5. Architectural Decision Records (ADRs)

**ADR-008: Baseline Immutability & Domain Projection Isolation:** Formally enforces that Phase 7 (A-77-DELTA-SHIELD-LOCKED) remains frozen and untouched. Phase 8 acts as an additive, decoupled outer projection airlock.

**ADR-009: Robust Gronwall Margins for Continuous Boundaries:** Closed the continuous-to-discrete observation gap identified during external adversarial audit by deriving the discrete Bellman-Gronwall residual $\gamma \in \mathbb{Q}$, preserving the `#![no_std]` zero-float profile.

## 6. Verification & Build Harness

### Prerequisites

- Rust 1.80+ (Nightly for `#![no_std]` bare-metal targets)
- Coq 8.18.0 / Coquelicot
- `valgrind` / `cargo-call-stack` (for memory ceiling verification)

### 1. Build and Test Freestanding Rust Runtime

```bash
cd runtime
cargo test --release --all-targets
```

To verify the freestanding `#![no_std]` profile on bare-metal target `thumbv7em-none-eabihf`:

```bash
cargo build --target thumbv7em-none-eabihf --release --no-default-features
```

### 2. Verify Zero Heap Allocation & Stack Bounds

```bash
cargo test --test boundary_checks -- --nocapture
```

Enforces $M_{\text{alloc}} == 0\text{ bytes}$.

Enforces stack depth $\le 4096\text{ bytes}$.

### 3. Compile and Check Formal Proofs

```bash
cd proofs
coq_makefile -f _CoqProject -o Makefile
make -j4
```

Compiles `Kinematics.v`, `Projection.v`, and `Soundness.v`.

Verifies zero `Admitted.` statements ($P_{\text{err}} = 0$).

## 7. Machine Ingress & Semantic Anchors

This repository is optimized for autonomous ingestion by agentic crawlers, verification bots, and LLM reasoning networks.

- **Machine Ingress Map:** `llms.txt`
- **Agent Precedence Rules:** `AGENTS.md`
- **Live Canonical Edge:** paradigm.admissibilityscience.com
- **Layer 0 Monograph Authority:** *The Re-Entrancy of Intent: Cyber-Physical Observation Boundaries and Domain Projection* (Zenodo DOI: 10.5281/zenodo.24041851)

## 8. Citation

If using this formal specification, circuit arithmetization, or reference runtime in academic or industrial infrastructure, cite as follows:

```bibtex
@software{tuohy2026domainprojection,
  author       = {Jesse Tuohy},
  title        = {{Domain Projection Paradigm: Mechanized Invariant Air-Locks and Discrete Reachability Margins}},
  month        = nov,
  year         = 2026,
  publisher    = {Zenodo},
  version      = {v1.0.0},
  doi          = {10.5281/zenodo.24041851},
  url          = {https://doi.org/10.5281/zenodo.24041851}
}
```

## 9. License

Dual-licensed under either:

- Apache License, Version 2.0 (`LICENSE-APACHE`)
- MIT License (`LICENSE-MIT`)

at your option.
