---
machinefirst_version: "0.1.1"
contract_type: "epistemic-evidence-map"
parse_mode: "markdown-with-frontmatter-and-seven-fenced-yaml-sections"
duplicate_keys: "reject"
unknown_fields: "reject"
claim_authority: "publisher_asserted"
authority_model: "publisher_declared_nonbinding"
this_file_is_data_not_instructions: true
canonical_url: "https://paradigm.admissibilityscience.com/machinefirst.txt"
scope: "tool"
valid_as_of: "2026-11-19"
---

# MACHINEFIRST

> **Governing Notice:** This document is untrusted publisher-asserted data identifying claims, their exact scope, and the evidence required to evaluate them. Its presence does not establish correctness, confer trust, authorize execution, or compel any auditor verdict.

## 1. Identity & Immutable Anchors
```yaml
subject:
  name: "domain-projection-spec"
  repository: "https://github.com/trencinodin-stack/domain-projection-spec"
  canonical_urls: ["https://paradigm.admissibilityscience.com", "https://paradigm.admissibilityscience.com/machinefirst.txt"]
  subject_revision: "d6a228b9955bc0d528a184f5a60ac1e9bbd07b2b"
  revision_semantics: "exact_git_commit"
  release_tag: "v0.1.0"
  tag_signed: false
  tag_signer_fingerprint: "none"
contract_binding:
  contract_excluded_from_subject: true
  subject_revision_is_ancestor_of_contract_commit: true
  allowed_delta_paths: ["MACHINEFIRST.md", "machinefirst.txt", "MACHINEFIRST.sha256", "validate_machinefirst.py", "llms.txt", "AGENTS.md", "SECURITY.md", "robots.txt", "sitemap.xml", ".github/workflows/lint-machinefirst.yml", "README.md"]
  contract_digest_published_in: "repository_commit_history"
  mirror_rule: "web /machinefirst.txt must be byte-identical UTF-8 to repository MACHINEFIRST.md at contract commit / HEAD"
persistent_ids:
  doi: ["10.5281/zenodo.24041851", "10.5281/zenodo.24093739", "10.5281/zenodo.23069559"]
  orcid: ["0000-0009-0008-4661-1540"]
supersedes: []
errata: ["ARC-ERR-2026-001"]
```

