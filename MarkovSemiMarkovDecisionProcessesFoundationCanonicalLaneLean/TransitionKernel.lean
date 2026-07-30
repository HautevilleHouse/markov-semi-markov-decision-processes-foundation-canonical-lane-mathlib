import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure TransitionKernelPackage (S : Type u) (A : Type v) where
  transitionFunction : S -> A -> S -> Prop
  markovian : Prop
  timeHomogeneous : Prop
  consistency : Prop

structure TransitionKernelEvidence {S : Type u} {A : Type v}
    (K : TransitionKernelPackage S A) where
  markovianClosed : K.markovian
  timeHomogeneousClosed : K.timeHomogeneous
  consistencyClosed : K.consistency

def TransitionKernelClosed {S : Type u} {A : Type v}
    (K : TransitionKernelPackage S A) : Prop :=
  K.markovian ∧ K.timeHomogeneous ∧ K.consistency

theorem transition_kernel_closed_from_evidence
    {S : Type u} {A : Type v} (K : TransitionKernelPackage S A)
    (E : TransitionKernelEvidence K) : TransitionKernelClosed K := by
  exact And.intro E.markovianClosed
    (And.intro E.timeHomogeneousClosed E.consistencyClosed)

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse
