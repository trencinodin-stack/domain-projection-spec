Require Import Lia.
Require Import Bool.
Require Import DPP.Invariants.

Module Projection.

  Import Invariants.

  (** Continuous cyber-physical observation domain *)
  Record ContinuousObservation := {
    raw_signal : nat;
    sensor_timestamp : nat;
    noise_bound : nat;
  }.

  (** Discrete projected observation domain *)
  Record ProjectedDomain := {
    discretized_epoch : nat;
    passed_airlock : bool;
    associated_cap : Capability;
  }.

  (** Ingress projection function *)
  Definition project (obs : ContinuousObservation) (c : Capability) (threshold : nat) : ProjectedDomain :=
    {|
      discretized_epoch := obs.(sensor_timestamp);
      passed_airlock := (obs.(raw_signal) <=? threshold) && (check_I1 c);
      associated_cap := c;
    |}.

  (** Theorem: Successful projection unconditionally implies validity and explicit authority (I1) *)
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

  (** Theorem: A tripped mechanical stop (M_stop) safely rejects execution *)
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