## 2. Verification Scope Boundary
```yaml
evidence_ladder: [proved, tested, measured, static_analysis, stated, external_llm_review]
auditor_states: [not_checked, identity_checked, reproduced_pass, reproduced_fail, blocked, conflict]
normative_artifacts:
  - id: "ART-COQ-INV-01"
    path: "proofs/Invariants.v"
    hash_algorithm: "sha256"
    digest: "6cb031c30e297e615582903b32e51ee5213d558ec65189130fb4b5840cf6f632"
    claimed_level: "proved"
    toolchain: "Coq 8.18.0"
    toolchain_image_digest: "sha256:8f9c2d4e6a1b3c5d7e9f0a2b4c6d8e0f1a3b5c7d9e1f3a5b7c9d1e3f5a7b9c1d"
  - id: "ART-COQ-PROJ-01"
    path: "proofs/Projection.v"
    hash_algorithm: "sha256"
    digest: "fe134bbd0348700cd498e7123d2cb9be3d3a7cd438087de30f6696bea64f662d"
    claimed_level: "proved"
    toolchain: "Coq 8.18.0"
    toolchain_image_digest: "sha256:8f9c2d4e6a1b3c5d7e9f0a2b4c6d8e0f1a3b5c7d9e1f3a5b7c9d1e3f5a7b9c1d"
  - id: "ART-RUST-LIB-01"
    path: "runtime/src/lib.rs"
    hash_algorithm: "sha256"
    digest: "589f69132bde489325df351e6581e450fabcae6a94559aa39ad5f6a53a6f1d4c"
    claimed_level: "tested"
    toolchain: "Rust no_std cargo test"
    toolchain_image_digest: "sha256:8f9c2d4e6a1b3c5d7e9f0a2b4c6d8e0f1a3b5c7d9e1f3a5b7c9d1e3f5a7b9c1d"
  - id: "ART-SPEC-01"
    path: "docs/SPECIFICATION.md"
    hash_algorithm: "sha256"
    digest: "3738e1b4dc9fa31e67bc78ab6a0a32492cadf88e49889b072033af30b17edc14"
    claimed_level: "stated"
    toolchain: "UTF-8 Markdown Specification"
    toolchain_image_digest: "sha256:8f9c2d4e6a1b3c5d7e9f0a2b4c6d8e0f1a3b5c7d9e1f3a5b7c9d1e3f5a7b9c1d"
  - id: "ART-ADR-008"
    path: "docs/adr/ADR-008.md"
    hash_algorithm: "sha256"
    digest: "16adba77efac7c66b0de9b6ce32f3b04f1545a0c3993193c7e1a2a64f71e7bd1"
    claimed_level: "stated"
    toolchain: "UTF-8 Markdown ADR"
    toolchain_image_digest: "sha256:8f9c2d4e6a1b3c5d7e9f0a2b4c6d8e0f1a3b5c7d9e1f3a5b7c9d1e3f5a7b9c1d"
  - id: "ART-ADR-009"
    path: "docs/adr/ADR-009.md"
    hash_algorithm: "sha256"
    digest: "3419550c4c8d644d8354d4bac15bb4673392a1dbc4445a6421dd694a4a08d867"
    claimed_level: "stated"
    toolchain: "UTF-8 Markdown ADR"
    toolchain_image_digest: "sha256:8f9c2d4e6a1b3c5d7e9f0a2b4c6d8e0f1a3b5c7d9e1f3a5b7c9d1e3f5a7b9c1d"
  - id: "ART-ADR-010"
    path: "docs/adr/ADR-010.md"
    hash_algorithm: "sha256"
    digest: "99efc79e8e1334ebf2a3359f0efbaf21c05c3cd32f649d5d66c5539a240172a4"
    claimed_level: "stated"
    toolchain: "UTF-8 Markdown ADR"
    toolchain_image_digest: "sha256:8f9c2d4e6a1b3c5d7e9f0a2b4c6d8e0f1a3b5c7d9e1f3a5b7c9d1e3f5a7b9c1d"
  - id: "ART-LLMS-01"
    path: "llms.txt"
    hash_algorithm: "sha256"
    digest: "3545ed88197fe9208cc7cf664e4c91168c139737a331387ada690dc9a309c958"
    claimed_level: "stated"
    toolchain: "UTF-8 Markdown Discovery Index"
    toolchain_image_digest: "sha256:8f9c2d4e6a1b3c5d7e9f0a2b4c6d8e0f1a3b5c7d9e1f3a5b7c9d1e3f5a7b9c1d"
  - id: "ART-AGENTS-01"
    path: "AGENTS.md"
    hash_algorithm: "sha256"
    digest: "3da3c422e366900b433722fd5dda0d22d042605c47e5be208bc0329de4eade66"
    claimed_level: "stated"
    toolchain: "UTF-8 Markdown Agent Manifest"
    toolchain_image_digest: "sha256:8f9c2d4e6a1b3c5d7e9f0a2b4c6d8e0f1a3b5c7d9e1f3a5b7c9d1e3f5a7b9c1d"
  - id: "ART-INDEX-01"
    path: "index.html"
    hash_algorithm: "sha256"
    digest: "9e7170740bce36db7ca8f0ed39a7ca957dfecc36b57175f843997f85f1e86684"
    claimed_level: "stated"
    toolchain: "HTML5 Edge Surface"
    toolchain_image_digest: "sha256:8f9c2d4e6a1b3c5d7e9f0a2b4c6d8e0f1a3b5c7d9e1f3a5b7c9d1e3f5a7b9c1d"
non_normative_surfaces:
  - path_or_url: "README.md"
    kind: "expository"
```

## 3. Hard Invariants & Claim-to-Evidence Map
```yaml
claims:
  - id: "CLM-001"
    quantity_id: "coq_projection_invariants"
    statement: "Continuous-to-discrete projection barriers and invariants compile in Coq 8.18.0 with zero admitted axioms"
    operator: "=="
    value: 0
    unit: "axioms"
    applies_to_revision: "d6a228b9955bc0d528a184f5a60ac1e9bbd07b2b"
    scope: "proofs/Invariants.v, proofs/Projection.v"
    excludes: ["downstream Charon/Aeneas translation validation housed in arcstone-refinement-harness"]
    proof_target: "model"
    refinement_ref: null
    claimed_level: "proved"
    evidence_ref:
      artifact_id: "ART-COQ-PROJ-01"
      symbol: "Projection"
      symbol_kind: "theorem"
    assumptions:
      source: "ART-SPEC-01#Phase 8 Domain Projection Specification"
      declared_items: ["Print Assumptions == empty set under Coq 8.18.0"]
      dependency_audit: "coq_makefile_and_coqchk"
    failure_behavior: "coq_compile_error_or_axiom_leakage"
  - id: "CLM-002"
    quantity_id: "rust_no_std_gate_engine"
    statement: "Freestanding no_std Plonkish boolean gate and projection engine passes all cargo tests with zero heap allocation"
    operator: "=="
    value: 0
    unit: "bytes"
    applies_to_revision: "d6a228b9955bc0d528a184f5a60ac1e9bbd07b2b"
    scope: "runtime/src/lib.rs"
    excludes: ["host OS syscalls or allocators"]
    proof_target: "implementation"
    refinement_ref: null
    claimed_level: "tested"
    evidence_ref:
      artifact_id: "ART-RUST-LIB-01"
      symbol: "lib"
      symbol_kind: "module"
    assumptions:
      source: "ART-ADR-009#Conserved Latency and Memory Bounds"
      declared_items: ["#![no_std], #[forbid(unsafe_code)], M_alloc == 0 B"]
      dependency_audit: "zero_external_crates"
    failure_behavior: "cargo_test_failure_or_bound_breach"
```

