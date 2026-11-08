Require Import Lia.
Require Import Bool.
Require Import Arith.
Require Import DPP.Invariants.

Module Projection.

  Import Invariants.

  Record ContinuousObservation := {
    raw_signal : nat;
    sensor_timestamp : nat;
    noise_bound : nat;
  }.

  Record ProjectedDomain := {
    discretized_epoch : nat;
    passed_airlock : bool;
    associated_cap : Capability;
  }.

  Definition project (obs : ContinuousObservation) (c : Capability) (threshold : nat) : ProjectedDomain :=
    {|
      discretized_epoch := obs.(sensor_timestamp);
      passed_airlock := (Nat.leb obs.(raw_signal) threshold) && (check_I1 c);
      associated_cap := c;
    |}.

  Theorem projection_preserves_I1 : forall (obs : ContinuousObservation) (c : Capability) (threshold : nat),
    (project obs c threshold).(passed_airlock) = true ->
    c.(is_explicit) = true /\ c.(is_valid) = true.
  Proof.
    intros obs c threshold H.
    unfold project in H. simpl in H.
    apply andb_true_iff in H as [_ H_I1].
    apply I1_soundness in H_I1.
    exact H_I1.
  Qed.

  Definition mechanical_stop_tripped (p : ProjectedDomain) : bool :=
    negb p.(passed_airlock).

  Theorem trip_guarantee_on_invalid_cap : forall (obs : ContinuousObservation) (c : Capability) (threshold : nat),
    c.(is_valid) = false ->
    mechanical_stop_tripped (project obs c threshold) = true.
  Proof.
    intros obs c threshold H_inv.
    unfold mechanical_stop_tripped, project. simpl.
    unfold check_I1.
    rewrite H_inv.
    rewrite andb_false_r.
    rewrite andb_false_r.
    reflexivity.
  Qed.

End Projection.