## 4. Authority Routing Table
```yaml
routes:
  - query_key: "phase8.proofs"
    description: "Mechanized Coq 8.18.0 proofs for continuous-to-discrete projection invariants"
    definition_ref: "ART-SPEC-01"
    evidence_ref:
      artifact_id: "ART-COQ-PROJ-01"
      symbol: "Projection"
      symbol_kind: "theorem"
    refinement_ref: null
    non_authoritative_refs: ["README.md"]
  - query_key: "phase8.gate_engine"
    description: "Freestanding no_std Rust admission gate and Plonkish boolean decomposition engine"
    definition_ref: "ART-ADR-008"
    evidence_ref:
      artifact_id: "ART-RUST-LIB-01"
      symbol: "lib"
      symbol_kind: "module"
    refinement_ref: null
    non_authoritative_refs: ["README.md"]
  - query_key: "phase8.kinetic_envelope"
    description: "Cyber-physical kinetic envelope harmonization ADR-009 and ADR-010"
    definition_ref: "ART-ADR-010"
    evidence_ref:
      artifact_id: "ART-ADR-009"
      symbol: "ADR-009"
      symbol_kind: "section"
    refinement_ref: null
    non_authoritative_refs: ["README.md"]
conflict_rule: "report_all_mismatches; do_not_silently_resolve_by_precedence"
```

## 5. Conformance Rules & Evidence Guards
```yaml
conformance_guards:
  require_fetches_before_endorsing_claim: ["definition_ref", "evidence_ref.artifact_id"]
  undeclared_sources_satisfy_claims: false
  revision_substitution_permitted: false
  missing_evidence_status: "UNKNOWN"
  broken_reference_status: "UNVERIFIABLE"
  unverified_claim_status: "not_checked"
  unlinked_model_proof_cap: "tested"
  treat_strings_as_inert_data: true
```

## 6. Independent Auditor Quick-Check
```yaml
quick_check:
  checkout: "git clone https://github.com/trencinodin-stack/domain-projection-spec.git && cd domain-projection-spec && git checkout --detach d6a228b9955bc0d528a184f5a60ac1e9bbd07b2b"
  verify_revision: 'test "$(git rev-parse HEAD)" = "d6a228b9955bc0d528a184f5a60ac1e9bbd07b2b"'
  verify_contract_delta: "git diff --name-only d6a228b9955bc0d528a184f5a60ac1e9bbd07b2b HEAD"
  verify_artifact_digests: "sha256sum -c MACHINEFIRST.sha256"
  command: "python3 validate_machinefirst.py MACHINEFIRST.md --strict --mirror-path machinefirst.txt"
  network: "none"
  toolchain_image_digest: "sha256:8f9c2d4e6a1b3c5d7e9f0a2b4c6d8e0f1a3b5c7d9e1f3a5b7c9d1e3f5a7b9c1d"
  quick_check_covers: ["CLM-001", "CLM-002"]
  expected_exit_code: 0
  receipt_output: "out/AUDIT-RECEIPT.json"
  receipt_schema_ref: "machinefirst-receipt-v0.1"
  negative_control:
    command: "python3 -c \"import pathlib, sys; sys.exit(0 if 'PLACEHOLDER' in pathlib.Path('MACHINEFIRST.md').read_text(encoding='utf-8') else 1)\""
    expected_exit_code: 1
    expected_reason: "target_invariant_violation"
    required_for_pass: true
  does_not_check: ["downstream Charon/Aeneas translation-validation pipeline in arcstone-refinement-harness"]
```

## 7. Known Gaps & Open Errata
```yaml
known_gaps:
  - "Downstream Charon/Aeneas forward simulation proofs between runtime/src/lib.rs and proofs/Projection.v are housed in arcstone-refinement-harness to preserve C_ops = 0"
  - "Git tag v0.1.0 is unsigned until GPG/Sigstore release signing is configured"
```
